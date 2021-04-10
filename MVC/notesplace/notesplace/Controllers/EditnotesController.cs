using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using notesplace.Models;
using System.IO;

namespace notesplace.Controllers
{
    public class EditnotesController : Controller
    {
        // GET: Editnotes
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        public ActionResult editnotes(int nid)
        {

            var getuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            var userprofilestatus = context.userdetails.Where(x => x.usserid == getuser.id).FirstOrDefault();

            if (userprofilestatus != null)
            {
                ViewBag.image = userprofilestatus.profilepicture;
                editbooks ebook = new editbooks();
            ViewBag.category = categorylist();
            ViewBag.notetype = typelistlist();
            ViewBag.country = countrylist();

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

                         select new editbooks
                         {
                             nid = nid,
                             title = book.title,
                             typeid = type.id,
                             categoryid = category.id,
                             description = book.description,
                             sellprice = book.sellprice,
                             institutename = book.universityname,
                             countryid = country.id,
                             coursename = book.coursename,
                             coursecode = book.coursecode,
                             professor = book.professor,
                             isp=book.ispaid,
                             numberofpages = book.numberofpages,
                         }).ToList().FirstOrDefault();
            if(ebooks.isp==true)
            {
                ebooks.ispaid = 1;
            }
            else
            {
                ebooks.ispaid = 0;
            }
            ebook = (editbooks)ebooks;
            return View(ebook);
            }
            return RedirectToAction("userprofile", "userprofile");
        }


        [HttpPost]
        [ValidateAntiForgeryToken]

        public ActionResult editnotes(editbooks book, string save)
            {

            var getuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            var userprofilestatus = context.userdetails.Where(x => x.usserid == getuser.id).FirstOrDefault();
            ViewBag.image = userprofilestatus.profilepicture;

            if (ModelState.IsValid)
                {
                    string status = "draft";
                    if (save == null)
                    {
                        status = "submittedforreview";
                    }
                    var now = DateTime.Now;
                    var findBook = context.notedetails.Where(x => x.id == book.nid).FirstOrDefault();
                    findBook.title = book.title;
                    findBook.categoryid = book.categoryid;
                    findBook.typeid = book.typeid;
                    findBook.numberofpages = book.numberofpages;
                    findBook.description = book.description;
                    findBook.countryid = book.countryid;
                    findBook.coursename = book.coursename;
                    findBook.coursecode = book.coursecode;
                    findBook.universityname = book.institutename;

                    bool paid = true;
                    if (book.ispaid == 0)
                    {
                        paid = false;
                        book.sellprice = 0;
                    }
                    if (book.ispaid == 1)
                    {
                        if (book.sellprice == null)
                        {
                            ModelState.AddModelError("sellprice", "sellprice required");
                            return View();
                        }
                    }
                    findBook.ispaid = paid;
                    findBook.sellprice = book.sellprice;
                    var sid = context.statustype.Where(x => x.status == status).FirstOrDefault();
                    findBook.statusid = sid.id;

                    string dppath = null;
                    string previewfilepath = null;
                    string pdffilepath = null;
                    string attachmentfilename = null;

                    if (book.displaypicture != null)
                    {
                        if (findBook.displaypicture != null)
                        {
                            var pathf = Server.MapPath(findBook.displaypicture);
                            FileInfo file = new FileInfo(pathf);
                            if (file.Exists)
                            {
                                file.Delete();
                            }
                        }
                        string folderpath = Server.MapPath("~/Members/" + findBook.userid.ToString() + "/" + findBook.id.ToString() + "/");
                        if (!Directory.Exists(folderpath))
                        {
                            Directory.CreateDirectory(folderpath);
                        }

                        string extension = Path.GetExtension(book.displaypicture.FileName).ToLower();
                        if (extension == ".jpg" || extension == ".jpeg" || extension == ".png")
                        {
                            string path = Server.MapPath("~/Members/" + findBook.userid.ToString() + "/" + findBook.id.ToString() + "/");
                            string fileName = "DP_" + now.ToString().Replace(':', '-') + extension;
                            string fullpath = Path.Combine(path + fileName);
                            dppath = "~/Members/" + (findBook.userid).ToString() + "/" + (findBook.id).ToString() + "/" + fileName;
                            book.displaypicture.SaveAs(fullpath);
                        }
                        else
                        {
                            ModelState.AddModelError("displaypicture", "Please Add file with proper extension");
                            return View();
                        }
                        findBook.displaypicture = dppath;
                    }

                    if (book.previewfile != null)
                    {
                        if (findBook.notepreviewfile != null)
                        {
                            var pathf = Server.MapPath(findBook.notepreviewfile);
                            FileInfo file = new FileInfo(pathf);
                            if (file.Exists)
                            {
                                file.Delete();
                            }
                        }

                        string folderpath = Server.MapPath("~/Members/" + findBook.userid.ToString() + "/" + findBook.id.ToString() + "/");
                        if (!Directory.Exists(folderpath))
                        {
                            Directory.CreateDirectory(folderpath);
                        }
                        var extension = Path.GetExtension(book.previewfile.FileName).ToLower();
                        if (extension == ".pdf" || extension == ".docx" || extension == ".doc")
                        {
                            string path = Server.MapPath("~/Members/" + (findBook.userid).ToString() + "/" + (findBook.id).ToString());
                            string fileName = "Preview_" + now.ToString().Replace(':', '-') + extension;
                            string fullpath = Path.Combine(path, fileName);
                            previewfilepath = "~/Members/" + (findBook.userid).ToString() + "/" + (findBook.id).ToString() + "/" + fileName;
                            book.previewfile.SaveAs(fullpath);
                        }
                        else
                        {
                            ModelState.AddModelError("previewfile", "Please Add file with proper extension");
                            return View();
                        }
                        findBook.notepreviewfile = previewfilepath;
                    }

                    if (book.notes != null)
                    {
                        foreach (var file in book.notes)
                        {
                            if (file != null)
                            {
                                var fname = "";
                                string attachmentfolderpath = Server.MapPath("~/Members/Attachments/" + (findBook.userid).ToString() + "/" + (findBook.id).ToString());
                                if (Directory.Exists(attachmentfolderpath))
                                {
                                    foreach (var filename in Directory.GetFiles(attachmentfolderpath))
                                    {
                                        new FileInfo(filename).Delete();
                                    }
                                }
                                int counter = 1;
                                foreach (var pdff in book.notes)
                                {
                                    var extension = Path.GetExtension(pdff.FileName).ToLower();

                                    if (extension == ".pdf" || extension == ".docx" || extension == ".doc")
                                    {
                                        string path = Server.MapPath("~/Members/Attachments/" + (findBook.userid).ToString() + "/" + (findBook.id).ToString());
                                        string fileName = counter.ToString() + "Attachment" + findBook.id.ToString() + "_" + now.ToString().Replace(':', '-') + extension;
                                        string fullpath = Path.Combine(path, fileName);
                                        pdffilepath = "~/Members/Attachments/" + (findBook.userid).ToString() + "/" + (findBook.id).ToString() + "/";
                                        fname += fileName + ";";
                                        attachmentfilename = fileName;
                                        pdff.SaveAs(fullpath);
                                        counter++;
                                    }
                                    else
                                    {
                                        ModelState.AddModelError("notes", "Please add files with proper extension");
                                        return View();
                                    }
                                }

                                var notea = context.noteattachment.Where(x => x.noteid == book.nid).FirstOrDefault();
                                notea.filename = fname;
                                notea.filepath = pdffilepath;
                            }
                        }

                    }
                    context.SaveChanges();
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
    }
}