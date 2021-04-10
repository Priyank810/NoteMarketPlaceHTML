using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using notesplace.Models;
using System.IO;

namespace notesplace.Controllers
{
    [Authorize(Roles ="member")]
    public class userprofileController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: userprofile
        public ActionResult userprofile()
        {
            var userid = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();


            if (context.userdetails.Where(x => x.usserid == userid.id).FirstOrDefault() == null)
            {
                ViewBag.image = null;
                userprofile user = new userprofile();

                user.firstname = userid.firstname;
                user.lastname = userid.lastname;
                user.email = userid.email;

                ViewBag.gender = genderlist();
                ViewBag.countrycode = countrycodelist();
                ViewBag.country = countrylist();

                return View(user);
            }
            return RedirectToAction("dashboard", "dashboard");
        }

        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult userprofile(userprofile user)
        {

            ViewBag.gender = genderlist();
            ViewBag.countrycode = countrycodelist();
            ViewBag.country = countrylist();

            if (ModelState.IsValid)
            {

                userdetails userdetail = new userdetails();

                var users = context.users.Where(x => x.email == user.email).FirstOrDefault();
             

                string profilepicturepath = null;
                if (user.profilepicture == null)
                {
                    profilepicturepath = context.systemconfig.FirstOrDefault().defaultprofilepicture;
                }
                else
                {
                    string folderpath = Server.MapPath("~/Members/" + users.id.ToString() + "/");
                    if (!Directory.Exists(folderpath))
                    {
                        Directory.CreateDirectory(folderpath);
                    }
                    string extension = Path.GetExtension(user.profilepicture.FileName).ToLower();
                    if (extension == ".jpeg" || extension == ".jpg" || extension == ".png")
                    {
                        string path = Server.MapPath("~/Members/" + users.id.ToString());
                        string fileName = "DP_" + DateTime.Now.ToString().Replace(':', '-') + extension;
                        string fullpath = Path.Combine(path, fileName);
                        profilepicturepath = "~/Members/" + users.id.ToString() + "/" + fileName;
                        user.profilepicture.SaveAs(fullpath);
                    }
                }

                userdetail.usserid = users.id;

                if (user.dob != null)
                {
                    userdetail.dob = (DateTime)user.dob;
                }
                userdetail.profilepicture = profilepicturepath;
                userdetail.addressline1 = user.addressline1;
                if (user.addressline2 != null)
                {
                    userdetail.addressline2 = user.addressline2;
                }
                userdetail.city = user.city;
                userdetail.state = user.state;

                if (user.gender != null)
                {
                    userdetail.genderid = user.gender;
                }

                userdetail.countryid = user.country;
                userdetail.countrycodeid = user.countrycode;
                userdetail.zipcode = user.zipcode;
                userdetail.mobilenumber = user.mobilenumber;

                if (user.college != null)
                {
                    userdetail.college = user.college;
                }

                if (user.university != null)
                {
                    userdetail.university = user.university;
                }

                userdetail.createdby = users.id;
                userdetail.createddate = DateTime.Now;
                userdetail.modifiedby = null;
                userdetail.modifieddate = null;
                userdetail.isActive = true;

                context.userdetails.Add(userdetail);
                context.SaveChanges();

                return RedirectToAction("dashboard", "dashboard");
            }
            return View();
        }

