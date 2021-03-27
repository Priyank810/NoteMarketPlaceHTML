using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList.Mvc;
using PagedList;
using notesplace.Models;

namespace notesplace.Controllers
{
    [Authorize]
    public class mysoldnotesController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: mysoldnotes
        public ActionResult sold(string search, int? i, string sortBy)
        {

            var currentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            var userprofilestatus = context.userdetails.Where(x => x.usserid == currentuser.id).FirstOrDefault();

            if (userprofilestatus != null)
            {
                ViewBag.image = userprofilestatus.profilepicture;
                //var isbought = context.download.Where(x => x.sellerid == currentuser.id).FirstOrDefault();

                //if (isbought != null)
              //  {
                    ViewBag.SortByDate = string.IsNullOrEmpty(sortBy) ? "APPROVED DATE/TIME" : "";
                    ViewBag.SortByTitle = sortBy == "Title" ? "title desc" : "Title";
                    ViewBag.SortByCategory = sortBy == "Category" ? "category desc" : "Category";

                    var mysoldlist = new mysoldnotes();

                    var dlist = (from download in context.download
                                 join notes in context.notedetails
                                 on download.noteid equals notes.id
                                 join userdetail in context.userdetails
                                 on download.sellerid equals userdetail.usserid
                                 join status in context.statustype
                                 on notes.statusid equals status.id


                                 where download.isActive == true && download.isapproved == true && download.sellerid == currentuser.id

                                 select new mysoldnote
                                 {
                                     sellerid = download.sellerid,
                                     buyerid = download.buyerid,
                                     noteid = notes.id,
                                     approveddate = download.approveddate,
                                     title = notes.title,
                                     category = context.category.Where(x => x.id == notes.categoryid).FirstOrDefault().categoryname,
                                     ispaid = notes.ispaid,
                                     price = (int)download.purchaseprice,
                                     buyeremail = context.users.Where(x => x.id == download.buyerid).FirstOrDefault().email,
                                 }).Where(x => x.category.Contains(search) || x.title.Contains(search) || x.buyeremail.Contains(search) || search == null);

                    switch (sortBy)
                    {
                        case "APPROVED DATE/TIME":
                            dlist = dlist.OrderByDescending(x => x.approveddate);
                            break;

                        case "title desc":
                            dlist = dlist.OrderByDescending(x => x.title);
                            break;

                        case "Title":
                            dlist = dlist.OrderBy(x => x.title);
                            break;

                        case "category desc":
                            dlist = dlist.OrderByDescending(x => x.category);
                            break;

                        case "Category":
                            dlist = dlist.OrderBy(x => x.category);
                            break;
                        default:
                            dlist = dlist.OrderBy(x => x.approveddate);
                            break;
                    }

                    mysoldlist.soldnotes = dlist.ToList().ToPagedList(i ?? 1, 10);
                    return View(mysoldlist);
               // }

               // return View();
            }
            return RedirectToAction("userprofile", "userprofile");
        }
    }
}