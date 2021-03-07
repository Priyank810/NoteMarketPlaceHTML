using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using notesplace.Models;
using PagedList.Mvc;
using PagedList;

namespace notesplace.Controllers
{
    [Authorize]
    public class buyerrequestController : Controller
    {
        // GET: buyerrequest
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        public ActionResult buyer(string search, int?i, string sortBy)
        {
            ViewBag.SortByDate = string.IsNullOrEmpty(sortBy) ? "DOWNLOADED DATE/TIME" : "";
            ViewBag.SortByTitle = sortBy == "Title" ? "title desc" : "Title";
            ViewBag.SortByCategory = sortBy == "Category" ? "category desc" : "Category";

            var userid = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();

            var buyerreq = new buyerrequest();

            var d2 = (from book in context.notedetails
                      join category in context.category
                      on book.categoryid equals category.id
                      join status in context.statustype
                      on book.statusid equals status.id

                      where book.isActive == true

                      select new brequest
                      {
                          noteid = book.id,
                          addeddate = book.createddate,
                          title = book.title,
                          category = category.categoryname,
                          status = status.status,
                          ispaid = book.ispaid,
                          sellprice = book.sellprice
                      }).Where(x => x.category.Contains(search) || x.title.Contains(search) || x.status.Contains(search) || search == null);

            switch (sortBy)
            {

                case "DOWNLOADED DATE/TIME":
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
            buyerreq.buy = d2.ToList().ToPagedList(i ?? 1, 10);

            return View(buyerreq);
        }
    }
}