using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.IO;

namespace notesplace.Controllers
{
    [Authorize(Roles ="superadmin,admin")]
    public class systemconfigController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: systemconfig
     
        public ActionResult systemconfig()
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            var checkentry = context.systemconfig.FirstOrDefault();
            if (checkentry != null)
            {
                notesplace.Models.systemconfig model = new notesplace.Models.systemconfig();

                model.systemconfigid = checkentry.id;
                model.supportemail = checkentry.supportemail;
                model.password = checkentry.password;
                model.supportphonenumber = checkentry.supportphonenumber;
                model.othereamil = checkentry.otheremail;
                if(checkentry.facebookurl !=null)
                {
                    model.facebookurl = checkentry.facebookurl;
                }
                if (checkentry.linedinurl != null)
                {
                    model.linkeinurl = checkentry.linedinurl;
                }
                if (checkentry.twitterurl != null)
                {
                    model.twitterurl = checkentry.twitterurl;
                }

                return View(model);

            }
            return View();
        }

        [HttpPost]
        public ActionResult systemconfig(notesplace.Models.systemconfig model)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault().profilepicture;

            if (ModelState.IsValid)
            {
                string profilepicturepath = null;
                string notepicturepath = null;
                if (model.defaultprofilepicture != null && model.defaultnotepicture!=null)
                {
                    string folderpath = Server.MapPath("~/Members/Default/");
                    if (!Directory.Exists(folderpath))
                    {
                        Directory.CreateDirectory(folderpath);
                    }
                    if (context.systemconfig.FirstOrDefault().defaultprofilepicture != null)
                    {
                        var pathf = Server.MapPath(context.systemconfig.FirstOrDefault().defaultprofilepicture);
                        FileInfo file = new FileInfo(pathf);
                        if (file.Exists)
                        {
                            file.Delete();
                        }
                    }
                    if (context.systemconfig.FirstOrDefault().defaultnotepicture != null)
                    {
                        var pathf = Server.MapPath(context.systemconfig.FirstOrDefault().defaultnotepicture);
                        FileInfo file = new FileInfo(pathf);
                        if (file.Exists)
                        {
                            file.Delete();
                        }
                    }
                    string extension = Path.GetExtension(model.defaultprofilepicture.FileName).ToLower();
                    if (extension == ".jpeg" || extension == ".jpg" || extension == ".png")
                    {
                        string path = Server.MapPath("~/Members/Default");
                        string fileName = "DP_" + DateTime.Now.ToString().Replace(':', '-') + extension;
                        string fullpath = Path.Combine(path, fileName);
                        profilepicturepath = "~/Members/Default/" + fileName;
                        model.defaultprofilepicture.SaveAs(fullpath);
                    }
                    else
                    {
                        ModelState.AddModelError("defaultprofilepicture", "Please Add file with proper extension");
                        return View();
                    }

                    extension = Path.GetExtension(model.defaultnotepicture.FileName).ToLower();
                    if (extension == ".jpeg" || extension == ".jpg" || extension == ".png")
                    {
                        string path = Server.MapPath("~/Members/Default");
                        string fileName = "DN_" + DateTime.Now.ToString().Replace(':', '-') + extension;
                        string fullpath = Path.Combine(path, fileName);
                        notepicturepath = "~/Members/Default/" + fileName;
                        model.defaultnotepicture.SaveAs(fullpath);
                    }
                    else
                    {
                        ModelState.AddModelError("defaultnotepicture", "Please Add file with proper extension");
                        return View();
                    }
                }

                if (model.systemconfigid == null)
                {
                    systemconfig systemconfig = new systemconfig();

                    systemconfig.supportemail = model.supportemail;
                    systemconfig.password = model.password;
                    systemconfig.supportphonenumber = model.supportphonenumber;
                    systemconfig.otheremail = model.othereamil;
                    systemconfig.facebookurl = model.facebookurl;
                    systemconfig.linedinurl = model.linkeinurl;
                    systemconfig.twitterurl = model.twitterurl;
                    systemconfig.defaultnotepicture = notepicturepath;
                    systemconfig.defaultprofilepicture = profilepicturepath;

                    context.systemconfig.Add(systemconfig);
                    context.SaveChanges();
                }
                else
                {
                    var systemconfig = context.systemconfig.Where(x => x.id == model.systemconfigid).FirstOrDefault();

                    systemconfig.supportemail = model.supportemail;
                    systemconfig.password = model.password;
                    systemconfig.supportphonenumber = model.supportphonenumber;
                    systemconfig.otheremail = model.othereamil;
                    systemconfig.facebookurl = model.facebookurl;
                    systemconfig.linedinurl = model.linkeinurl;
                    systemconfig.twitterurl = model.twitterurl;
                    systemconfig.defaultnotepicture = notepicturepath;
                    systemconfig.defaultprofilepicture = profilepicturepath;

                    context.SaveChanges();
                }
                return RedirectToAction("dashboard", "admin");
            }
            return View();
        }
    }
}