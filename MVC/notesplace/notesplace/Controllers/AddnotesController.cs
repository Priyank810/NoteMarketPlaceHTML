using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using notesplace.Models;
using System.IO;
using System.Net.Mail;

namespace notesplace.Controllers
{
    [Authorize(Roles ="member")]
    [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
    public class AddnotesController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: Addnotes

        //adding notes
        public ActionResult add(int? nid)
        {
            var getuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            var userprofilestatus = context.userdetails.Where(x => x.usserid == getuser.id).FirstOrDefault();

            if (userprofilestatus != null)
            {
                ViewBag.image = userprofilestatus.profilepicture;
                ViewBag.category = categorylist();
                ViewBag.notetype = typelistlist();
                ViewBag.country = countrylist();

                if(nid!=null)
                {
                    addbooks addbook = new addbooks();
                    var ebooks = (from book in context.notedetails
                                  join category in context.category
                                  on book.categoryid equals category.id
                                  join type in context.notetype
                                  on book.typeid equals type.id
                                  join country in context.country
                                  on book.countryid equals country.id
                                  join status in context.statustype
                                  on book.statusid equals status.id
                                  join notesa in context.noteattachment
                                  on book.id equals notesa.noteid

                                  where book.id == nid

                                  select new addbooks
                                  { 
                                      title = book.title,
                                      typeid = type.id.ToString(),
                                      categoryid = category.id.ToString(),
                                      description = book.description,
                                      sellprice = book.sellprice,
                                      institutename = book.universityname,
                                      countryid = country.id.ToString(),
                                      coursename = book.coursename,
                                      coursecode = book.coursecode,
                                      professor = book.professor,
                                      numberofpages = (int)book.numberofpages,
                                  }).ToList().FirstOrDefault();
                    
                    addbook = ebooks;
                    return View(addbook);
                }

                return View();
            }
            return RedirectToAction("userprofile", "userprofile");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult add(addbooks note, string save)
        {
            var getuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            var userprofilestatus = context.userdetails.Where(x => x.usserid == getuser.id).FirstOrDefault();
            ViewBag.image = userprofilestatus.profilepicture;
            ViewBag.category = categorylist();
            ViewBag.notetype = typelistlist();
            ViewBag.country = countrylist();

            if (note.ispaid == 1)
            {
                if (note.previewfile == null)
                {
                    ModelState.AddModelError("previewfile", "PLEASE ADD PREVIEW FILE");
                    return View();
                }
            }
            if (note.displaypicture != null)
            {
                var ext = Path.GetExtension(note.displaypicture.FileName).ToLower();
                if (ext != ".jpg" || ext != ".jpeg" || ext != ".png")
                {
                    ModelState.AddModelError("imgfile", "Pleade add display picture with proper extension");
                    return View();
                }
            }
            if (ModelState.IsValid)
            {

                string status = "draft";
                if(save==null)
                {
                    status = "submittedforreview";
                }
           
                var userid = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
                var statusid = context.statustype.Where(x => x.status == status).FirstOrDefault();
                var id = Convert.ToInt32(note.categoryid);
                var categoryid = context.category.Where(x => x.id == id).FirstOrDefault();
                id = Convert.ToInt32(note.typeid);
                var typeid = context.notetype.Where(x => x.id == id).FirstOrDefault();
                id = Convert.ToInt32(note.countryid);
                var countryid = context.country.Where(x => x.id == id).FirstOrDefault();
                var now = DateTime.Now;
                bool paid = true;
                
                if(note.ispaid==0)
                {
                    paid = false;
                    note.sellprice = 0;
                }
                if(note.ispaid==1)
                {
                    if (note.sellprice == null)
                    {
                        ModelState.AddModelError("sellprice", "sellprice required");
                        return View();
                    }
                    if(note.previewfile==null)
                    {
                        ModelState.AddModelError("previewfile", "previewfile required");
                        return View();
                    }
                }
                notedetails newnote = new notedetails();

                newnote.userid = userid.id;
                newnote.statusid = statusid.id;
                newnote.actionby = null;
                newnote.remarks = null;
                newnote.approveddate = null;
                newnote.title = note.title;
                newnote.categoryid = categoryid.id;
                newnote.typeid = typeid.id;
                newnote.numberofpages = note.numberofpages;
                newnote.description = note.description;
                newnote.countryid = countryid.id;
                newnote.universityname = note.institutename;
                newnote.coursename = note.coursename;
                newnote.coursecode = note.coursecode;
                newnote.professor = note.professor;
                newnote.ispaid = paid;
                newnote.sellprice = note.sellprice;
                newnote.createdby = userid.id;
                newnote.createddate = now;
                newnote.modifiedby = null;
                newnote.modifieddate = null;
                newnote.isActive = true;

                context.notedetails.Add(newnote);
                context.SaveChanges();


                //************************************************
                string dppath = null;
                string previewfilepath = null;
                string pdffilepath = null;
                string attachmentfilename = null;
                string extension = null;
                
                string folderpath = Server.MapPath("~/Members/" + newnote.userid.ToString() + "/" + newnote.id.ToString() + "/");
                if (!Directory.Exists(folderpath))
                {
                    Directory.CreateDirectory(folderpath);
                }

                if (note.displaypicture != null)
                {
                    extension = Path.GetExtension(note.displaypicture.FileName).ToLower();
                    if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                    {
                        string path = Server.MapPath("~/Members/" + newnote.userid.ToString() + "/" + newnote.id.ToString() + "/");
                        string fileName = "DP_" + now.ToString().Replace(':', '-') + extension;
                        string fullpath = Path.Combine(path + fileName);
                        dppath = "~/Members/" + (newnote.userid).ToString() + "/" + (newnote.id).ToString() + "/" + fileName;
                        note.displaypicture.SaveAs(fullpath);
                    }
                    else
                    {
                        ModelState.AddModelError("displaypicture", "Please Add file with proper extension");
                        return View();
                    }
                }

                if (note.previewfile != null)
                {
                    extension = Path.GetExtension(note.previewfile.FileName).ToLower();
                    if (extension == ".pdf" || extension == ".docx" || extension == ".doc")
                    {
                        string path = Server.MapPath("~/Members/" + (newnote.userid).ToString() + "/" + (newnote.id).ToString());
                        string fileName = "Preview_" + now.ToString().Replace(':', '-') + extension;
                        string fullpath = Path.Combine(path, fileName);
                        previewfilepath = "~/Members/" + (newnote.userid).ToString() + "/" + (newnote.id).ToString() + "/" + fileName;
                        note.previewfile.SaveAs(fullpath);
                    }
                    else
                    { 
                        ModelState.AddModelError("previewfile", "Please Add file with proper extension");
                        return View();
                    }
                }

                string attachmentfolderpath = Server.MapPath("~/Members/Attachments/" + (newnote.userid).ToString() + "/" + (newnote.id).ToString());
                if (!Directory.Exists(attachmentfolderpath))
                {
                    Directory.CreateDirectory(attachmentfolderpath);
                }
                int counter = 1;
                foreach (var pdff in note.notes)
                {
                    if (pdff != null)
                    {
                        extension = Path.GetExtension(pdff.FileName).ToLower();
                        if (extension == ".pdf" || extension == ".docx" || extension == ".doc")
                        {
                            string path = Server.MapPath("~/Members/Attachments/" + (newnote.userid).ToString() + "/" + (newnote.id).ToString());
                            string fileName = counter.ToString() + "Attachment" + newnote.id.ToString() + "_" + now.ToString().Replace(':', '-') + extension;
                            string fullpath = Path.Combine(path, fileName);
                            pdffilepath = "~/Members/Attachments/" + (newnote.userid).ToString() + "/" + (newnote.id).ToString() + "/";
                            attachmentfilename += fileName + ";";
                            pdff.SaveAs(fullpath);
                            counter++;
                        }
                        else
                        {
                            ModelState.AddModelError("notes", "Please add files with proper extension");
                            return View();
                        }
                    }
                    else
                    {
                        ModelState.AddModelError("notes", "Please Upload notes");
                        return View();
                    }
                }
                //************************************************

                var updatenoterecor = context.notedetails.Where(x => x.id == newnote.id).FirstOrDefault();
                updatenoterecor.displaypicture = dppath;
                updatenoterecor.notepreviewfile = previewfilepath;
                context.SaveChanges();

                noteattachment notefile = new noteattachment()
                {
                    noteid = newnote.id,
                    filename = attachmentfilename,
                    filepath = pdffilepath,
                    createdby = userid.id,
                    createddate = now,
                    modifiedby = null,
                    modifieddate = null,
                    isActive = true,
                };
                context.noteattachment.Add(notefile);
                context.SaveChanges();

                if(save == null)
                {
                    sendMail(userid.firstname+" "+userid.lastname,note.title);
                }

                return RedirectToAction("dashboard", "dashboard");
            }

            return View();
        }


        public SelectList categorylist()
        {
            var category = new SelectList(context.category.Where(x => x.isActive == true), "id", "categoryname");
            return category;
        }
        public SelectList typelistlist()
        {
            var types = new SelectList(context.notetype.Where(x => x.isActive == true), "id", "typename");
            return types;
        }
        public SelectList countrylist()
        {
            var countries = new SelectList(context.country.Where(x => x.isActive == true), "id", "countryname");
            return countries;
        }

        [NonAction]
        public void sendMail(string sellername, string notetitle)
        {
            var sender = context.systemconfig.FirstOrDefault();
            var senderemail = sender.supportemail;
            var senderpassword = sender.password;
            var receiver = sender.otheremail;

            var fromEmail = new MailAddress(senderemail, "Note sent for review");
            var toEmail = new MailAddress(receiver);
            var fromEmailPassword = senderpassword;
            string subject = sellername + " sent his note for review";

            string body = "Hello, Admins" + "<br/><br/>" + "We wnat to inform you that," +sellername+" sent his note"+ notetitle+" for review"+ " Please look at the notes and take required actions." + "<br/><br/>" + "Regards, <br/>" + "Notes Marketplace";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new System.Net.NetworkCredential(fromEmail.Address, fromEmailPassword)
            };

            using (var message = new MailMessage(fromEmail, toEmail)
            {
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            })
            smtp.Send(message);
        }
    }
}