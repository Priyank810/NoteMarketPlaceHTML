using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace notesplace.Controllers
{
    [OutputCache(NoStore = true, Duration = 0, VaryByParam = "Url")]
    public class FAQController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: FAQ
        public ActionResult faq()
        {
            if (User.Identity.IsAuthenticated)
            {
                var getuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
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