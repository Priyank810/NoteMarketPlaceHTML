using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace notesplace.Controllers
{
    public class HomeController : Controller
    {

        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: Home
        public ActionResult Home()
        {
            if (User.Identity.IsAuthenticated)
            {
                var getuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
                if(getuser.roleid == 1 || getuser.roleid == 2)
                {
                    return RedirectToAction("dashboard", "admin");
                }
                var userprofilestatus = context.userdetails.Where(x => x.usserid == getuser.id).FirstOrDefault();
                if (userprofilestatus != null)
                {
                    ViewBag.image = userprofilestatus.profilepicture;
                }
                else
                {
                    return RedirectToAction("userprofile", "userprofile");
                }
            }
            return View();
        }
    }
}