using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Net.Mail;
using System.Web.Security;
using System.IO;
using System.IO.Compression;
using Ionic.Zip;

namespace notesplace.Controllers
{
    [Authorize]
    public class transactionController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: transaction
        public ActionResult share(int noteid)
        {
            var buyer = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            var note = context.notedetails.Where(x => x.id == noteid).FirstOrDefault();
            var checkrecord = context.download.Where(x => x.noteid == noteid && x.buyerid == buyer.id && x.sellerid == note.userid).FirstOrDefault(); 
            if (buyer.id == note.userid)
            {
                var getnote = context.notedetails.Where(x => x.id == noteid).FirstOrDefault();
                string filePaths = Server.MapPath("~/Members/Attachments/" + getnote.userid.ToString() + "/" + getnote.id.ToString() + "/");
                List<string> files = new List<string>();

                foreach (var filepath in Directory.GetFiles(filePaths))
                {
                    files.Add(filepath);
                }

                using (var zip = new Ionic.Zip.ZipFile())
                {
                    zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                    zip.AddDirectoryByName("Files");
                    foreach (var file in files)
                    {
                        zip.AddFile(file, "Files");

                    }
                    string zipName = String.Format("Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                    using (MemoryStream memoryStream = new MemoryStream())
                    {
                        zip.Save(memoryStream);
                        return File(memoryStream.ToArray(), "application/zip", zipName);
                    }
                }
            }
            else if (checkrecord == null)
            {
                var category = context.category.Where(x => x.id == note.categoryid).FirstOrDefault();

                download notedownload = new download();

                notedownload.noteid = noteid;
                notedownload.sellerid = note.userid;
                notedownload.buyerid = buyer.id;
                if (note.ispaid == true)
                {
                    notedownload.ispaid = false;
                    notedownload.isapproved = false;
                    notedownload.isdownloaded = false;
                }
                else
                {
                    notedownload.isapproved = true;
                    notedownload.isdownloaded = true;
                    notedownload.downloadedate = DateTime.Now;
                    notedownload.approveddate = DateTime.Now;
                    notedownload.ispaid = true;
                }
                notedownload.requesteddate = DateTime.Now;
                notedownload.title = note.title;
                notedownload.category = category.categoryname;
                notedownload.purchaseprice = (int)note.sellprice;
                notedownload.purchaseprice = 100;
                notedownload.createddate = DateTime.Now;
                notedownload.isActive = true;


                context.download.Add(notedownload);
                context.SaveChanges();

                if (note.ispaid == true)
                {
                    var sellerinfo = context.users.Where(x => x.id == note.userid).FirstOrDefault();

                    string selleremail = sellerinfo.email;
                    string sellername = sellerinfo.firstname;
                    string buyername = buyer.firstname;

                    sendMail(selleremail, sellername, buyername);
                }

                else if (note.sellprice == 0 || note.sellprice == null)
                {

                    var getnote = context.notedetails.Where(x => x.id == noteid).FirstOrDefault();
                    string filePaths = Server.MapPath("~/Members/Attachments/" + getnote.userid.ToString() + "/" + getnote.id.ToString() + "/");
                    List<string> files = new List<string>();

                    foreach (var filepath in Directory.GetFiles(filePaths))
                    {
                        files.Add(filepath);
                    }



                    using (var zip = new Ionic.Zip.ZipFile())
                    {
                        zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                        zip.AddDirectoryByName("Files");
                        foreach (var file in files)
                        {
                            zip.AddFile(file, "Files");

                        }
                        string zipName = String.Format("Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                        using (MemoryStream memoryStream = new MemoryStream())
                        {
                            zip.Save(memoryStream);
                            return File(memoryStream.ToArray(), "application/zip", zipName);
                        }
                    }
                }
                ViewBag.buyername = buyer.firstname;
                var uname = context.users.Where(x => x.id == note.userid).FirstOrDefault();
                ViewBag.sellerfirstname = uname.firstname;
                ViewBag.sellerlastname = uname.lastname;
                return PartialView("share");
            }
            else if (checkrecord.isapproved == true)
            {
                if (checkrecord.isdownloaded != true)
                {
                    checkrecord.isdownloaded = true;
                    checkrecord.downloadedate = DateTime.Now;
                }

                context.SaveChanges();

                var getnote = context.notedetails.Where(x => x.id == noteid).FirstOrDefault();
                string filePaths = Server.MapPath("~/Members/Attachments/" + getnote.userid.ToString() + "/" + getnote.id.ToString() + "/");
                List<string> files = new List<string>();

                foreach (var filepath in Directory.GetFiles(filePaths))
                {
                    files.Add(filepath);
                }

                using (var zip = new Ionic.Zip.ZipFile())
                {
                    zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                    zip.AddDirectoryByName("Files");
                    foreach (var file in files)
                    {
                        zip.AddFile(file, "Files");
                    }
                    string zipName = String.Format("Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                    using (MemoryStream memoryStream = new MemoryStream())
                    {
                        zip.Save(memoryStream);
                        return File(memoryStream.ToArray(), "application/zip", zipName);
                    }
                }
            }
            return RedirectToAction("display","bookdetails",noteid);
        }

        

        [NonAction]
        public void sendMail(string selleremail, string sellername, string buyername)
        {
            var sender = context.systemconfig.FirstOrDefault();
            var senderemail = sender.supportemail;
            var senderpassword = sender.password;

            var fromEmail = new MailAddress(senderemail, "Buyer Request");
            var toEmail = new MailAddress(selleremail);
            var fromEmailPassword = senderpassword;
            string subject = buyername + " wants to purchase your notes";

            string body = "Hello, "+ sellername + "<br/><br/>" + "We would like to inform you that,"+buyername+" wnats to purchase your notes. Please see"+"<br/>"
                + "Buyer requests tab and alloww download access to Buyer if you have received the payment from him."+ "<br/><br/>" +"Regards, <br/>"+"Notes Marketplace";

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