        public ActionResult editprofile()
        {
            var us = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            var userprofilestatus = context.userdetails.Where(x => x.usserid == us.id).FirstOrDefault();
            if ( userprofilestatus != null)
            {
                ViewBag.image = userprofilestatus.profilepicture;
                ViewBag.genderlist = genderlist();
                ViewBag.countrycodelist = countrycodelist();
                ViewBag.countrylist = countrylist();

                userprofile user = new userprofile();

                //var us = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
                var u = context.userdetails.Where(x => x.usserid == us.id).FirstOrDefault();

                user.firstname = us.firstname;
                user.lastname = us.lastname;
                user.email = us.email;
                user.dob = u.dob;
                user.gender = (u.genderid);
                user.countrycode = (u.countrycodeid);
                user.mobilenumber = u.mobilenumber;
                user.addressline1 = u.addressline1;
                user.addressline2 = u.addressline2;
                user.city = u.city;
                user.state = u.state;
                user.zipcode = u.zipcode;
                user.country = (u.countryid);
                if (u.university != null)
                {
                    user.university = u.university;
                }
                if (u.college != null)
                {
                    user.college = u.college;
                }

                return View(user);
            }
            return RedirectToAction("dashboard", "dashboard");
        }

        [HttpPost]
        public ActionResult editprofile(userprofile user)
        {
            ViewBag.genderlist = genderlist();
            ViewBag.countrycodelist = countrycodelist();
            ViewBag.countrylist = countrylist();

            if (ModelState.IsValid)
            {
                var users = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
                var userdetail = context.userdetails.Where(x => x.usserid == users.id).FirstOrDefault();


                string profilepicturepath = null;
                if (user.profilepicture != null)
                {
                    if (userdetail.profilepicture != null)
                    {
                        var pathf = Server.MapPath(userdetail.profilepicture);
                        FileInfo file = new FileInfo(pathf);
                        if (file.Exists)
                        {
                            file.Delete();
                        }
                    }
                    string folderpath = Server.MapPath("~/Members/" + users.id.ToString() + "/");
                    if (!Directory.Exists(folderpath))
                    {
                        Directory.CreateDirectory(folderpath);
                    }
                    string extension = Path.GetExtension(user.profilepicture.FileName).ToLower();
                    if (extension == ".jpeg" || extension == ".jpg" || extension == ".png")
                    {
                        string path = Server.MapPath("~/Members/" + users.id.ToString());
                        string fileName = "DP_" + DateTime.Now.ToString().Replace(':', '-') + extension;
                        string fullpath = Path.Combine(path, fileName);
                        profilepicturepath = "~/Members/" + users.id.ToString() + "/" + fileName;
                        user.profilepicture.SaveAs(fullpath);
                    }
                    else
                    {
                        ModelState.AddModelError("profilepicture", "Please Add file with proper extension");
                        return View();
                    }
                }

                userdetail.usserid = users.id;

                if (user.dob != null)
                {
                    userdetail.dob = (DateTime)user.dob;
                }
                userdetail.profilepicture = profilepicturepath;
                userdetail.addressline1 = user.addressline1;
                userdetail.addressline2 = user.addressline2;
                userdetail.city = user.city;
                userdetail.state = user.state;

                if (user.gender != null)
                {
                    userdetail.genderid = user.gender;
                }

                userdetail.countryid = user.country;
                userdetail.countrycodeid = user.countrycode;
                userdetail.zipcode = user.zipcode;
                userdetail.mobilenumber = user.mobilenumber;

                if (user.college != null)
                {
                    userdetail.college = user.college;
                }

                if (user.university != null)
                {
                    userdetail.university = user.university;
                }

                userdetail.createdby = users.id;
                userdetail.createddate = DateTime.Now;
                userdetail.modifiedby = null;
                userdetail.modifieddate = null;
                userdetail.isActive = true;

                context.SaveChanges();


                return RedirectToAction("dashboard", "dashboard");
            }
            return View();
        }

        [NonAction]
        public SelectList genderlist()
        {
            var gender = new SelectList(context.gender.Where(x => x.isActive == true), "id", "gender1");
            return gender;
        }
        [NonAction]
        public SelectList countrycodelist()
        {
            var countrycode = new SelectList(context.country.Where(x => x.isActive == true), "id", "countrycode");
            return countrycode;
        }
        [NonAction]
        public SelectList countrylist()
        {
            var country = new SelectList(context.country.Where(x => x.isActive == true), "id", "countryname");
            return country;
        }
    }
}