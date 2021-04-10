using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using notesplace.Models;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Controllers
{
    [Authorize(Roles ="superadmin,admin")]
    public class memberController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: member
        public ActionResult member(int? i, string search, string sortBy)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }


            ViewBag.SortByDate = string.IsNullOrEmpty(sortBy) ? "JOINING DATE" : "";
            ViewBag.SortByFirstname = sortBy == "FIRST NAME" ? "FIRST NAME desc" : "FIRST NAME";
            ViewBag.SortByLastname = sortBy == "LAST NAME" ? "LAST NAME desc" : "LAST NAME";
            ViewBag.SortByEmail = sortBy == "EMAIL" ? "EMAIL desc" : "EMAIL";
            ViewBag.SortByUnderreviewnotes = sortBy == "UNDER REVIEW NOTES" ? "UNDER REVIEW NOTES desc" : "UNDER REVIEW NOTES";
            ViewBag.SortByPublishednotes = sortBy == "PUBLISHED NOTES" ? "PUBLISHED NOTES desc" : "PUBLISHED NOTES";
            ViewBag.SortByDownloadednotes = sortBy == "DOWNLOADED NOTES" ? "DOWNLOADED NOTES desc" : "DOWNLOADED NOTES";
            ViewBag.SortByTotalexpenses = sortBy == "TOTAL EXPENSES" ? "TOTAL EXPENSES desc" : "TOTAL EXPENSES";
            ViewBag.SortByTotalearning = sortBy == "TOTAL EARNING" ? "TOTAL EARNING desc" : "TOTAL EARNING";

            var memberlist = (from user in context.users

                              where (user.roleid == 3)

                              select new member
                              {
                                  isActive = (bool)user.isActive,
                                  memberid = user.id,
                                  firstname = user.firstname,
                                  lastname = user.lastname,
                                  email = user.email,
                                  joiningdate = user.createddate,
                                  underreviewnotes = context.notedetails.Where(x => x.userid == user.id && (x.statusid == 1 || x.statusid == 6) && x.isActive == true).Count(),
                                  publishednotes = context.notedetails.Where(x => x.userid == user.id && x.statusid == 2 && x.isActive == true).Count(),
                                  downloadednotes = context.download.Where(x=>x.buyerid == user.id && x.isdownloaded == true).Count(),
                                  totalexpense = context.download.Where(x => x.buyerid == user.id && x.isapproved == true).Select(x=>x.purchaseprice).Sum(),
                                  totalearning = context.download.Where(x => x.sellerid == user.id && x.isapproved == true).Select(x => x.purchaseprice).Sum()
                              });


            members members = new members();

            var temp = memberlist;

            if (!string.IsNullOrEmpty(search))
            {
                memberlist = memberlist.Where(x => x.firstname.Contains(search) || x.lastname.Contains(search) || x.email.Contains(search));
                temp = memberlist;
            }

            switch (sortBy)
            {
                case "JOINING DATE":
                    temp = temp.OrderByDescending(x => x.joiningdate);
                    break;

                case "FIRST NAME desc":
                    temp = temp.OrderByDescending(x => x.firstname);
                    break;

                case "FIRST NAME":
                    temp = temp.OrderBy(x => x.firstname);
                    break;

                case "LAST NAME desc":
                    temp = temp.OrderByDescending(x => x.lastname);
                    break;

                case "LAST NAME":
                    temp = temp.OrderBy(x => x.lastname);
                    break;

                case "EMAIL desc":
                    temp = temp.OrderByDescending(x => x.email);
                    break;

                case "EMAIL":
                    temp = temp.OrderBy(x => x.email);
                    break;

                case "UNDER REVIEW NOTES desc":
                    temp = temp.OrderByDescending(x => x.underreviewnotes);
                    break;

                case "UNDER REVIEW NOTES":
                    temp = temp.OrderBy(x => x.underreviewnotes);
                    break;

                case "PUBLISHED NOTES desc":
                    temp = temp.OrderByDescending(x => x.publishednotes);
                    break;

                case "PUBLISHED NOTES":
                    temp = temp.OrderBy(x => x.publishednotes);
                    break;

                case "DOWNLOADED NOTES desc":
                    temp = temp.OrderByDescending(x => x.downloadednotes);
                    break;

                case "DOWNLOADED NOTES":
                    temp = temp.OrderBy(x => x.downloadednotes);
                    break;

                case "TOTAL EXPENSES desc":
                    temp = temp.OrderByDescending(x => x.totalexpense);
                    break;

                case "TOTAL EXPENSES":
                    temp = temp.OrderBy(x => x.totalexpense);
                    break;

                case "TOTAL EARNING desc":
                    temp = temp.OrderByDescending(x => x.totalearning);
                    break;

                case "TOTAL EARNING":
                    temp = temp.OrderBy(x => x.totalearning);
                    break;

                default:
                    temp = temp.OrderBy(x => x.joiningdate);
                    break;
            }

            members.member = temp.ToList().ToPagedList(i??1,5);
            ViewBag.counter = 5 * (i - 1);

            return View(members);
        }

        public ActionResult memberdetails(int? i, int userid, string sortBy)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            ViewBag.SortByDate = string.IsNullOrEmpty(sortBy) ? "DATE ADDED" : "";
            ViewBag.SortByTitle = sortBy == "NOTE TITLE" ? "NOTE TITLE desc" : "NOTE TITLE";
            ViewBag.SortByCategory = sortBy == "CATEGORY" ? "CATEGORY desc" : "CATEGORY";
            ViewBag.SortBySeller = sortBy == "DOWNLOADED NOTES" ? "DOWNLOADED NOTES desc" : "DOWNLOADED NOTES";
            ViewBag.SortBySeller = sortBy == "TOTAL EARNINGS" ? "TOTAL EARNINGS desc" : "TOTAL EARNINGS";
            ViewBag.SortBySeller = sortBy == "PUBLISHED DATE" ? "PUBLISHED DATE desc" : "PUBLISHED DATE";

            var user = context.users.Where(x => x.id == userid).FirstOrDefault();
            var userinfo = context.userdetails.Where(x => x.usserid == userid).FirstOrDefault();
            memberdetail memberdetail = new memberdetail();

            memberdetail.memberid = user.id;
            memberdetail.firstname = user.firstname;
            memberdetail.lastname = user.lastname;
            memberdetail.email = user.email;
            memberdetail.photo = userinfo.profilepicture;
            memberdetail.dob = userinfo.dob.ToString();
            memberdetail.phonenumber = userinfo.mobilenumber;
            memberdetail.university = userinfo.university;
            memberdetail.address1 = userinfo.addressline1;
            memberdetail.address2 = userinfo.addressline2;
            memberdetail.city = userinfo.city;
            memberdetail.state = userinfo.state;
            memberdetail.country = context.country.Where(x=>x.id == userinfo.countryid).FirstOrDefault().countryname;
            memberdetail.zipcode = userinfo.zipcode;

            var notes = (from book in context.notedetails
                     join status in context.statustype
                     on book.statusid equals status.id
                     join category in context.category
                     on book.categoryid equals category.id

                     where (status.status == "published" && book.userid == user.id)

                     select new membernotes
                     {
                         noteid = book.id,
                         notetitle = book.title,
                         category = category.categoryname,
                         status = status.status,
                         downloadednotes = context.download.Where(x=>x.isdownloaded == true && x.noteid == book.id).Count(),
                         totalearnings = context.download.Where(x=>x.isapproved == true || x.isdownloaded == true && x.noteid == book.id).Select(x=>x.purchaseprice).Sum(),
                         addeddate = (DateTime)book.createddate,
                         publisheddate = (DateTime)book.approveddate,
                     });

            var temp = notes;

            switch (sortBy)
            {
                case "DATE ADDED":
                    temp = temp.OrderByDescending(x => x.addeddate);
                    break;

                case "NOTE TITLE desc":
                    temp = temp.OrderByDescending(x => x.notetitle);
                    break;

                case "NOTE TITLE":
                    temp = temp.OrderBy(x => x.notetitle);
                    break;

                case "DOWNLOADED NOTES desc":
                    temp = temp.OrderByDescending(x => x.downloadednotes);
                    break;

                case "DOWNLOADED NOTES":
                    temp = temp.OrderBy(x => x.downloadednotes);
                    break;

                case "TOTAL EARNINGS desc":
                    temp = temp.OrderByDescending(x => x.totalearnings);
                    break;

                case "TOTAL EARNINGS":
                    temp = temp.OrderBy(x => x.totalearnings);
                    break;

                case "PUBLISHED DATE desc":
                    temp = temp.OrderByDescending(x => x.publisheddate);
                    break;

                case "PUBLISHED DATE":
                    temp = temp.OrderBy(x => x.publisheddate);
                    break;

                case "CATEGORY desc":
                    temp = temp.OrderByDescending(x => x.category);
                    break;

                case "CATEGORY":
                    temp = temp.OrderBy(x => x.category);
                    break;
                default:
                    temp = temp.OrderBy(x => x.addeddate);
                    break;
            }

            memberdetail.membernotes = temp.ToList().ToPagedList(i ?? 1, 5);
            ViewBag.counter = 5 * (i - 1);

            return View(memberdetail);
        }

        public ActionResult deactivate(int userid)
        {
            var getuser = context.users.Where(x => x.id == userid).FirstOrDefault();
            
            getuser.isActive = false;

            var getnotes = context.notedetails.Where(x => x.userid == userid);
            var getstatus = context.statustype.Where(x => x.status == "removed").FirstOrDefault().id;

            foreach(var g in getnotes)
            {
                g.statusid = getstatus;
            }

            context.SaveChanges();

            return RedirectToAction("member", "member");
        }
        public ActionResult reactivate(int userid)
        {
            var getuser = context.users.Where(x => x.id == userid).FirstOrDefault();

            getuser.isActive = true;

            var getnotes = context.notedetails.Where(x => x.userid == userid);
            var getstatus = context.statustype.Where(x => x.status == "submittedforreview").FirstOrDefault().id;

            foreach (var g in getnotes)
            {
                g.statusid = getstatus;
            }

            context.SaveChanges();

            return RedirectToAction("member", "member");
        }
    }
}