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
    [Authorize(Roles = "superadmin,admin")]
    public class addController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        
        //adding country details
        [HttpGet]
        public ActionResult country()
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid; ViewBag.profilepicture = null;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            return View();
        }

        [HttpPost]
        public ActionResult country(notesplace.Models.country model)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid; ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            if (ModelState.IsValid)
            {
                var checkcountryname = context.country.Any(x => x.countryname == model.countryname);
                if(checkcountryname == true)
                {
                    ModelState.AddModelError("countryname", "country already exists");
                    return View();
                }
                var checkcountrycode = context.country.Any(x => x.countrycode == model.countrycode);
                if (checkcountrycode == true)
                {
                    ModelState.AddModelError("countrycode", "country already exists");
                    return View();
                }

                var currentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();

                country country = new country();

                country.countryname = model.countryname;
                country.countrycode = model.countrycode;
                country.createdby = currentuser.id;
                country.createddate = DateTime.Now;
                country.isActive = true;

                context.country.Add(country);
                context.SaveChanges();

                ModelState.Clear();

                return RedirectToAction("country","manage");
            }
            return View();
        }

        //adding category
        [HttpGet]
        public ActionResult category()
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid; ViewBag.profilepicture = null;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            return View();
        }

       
        [HttpPost]
        public ActionResult category(notesplace.Models.category model)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid; ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            if (ModelState.IsValid)
            {
                var checkcategoryname = context.category.Any(x => x.categoryname == model.categoryname);
                if(checkcategoryname == true)
                {
                    ModelState.AddModelError("categoryname", "category already exists");
                    return View();
                }

                var currentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();

                category category = new category();

                category.categoryname = model.categoryname;
                category.description = model.categorydescription;
                category.createdby = currentuser.id;
                category.createddate = DateTime.Now;
                category.isActive = true;

                context.category.Add(category);
                context.SaveChanges();

                ModelState.Clear();

                return RedirectToAction("category", "manage");

            }
            return View();
        }

        //adding type
        [HttpGet]
        public ActionResult type()
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid; ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            return View();
        }

        [HttpPost]
        public ActionResult type(notesplace.Models.type model)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            if (ModelState.IsValid)
            {
                var checktypename = context.notetype.Any(x => x.typename == model.typename);
                if(checktypename == true)
                {
                    ModelState.AddModelError("typename", "type already exists");
                    return View();
                }

                var currentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();

                notetype type = new notetype();

                type.typename = model.typename;
                type.description = model.typedescription;
                type.createdby = currentuser.id;
                type.createddate = DateTime.Now;
                type.isActive = true;

                context.notetype.Add(type);
                context.SaveChanges();

                ModelState.Clear();

                return RedirectToAction("type", "manage");

            }
            return View();
        }

        //adding administrator (This is only done by superadmin)
        [HttpGet]
        public ActionResult addadminstrator()
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            ViewBag.countrycode = countrycodelist();
            return View();
        }

        [HttpPost]
        public ActionResult addadminstrator(addadminstrator model)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid; 
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            ViewBag.countrycode = countrycodelist();
            if (ModelState.IsValid)
            {
                bool isEmailExists = context.users.Any(x => x.email == model.email);
                if (isEmailExists)
                {
                    ModelState.AddModelError("email", "Email already exits");
                    return View(model);
                }
                users user = new users();

                user.firstname = model.firstname;
                user.lastname = model.lastname;
                user.email = model.email;
                user.roleid = 2;
                user.createddate = DateTime.Now;
                user.isActive = true;
                user.createdby = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault().id;
                var password = Membership.GeneratePassword(6, 2);
                user.password = crypto.Hash(password);

                context.users.Add(user);
                context.SaveChanges();

                notesplace.admindetails admindetail = new notesplace.admindetails();

                admindetail.countrycodeid = context.country.Where(x=>x.id == model.countrycode).FirstOrDefault().id;
                admindetail.mobilenumber = model.phonenumber;
                admindetail.adminid = context.users.Where(x => x.email == model.email).FirstOrDefault().id;

                context.admindetails.Add(admindetail);
                context.SaveChanges();


                //sending login password to administrator through mail
                sendPasswordMail(model.email, password);
                return RedirectToAction("administrator","manage");
            }
            return View();
        }

        [NonAction]
        public void sendPasswordMail(string email, string password)
        {
            var sender = context.systemconfig.FirstOrDefault();
            var senderemail = sender.supportemail;
            var senderpassword = sender.password;

            var fromEmail = new MailAddress(senderemail, "New Password");
            var toEmail = new MailAddress(email);
            var fromEmailPassword = senderpassword; 
            string subject = "New Temporary Password has been created for you";

            string body = "Hello," + "<br/><br/>" + "We have generated a new password for you" + "<br/>" + "Password: " + password;

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
        public SelectList countrycodelist()
        {
            var countrycode = new SelectList(context.country.Where(x => x.isActive == true), "id", "countrycode");
            return countrycode;
        }
    }
}