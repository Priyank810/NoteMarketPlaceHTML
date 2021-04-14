using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using notesplace.Models;
using System.IO;
using System.IO.Compression;
using Ionic.Zip;

namespace notesplace.Controllers
{
    public class bookdetailsController : Controller
    {
        // GET: bookdetails

        notesmarketplaceEntities context = new notesmarketplaceEntities();

        // For displaying details of notes
        public ActionResult display(int nid)
        {
            int flag = 0;
            int isadmin = 0; 
            if (User.Identity.IsAuthenticated)
            {
                var getuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
                var userprofilestatus = context.userdetails.Where(x => x.usserid == getuser.id).FirstOrDefault();

                if(getuser.roleid == 1 || getuser.roleid == 2)
                {
                    isadmin = 1;
                    ViewBag.Admin = 1;
                }
                
                else if (userprofilestatus != null)
                {
                    ViewBag.image = userprofilestatus.profilepicture;
                    flag = 1;
                }
            }

            dynamic bookdetails = new bookdetails();
            ViewBag.defaultnoteimage = context.systemconfig.FirstOrDefault().defaultnotepicture;

            if (flag == 1 || User.Identity.IsAuthenticated == false || isadmin == 1)
            {
                var details = (from book in context.notedetails
                               join category in context.category
                               on book.categoryid equals category.id
                               join type in context.notetype
                               on book.typeid equals type.id
                               join country in context.country
                               on book.countryid equals country.id
                               join noteattachments in context.noteattachment
                               on book.id equals noteattachments.noteid
                              

                               where book.id == nid

                               select new bookdetail
                               {
                                   userid = book.userid,
                                   noteid = book.id,
                                   title = book.title,
                                   booktype = type.typename,
                                   categoryname = category.categoryname,
                                   description = book.description,
                                   sellprice = book.sellprice,
                                   institutename = book.universityname,
                                   country = country.countryname,
                                   coursename = book.coursename,
                                   coursecode = book.coursecode,
                                   professor = book.professor,
                                   numberofpages = book.numberofpages,
                                   bookimage = book.displaypicture,
                                   bookpreview = book.notepreviewfile,
                                   bookpdf = noteattachments.filepath,
                                   totalspam = book.totalspam,
                                   createddate = book.createddate
                               }).FirstOrDefault();
                
                if(details.bookimage == null)
                {
                    details.bookimage = ViewBag.defaultnoteimage;
                }
                bookdetails.bb = details;
                

                List<ratings> ratings = (from book in context.notedetails
                                  join user in context.userdetails
                                  on book.userid equals user.usserid
                                  join uname in context.users
                                  on book.userid equals uname.id
                                  join review in context.reviews
                                  on book.id equals review.noteid into r
                                  from review in r.DefaultIfEmpty()
                                  where book.isActive == true && book.id == nid

                                    select new ratings
                                    {
                                        ratingid = review.id,
                                        name = context.users.Where(x=>x.id == review.buyerid).FirstOrDefault().firstname+" "+ context.users.Where(x => x.id == review.buyerid).FirstOrDefault().lastname,
                                        profile = user.profilepicture,
                                        star = review.ratingstar*20,
                                        comments = review.comments,
                                    }
                                  ).ToList();
                bookdetails.rating = ratings;


                var record = context.reviews.Where(x => x.noteid == nid).FirstOrDefault();
                if (record!= null)
                {
                    var records = context.reviews.Where(x => x.noteid == nid);
                    int totalrecords = records.Count();
                    double totalstar = (records.Select(x => x.ratingstar).Sum() * 20)/totalrecords;
                    ViewBag.totalrecords = totalrecords;
                    ViewBag.totalstar = totalstar;
                }
                else
                {
                    ViewBag.totalrecords = 0;
                    ViewBag.totalstar = 0;
                }

                if (isadmin != 1)
                {
                    var userid = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
                    if (userid != null)
                    {
                        ViewBag.currentuser = userid.id;

                        ViewBag.username = userid.firstname;
                        var getbook = context.notedetails.Where(x => x.id == nid).FirstOrDefault();
                        var checkdownload = context.download.Where(x => x.sellerid == getbook.userid && x.buyerid == userid.id && x.noteid == getbook.id).FirstOrDefault();
                        if (checkdownload != null)
                        {
                            if (checkdownload.isapproved == true)
                            {
                                ViewBag.isapproved = true;
                            }
                            else if (checkdownload.isapproved == false)
                            {
                                ViewBag.isrequested = true;
                            }
                        }
                    }
                }
                return View(bookdetails);
            }
            return RedirectToAction("userprofile", "userprofile");
        }

    }
}