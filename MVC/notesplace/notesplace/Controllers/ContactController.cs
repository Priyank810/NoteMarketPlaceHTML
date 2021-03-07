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

        [HttpGet]
        public ActionResult contactus()
        {
            return View();
        }

        [HttpPost]
        public ActionResult contactus(contactus model)
        {
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
                        comment = model.comment,
                        createddate = now,
                    };
                    SendContactEmail(cc.email, cc.fullname, cc.subject, cc.comment);
                    context.contact.Add(cc);
                    context.SaveChanges();
                }
                return RedirectToAction("faq","faq");
            }
            return View();
        }

        [NonAction]
        public void SendContactEmail(string emailID, string fullname, string comments, string query)
        {
            var fromEmail = new MailAddress("priyanksd123@gmail.com", "Contact Us");
            var toEmail = new MailAddress(emailID);
            var fromEmailPassword = "Priyank_9810"; // Replace with actual password
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