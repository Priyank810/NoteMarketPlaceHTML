using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using notesplace.Models;
using PagedList.Mvc;
using PagedList;
using System.Net.Mail;

namespace notesplace.Controllers
{
    [Authorize]
    public class buyerrequestController : Controller
    {
        // GET: buyerrequest
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        public ActionResult buyer(string search, int?i, string sortBy)
        {

            var getuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            var userprofilestatus = context.userdetails.Where(x => x.usserid == getuser.id).FirstOrDefault();

            if (userprofilestatus != null)
            {
                ViewBag.image = userprofilestatus.profilepicture;
                ViewBag.SortByDate = string.IsNullOrEmpty(sortBy) ? "DOWNLOADED DATE/TIME" : "";
                ViewBag.SortByTitle = sortBy == "Title" ? "title desc" : "Title";
                ViewBag.SortByCategory = sortBy == "Category" ? "category desc" : "Category";

                var userid = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();

                var buyerrequestlist = new buyerrequest();

                var d2 = (from download in context.download
                          join notes in context.notedetails
                          on download.noteid equals notes.id
                          join userdetail in context.userdetails
                          on download.buyerid equals userdetail.usserid
                          join status in context.statustype
                          on notes.statusid equals status.id
                          

                          where download.isActive == true && download.sellerid == userid.id && download.isapproved == false 

                          select new brequest
                          { 
                              buyerid = download.buyerid,
                              noteid = notes.id,
                              addeddate = download.requesteddate,
                              title = notes.title,
                              category = context.category.Where(x=>x.id == notes.categoryid).FirstOrDefault().categoryname,
                              ispaid = notes.ispaid,
                              sellprice = notes.sellprice,
                              buyeremail = context.users.Where(x=>x.id == download.buyerid).FirstOrDefault().email,
                              buyercountrycode = context.country.Where(x=>x.id == userdetail.countrycodeid).FirstOrDefault().countrycode,
                              byyernumber = userdetail.mobilenumber,
                          }).Where(x => x.category.Contains(search) || x.title.Contains(search) || x.buyeremail.Contains(search) || search == null);

                switch (sortBy)
                {

                    case "DOWNLOADED DATE/TIME":
                        d2 = d2.OrderByDescending(x => x.addeddate);
                        break;

                    case "title desc":
                        d2 = d2.OrderByDescending(x => x.title);
                        break;

                    case "Title":
                        d2 = d2.OrderBy(x => x.title);
                        break;

                    case "category desc":
                        d2 = d2.OrderByDescending(x => x.category);
                        break;

                    case "Category":
                        d2 = d2.OrderBy(x => x.category);
                        break;
                    default:
                        d2 = d2.OrderBy(x => x.addeddate);
                        break;
                }
                buyerrequestlist.buy = d2.ToList().ToPagedList(i?? 1, 3);

                return View(buyerrequestlist);
            }
            return RedirectToAction("userprofile", "userprofile");
        }


        public ActionResult allowdownload(int noteid, int buyerid)
        {
            var notedownload = context.download.Where(x => x.noteid == noteid && x.buyerid == buyerid).FirstOrDefault();
            var sellername = context.users.Where(x => x.id == notedownload.sellerid).FirstOrDefault().firstname;
            var buyer = context.users.Where(x => x.id == buyerid).FirstOrDefault();
            string buyeremail = buyer.email;
            string buyername = buyer.firstname;
            if (notedownload != null)
            {
                notedownload.ispaid = true;
                notedownload.isapproved = true;
                notedownload.approveddate = DateTime.Now;

                context.SaveChanges();
                sendMail(buyeremail, buyername, sellername);
            }
            return RedirectToAction("buyer","buyerrequest");
        }


        [NonAction]
        public void sendMail(string buyeremail, string buyername, string sellername)
        {

            var fromEmail = new MailAddress("priyanksd123@gmail.com", "Request Approved");
            var toEmail = new MailAddress(buyeremail);
            var fromEmailPassword = "Patrick_9810"; // Replace with actual password
            string subject = sellername + " Allows you to dowwnload a notes";

            string body = "Hello, " + buyername + "<br/><br/>" + "We would like to inform you that," + sellername + " Allows you to download a note" + "<br/>"
                + "Please login and see My Download tab to download particular note. " + "<br/><br/>" + "Regards, <br/>" + "Notes Marketplace";

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