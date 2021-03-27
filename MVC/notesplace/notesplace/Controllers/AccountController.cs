using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using notesplace.Models;
using System.Net.Mail;
using System.Web.Security;
using System.Net.NetworkInformation;

namespace notesplace.Controllers
{
    [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
    public class AccountController : Controller
    {
        // GET: Account

        //signup page
        public ActionResult signup()
        {
            return View();
        }
        
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult signup(register model)
        {
            if (ModelState.IsValid)
            {
                using (var context = new notesmarketplaceEntities())
                {
                    //checking if email already exists
                    bool isEmailExists = context.users.Any(x => x.email == model.email);
                    if (isEmailExists)
                    {
                        ModelState.AddModelError("email", "Email already exits");
                        return View(model);
                    }
                    //creating account
                    var now = DateTime.Now;
                    var role = context.userroles.Where(x => x.rolename == "member").FirstOrDefault();

                    //encrypting the password
                    model.password = crypto.Hash(model.password);
                    model.confirmpassword = crypto.Hash(model.confirmpassword);

                    var activationcode = Guid.NewGuid();

                    users user = new users()
                    {
                        firstname = model.firstname,
                        lastname = model.lastname,
                        email = model.email,
                        password = model.password,
                        createddate = now,
                        isEmailVerified = false,
                        isActive = true,
                        modifiedby = null,
                        modifieddate = null,
                        createdby = null,
                        roleid = role.id,
                        activationcode = activationcode,
                    };
                    context.users.Add(user);
                    context.SaveChanges();

                    //sending email verification link
                    SendVerificationLinkEmail(model.email, activationcode.ToString());
                    TempData["Success"] = "Your Account has been successfully created";
                }
            }
            return View();
        }

        //sending to verify email page
        [HttpGet]
        public ActionResult vEmail (string id)
        {
            ViewBag.id = id;
            var context = new notesmarketplaceEntities();
            var getname = context.users.Where(x => x.activationcode == new Guid(id)).FirstOrDefault();
            ViewBag.name = getname.firstname;
            return View();
        }

        //Verifying email
        [HttpGet]
        public ActionResult verifyAccount (string id)
        {
            //Console.WriteLine(id);
            using (notesmarketplaceEntities context = new notesmarketplaceEntities())
            {
                var vcode = context.users.Where(x => x.activationcode == new Guid(id)).FirstOrDefault();
                if(vcode != null)
                {
                    vcode.isEmailVerified = true;
                    context.SaveChanges();
                    return RedirectToAction("login");
                }
                return View();
            }
        }

        //login page
        [HttpGet]
        public ActionResult login()
        {
            return View();
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult login(login model)
        {
            if (ModelState.IsValid)
            {
                model.password = crypto.Hash(model.password);
                using (var context = new notesmarketplaceEntities())
                {
                    var user = context.users.Where(x => x.email == model.email).FirstOrDefault();
                    if (user == null)
                    {
                        ModelState.AddModelError("email", "Email Doesn't Exist");
                        return View();
                    }
                   
                    bool isValid = context.users.Any(x => x.email == model.email && x.password == model.password);
                    
                    //checking if email is already verified or not
                    if(user.isEmailVerified == false)
                    {
                        ModelState.AddModelError("email", "Please Verify Your Email Address");
                        return View();
                    }
                    if (isValid)
                    {
                        int timeout = model.rememberme ? 525600 : 10; 
                        var ticket = new FormsAuthenticationTicket(model.email, model.rememberme, timeout);
                        string encrypted = FormsAuthentication.Encrypt(ticket);
                        var cookie = new HttpCookie(FormsAuthentication.FormsCookieName, encrypted);
                        cookie.Expires = DateTime.Now.AddMinutes(timeout);
                        cookie.HttpOnly = true;
                        Response.Cookies.Add(cookie);
                        return RedirectToAction("dashboard", "dashboard");
                    }
                    ModelState.AddModelError("password", "Invalid Username or password");
                    return View();
                }
            }
            ModelState.AddModelError("", "Enter Proper details");
            return View();
        }

        //logout
        [Authorize]
        public ActionResult logout()
        {
            FormsAuthentication.SignOut();
            return RedirectToAction("login");
        }

        //forgot password
        [HttpGet]
        public ActionResult forgotpassword()
        {
            return View();
        }

        [HttpPost]
        public ActionResult forgotpassword(forgotpassword model)
        {
            if(ModelState.IsValid)
            {
                using (notesmarketplaceEntities context = new notesmarketplaceEntities())
                {
                    var isEmailExists = context.users.Where(x => x.email == model.email).FirstOrDefault();
                    if (isEmailExists == null)
                    {
                        ModelState.AddModelError("email", "Account not found");
                        return View(model);
                    }
                    
                    //generating password
                    var password = Membership.GeneratePassword(6, 2);
                    sendPasswordMail(model.email, password);
                    isEmailExists.password = crypto.Hash(password);
                    context.SaveChanges();
                }
                return RedirectToAction("login");
            }
            return View();
        }

        //change password
        [Authorize]
        [HttpGet]
        public ActionResult changepassword()
        {
            return View();
        }

        [Authorize]
        [HttpPost]
        public ActionResult changepassword(changepassword cp)
        {
            notesmarketplaceEntities context = new notesmarketplaceEntities();
            if(ModelState.IsValid)
            {
                var currentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
                var oldpassword = crypto.Hash(cp.oldpassword);
                if (oldpassword == currentuser.password)
                {
                    currentuser.password = crypto.Hash(cp.newpassword);
                    context.SaveChanges();
                    FormsAuthentication.SignOut();
                    return RedirectToAction("login", "account");
                }
                else
                {
                    ModelState.AddModelError("oldpassword", "Enter Correct Old Password");
                }
            }
            return View();
        }


        //Mail for forgot password
        [NonAction]
        public void sendPasswordMail(string email, string password)
        {

            var fromEmail = new MailAddress("priyanksd123@gmail.com", "New Password");
            var toEmail = new MailAddress(email);
            var fromEmailPassword = "Patrick_9810"; // Replace with actual password
            string subject = "New Temporary Password has been created for you";

            string body ="Hello,"+"<br/><br/>"+"We have generated a new password for you"+"<br/>"+"Password: "+ password;

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

        //mail for verification link
        [NonAction]
        public void SendVerificationLinkEmail(string emailID, string activationCode)
        {
            var verifyUrl = "/Account/vEmail/" + activationCode;
            var link = Request.Url.AbsoluteUri.Replace(Request.Url.PathAndQuery, verifyUrl);

            var fromEmail = new MailAddress("priyanksd123@gmail.com", "Email Verification");
            var toEmail = new MailAddress(emailID);
            var fromEmailPassword = "Patrick_9810"; // Replace with actual password
            string subject = "Your account is successfully created!";

            string body = link;

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