using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;
using PagedList.Mvc;
using notesplace.Models;

namespace notesplace.Controllers
{
    [Authorize(Roles ="superadmin, admin")]
    public class spamreportsController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: spamreports
        //all the spam reports of notes
        public ActionResult spamreports(int? i, string search, string sortBy)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }


            ViewBag.SortByDate = string.IsNullOrEmpty(sortBy) ? "DATE EDITED" : "";
            ViewBag.SortByTitle = sortBy == "NOTE TITLE" ? "NOTE TITLE desc" : "NOTE TITLE";
            ViewBag.SortByCategory = sortBy == "CATEGORY" ? "CATEGORY desc" : "CATEGORY";
            ViewBag.SortByReportedby = sortBy == "REPORTED BY" ? "REPORTED BY desc" : "REPORTED BY";

            var sr = (from spam in context.spam

                      where spam.isActive == true

                      select new spamreport
                      {
                          noteid = spam.noteid,
                          reportid = spam.id,
                          reportedby = context.users.Where(x=>x.id == spam.buyerid).FirstOrDefault().firstname +" "+ context.users.Where(x => x.id == spam.buyerid).FirstOrDefault().lastname,
                          notetitle = context.notedetails.Where(x=>x.id == spam.noteid).FirstOrDefault().title,
                          category = context.category.Where(x=>x.id == context.notedetails.Where(y => y.id == spam.noteid).FirstOrDefault().categoryid).FirstOrDefault().categoryname,
                          dateedited = spam.createddate,
                          remark = spam.remarks
                      }).Where(x=>x.reportedby.Contains(search) || x.notetitle.Contains(search) || x.category.Contains(search) || search == null);

            switch (sortBy)
            {
                case "DATE EDITED":
                    sr = sr.OrderByDescending(x => x.dateedited);
                    break;

                case "NOTE TITLE desc":
                    sr = sr.OrderByDescending(x => x.notetitle);
                    break;

                case "NOTE TITLE":
                    sr = sr.OrderBy(x => x.notetitle);
                    break;

                case "REPORTED BY desc":
                    sr = sr.OrderByDescending(x => x.reportedby);
                    break;

                case "REPORTED BY":
                    sr = sr.OrderBy(x => x.reportedby);
                    break;

                case "CATEGORY desc":
                    sr = sr.OrderByDescending(x => x.category);
                    break;

                case "CATEGORY":
                    sr = sr.OrderBy(x => x.category);
                    break;
                default:
                    sr = sr.OrderBy(x => x.dateedited);
                    break;
            }

            spamreports spamreports = new spamreports();
            spamreports.spamreport = sr.ToList().ToPagedList(i ?? 1, 5);
            ViewBag.counter = 5 * (i - 1);

            return View(spamreports);
        }

        public ActionResult Delete(int reportid)
        {
            var getreport = context.spam.Where(x => x.id == reportid).FirstOrDefault();

            var getnote = context.notedetails.Where(x => x.id == getreport.noteid).FirstOrDefault();
            if (getnote.totalspam == 1)
            {
                getnote.totalspam = 0;
            }
            else
            {
                getnote.totalspam = getnote.totalspam - 1;
            }

            context.spam.Remove(getreport);
            context.SaveChanges();

            return RedirectToAction("spamreports", "spamreports");
        }
    }
}