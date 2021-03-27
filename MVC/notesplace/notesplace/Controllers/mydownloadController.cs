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
    public class mydownloadController : Controller
    {

        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: mydownload
        public ActionResult mydownload(string search, int? i, string sortBy)
        {
            var currentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            var userprofilestatus = context.userdetails.Where(x => x.usserid == currentuser.id).FirstOrDefault();

            if (userprofilestatus != null)
            {
                ViewBag.image = userprofilestatus.profilepicture; 
               // var isbought = context.download.Where(x => x.buyerid == currentuser.id).FirstOrDefault();

                //if (isbought != null)
                //{
                    ViewBag.SortByDate = string.IsNullOrEmpty(sortBy) ? "APPROVED DATE/TIME" : "";
                    ViewBag.SortByTitle = sortBy == "Title" ? "title desc" : "Title";
                    ViewBag.SortByCategory = sortBy == "Category" ? "category desc" : "Category";

                    var mydownloadlist = new mydownload();

                    var dlist = (from download in context.download
                                 join notes in context.notedetails
                                 on download.noteid equals notes.id
                                 join userdetail in context.userdetails
                                 on download.sellerid equals userdetail.usserid
                                 join status in context.statustype
                                 on notes.statusid equals status.id


                                 where download.isActive == true && download.isapproved == true && download.buyerid == currentuser.id

                                 select new mydownloads
                                 {
                                     downloadid = download.id,
                                     sellerid = download.sellerid, 
                                     buyerid = download.buyerid,
                                     noteid = notes.id,
                                     downloadeddate = download.downloadedate,
                                     approveddate = download.approveddate,
                                     title = notes.title,
                                     category = context.category.Where(x => x.id == notes.categoryid).FirstOrDefault().categoryname,
                                     ispaid = notes.ispaid,
                                     price = (int)download.purchaseprice,
                                     selleremail = context.users.Where(x => x.id == download.buyerid).FirstOrDefault().email,
                                 }).Where(x => x.category.Contains(search) || x.title.Contains(search) || x.selleremail.Contains(search) || search == null);

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

                    mydownloadlist.downloads = dlist.ToList().ToPagedList(i ?? 1, 10);
                    return View(mydownloadlist);
               //}

                //return View();
            }
            return RedirectToAction("userprofile", "userprofile");
        }

        [HttpPost]
        public ActionResult addreview(int downloadid, int rate, string comments)
        {
            var dbook = context.download.Where(x => x.id == downloadid).FirstOrDefault();
            var re = context.reviews.Where(x => x.downloadid == downloadid).FirstOrDefault();
            if (re != null)
            {
                re.ratingstar = (int)rate;
                re.comments = comments;
                context.SaveChanges();
            }
            else
            {
                reviews ar = new reviews();
                ar.downloadid = downloadid;
                ar.ratingstar = (int)rate;
                ar.noteid = (int)dbook.noteid;
                ar.buyerid = (int)dbook.buyerid;
                if (comments != null)
                {
                    ar.comments = comments;
                }
                context.reviews.Add(ar);
                context.SaveChanges();
            }
            return RedirectToAction("mydownload", "mydownload");
        }

        [HttpPost]
        public ActionResult spam(int downloadid, string comments)
        {
            var downloadbook = context.download.Where(x => x.id == downloadid).FirstOrDefault();
            var spamrecord = context.spam.Where(x => x.downloadid == downloadid).FirstOrDefault();
            var notes = context.notedetails.Where(x => x.id == downloadbook.noteid).FirstOrDefault();
            if(spamrecord!=null)
            {
                spamrecord.isspam = true;
                spamrecord.remarks = comments;
                spamrecord.modifieddate = DateTime.Now;
                spamrecord.isActive = true;
            }
            else
            {
                spam sp = new spam();
                sp.noteid = (int)downloadbook.noteid;
                sp.downloadid = downloadid;
                sp.isspam = true;
                if (comments != null)
                {
                    sp.remarks = comments;
                }
                sp.createddate = DateTime.Now;
                sp.buyerid = downloadbook.buyerid;
                sp.isActive = true;
                if(notes.totalspam == null)
                {
                    notes.totalspam = 1;
                }
                else
                {
                    notes.totalspam = notes.totalspam + 1;
                }
                context.spam.Add(sp);
                context.SaveChanges();
            }
            return RedirectToAction("mydownload", "mydownload");
        }
    }
}