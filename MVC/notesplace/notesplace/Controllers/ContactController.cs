using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using notesplace.Models;
using System.Net.Mail;
using System.Web.Security;

namespace notesplace.Controllers
{
    [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
    public class ContactController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        
        //Contact US
        [HttpGet]
        public ActionResult contactus()
        {
            if(User.Identity.IsAuthenticated)
            {
                var getuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
                var userprofilestatus = context.userdetails.Where(x => x.usserid == getuser.id).FirstOrDefault();
                if (userprofilestatus != null)
                {
                    ViewBag.image = userprofilestatus.profilepicture;
                    contactus co = new contactus();
                    co.fullname = getuser.firstname + " " + getuser.lastname;
                    co.email = getuser.email;
                    return View(co);
                }
                else
                {
                    return RedirectToAction("userprofile", "userprofile");
                }
            }
            return View();
        }

        [HttpPost]
        public ActionResult contactus(contactus model)
        {
            if (User.Identity.IsAuthenticated)
            {
                var getuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
                var userprofilestatus = context.userdetails.Where(x => x.usserid == getuser.id).FirstOrDefault();
                ViewBag.image = userprofilestatus.profilepicture;
            }
            if (ModelState.IsValid)
            {
                using (var context = new notesmarketplaceEntities())
                {
                    var now = DateTime.Now;

                    contact cc = new contact()
                    {
                        fullname = model.fullname,
                        email = model.email,
                        subject = model.subject,
                        comment = model.comment.Trim(),
                        createddate = now,
                    };
                    SendContactEmail(cc.fullname, cc.subject, cc.comment);
                    context.contact.Add(cc);
                    context.SaveChanges();
                }
                return RedirectToAction("faq","faq");
            }
            return View();
        }

        [NonAction]
        public void SendContactEmail(string fullname, string comments, string query)
        {
            var sender = context.systemconfig.FirstOrDefault();
            var senderemail = sender.supportemail;
            var senderpassword = sender.password;
            var reciever = sender.otheremail;

            var fromEmail = new MailAddress(senderemail, "Contact Us");
            var toEmail = new MailAddress(reciever);
            var fromEmailPassword = senderpassword; // Replace with actual password
            string subject = fullname +" "+ query;

            string body = "Hello" + "<br/><br/>" + comments + "<br/><br/>" + "Regards,<br/>"+ fullname;

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