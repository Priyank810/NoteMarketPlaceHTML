using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using notesplace.Models;
using System.Threading.Tasks;
using PagedList.Mvc;
using PagedList;

namespace notesplace.Controllers
{

    [Authorize(Roles ="member")]
    [OutputCache(NoStore = true, Duration = 0, VaryByParam = "None")]
    public class DashboardController : Controller
    {

        notesmarketplaceEntities context = new notesmarketplaceEntities();
        

        [HttpGet]
        public ActionResult dashboard(string search1, string search2, int? i, string sortBy, int? j, string sortBy2)
        {
            ViewBag.search1 = search1;
            ViewBag.search2 = search2;
            var getuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            var userprofilestatus = context.userdetails.Where(x => x.usserid == getuser.id).FirstOrDefault();

            if (userprofilestatus != null)
            {
                ViewBag.image = userprofilestatus.profilepicture;
                ViewBag.SortByDate = string.IsNullOrEmpty(sortBy) ? "Added Date" : "";
                ViewBag.SortByTitle = sortBy == "Title" ? "title desc" : "Title";
                ViewBag.SortByCategory = sortBy == "Category" ? "category desc" : "Category";
                ViewBag.search1 = search1;
                ViewBag.search2 = search2;

                dynamic dashboard = new dashboard();

                var userid = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
                var notessold = context.download.Where(x => x.sellerid == userid.id && x.isdownloaded == true).Count();
                var moneyearned = context.download.Where(x => x.sellerid == userid.id && x.isdownloaded == true).ToList();
                int amount = 0;
                foreach (var m in moneyearned)
                {
                    amount += m.purchaseprice;
                }
                var mydownloads = context.download.Where(x => x.buyerid == userid.id && x.isdownloaded == true).Count();
                var myrejected = context.notedetails.Where(x => x.userid == userid.id && x.statusid == 4).Count();
                var buyerrequests = context.download.Where(x => x.sellerid == userid.id && x.isapproved == false).Count();

                var cs = new dashboard00();

                cs.notessold = notessold;
                cs.moneyearned = amount;
                cs.mydownloads = mydownloads;
                cs.myrejected = myrejected;
                cs.buyerrequests = buyerrequests;

                dashboard.DM0 = cs;

                var d1 = (from book in context.notedetails
                          join category in context.category
                          on book.categoryid equals category.id
                          join status in context.statustype
                          on book.statusid equals status.id

                          where book.userid == userid.id && (status.status == "draft" || status.status == "submittedforreview") && book.isActive == true

                          select new dashboard01
                          {
                              noteid = book.id,
                              addeddate = book.createddate,
                              title = book.title,
                              category = category.categoryname,
                              status = status.status,
                          }).Where(x => x.category.Contains(search1) || x.title.Contains(search1) || x.status.Contains(search1) || search1 == null);


                switch (sortBy)
                {

                    case "Added Date":
                        d1 = d1.OrderByDescending(x => x.addeddate);
                        break;

                    case "title desc":
                        d1 = d1.OrderByDescending(x => x.title);
                        break;

                    case "Title":
                        d1 = d1.OrderBy(x => x.title);
                        break;

                    case "category desc":
                        d1 = d1.OrderByDescending(x => x.category);
                        break;

                    case "Category":
                        d1 = d1.OrderBy(x => x.category);
                        break;
                    default:
                        d1 = d1.OrderBy(x => x.addeddate);
                        break;
                }

                dashboard.DM1 = d1.ToList().ToPagedList(i ?? 1, 5);
                ViewBag.counter1 = 5 * (i - 1);


                ViewBag.SortByDate2 = string.IsNullOrEmpty(sortBy2) ? "Added Date" : "";
                ViewBag.SortByTitle2 = sortBy2 == "Title" ? "title desc" : "Title";
                ViewBag.SortByCategory2 = sortBy2 == "Category" ? "category desc" : "Category";

                var d2 = (from book in context.notedetails
                          join category in context.category
                          on book.categoryid equals category.id
                          join status in context.statustype
                          on book.statusid equals status.id

                          where book.userid == userid.id && book.isActive == true && status.status == "published"

                          select new dashboard02
                          {
                              noteid = book.id,
                              addeddate = book.createddate,
                              title = book.title,
                              category = category.categoryname,
                              status = status.status,
                              ispaid = book.ispaid,
                              sellprice = book.sellprice
                          }).Where(x => x.category.Contains(search2) || x.title.Contains(search2) || x.status.Contains(search2) || search2 == null);

                switch (sortBy2)
                {

                    case "Added Date":
                        d2 = d2.OrderByDescending(x => x.addeddate);
                        break;

                    case "title desc":
                        d2 = d2.OrderByDescending(x => x.title);
                        break;

                    case "Title":
                        d2 = d2.OrderBy(x => x.title);
                        break;

                    case "category desc":
                        d2 = d2.OrderByDescending(x => x.category);
                        break;

                    case "Category":
                        d2 = d2.OrderBy(x => x.category);
                        break;
                    default:
                        d2 = d2.OrderBy(x => x.addeddate);
                        break;
                }

                dashboard.DM2 = d2.ToList().ToPagedList(j ?? 1, 5);
                ViewBag.counter2 = 5 * (j - 1);

                //ViewBag.data03 = bookstats1;

                return View(dashboard);
            }
            return RedirectToAction("userprofile", "userprofile");
        }

        public ActionResult delete(int id)
        {
            var deletebook = context.notedetails.Where(x => x.id == id).FirstOrDefault();
            var deletebookattachment = context.noteattachment.Where(x => x.noteid == deletebook.id).FirstOrDefault();
            
            context.noteattachment.Remove(deletebookattachment);
            context.SaveChanges();

            context.notedetails.Remove(deletebook);
            context.SaveChanges();
            
            return RedirectToAction("dashboard");
        }
    }
}