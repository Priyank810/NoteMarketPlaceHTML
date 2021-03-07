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
        // GET: FAQ
        [Route("FAQ")]
        public ActionResult faq()
        {
            return View();
        }
    }
}