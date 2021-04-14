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
    public class searchnotesController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: searchnotes

        public ActionResult search(int? i, string searchbook, string bycountry, string bycategory, string bytype, string byuniversity, string bycourse, string byrating)
        {
            if (User.Identity.IsAuthenticated)
            {
                var getuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
                if (getuser.roleid == 1 || getuser.roleid == 2)
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

            ViewBag.bycategory = bycategory;
            ViewBag.bytype = bytype;
            ViewBag.bycountry = bycountry;
            ViewBag.byuniversity = byuniversity;
            ViewBag.bycourse = bycourse;

            ViewBag.category = categorylist();
            ViewBag.notetype = typelistlist();
            ViewBag.country = countrylist();
            ViewBag.university = universitylist();
            ViewBag.course = courselist();
            ViewBag.rating = ratinglist();


            var sn = (from book in context.notedetails
                      join country in context.country
                      on book.countryid equals country.id
                      join category in context.category
                      on book.categoryid equals category.id
                      join type in context.notetype
                      on book.typeid equals type.id
                      join status in context.statustype
                      on book.statusid equals status.id
                     
                      
                      where book.isActive == true && status.status == "published"


                      select new searchnotes
                      {
                          noteid = book.id,
                          date = book.createddate,
                          title = book.title,
                          university = book.universityname,
                          numberofpages = book.numberofpages,
                          country = country.countryname,
                          displaypicture = book.displaypicture,
                          categoryname = category.categoryname,
                          typename = type.typename,
                          coursename = book.coursename,
                          avgeragerating = context.reviews.Where(x=>x.noteid == book.id).Average(m=>m.ratingstar),
                          totalrating = context.reviews.Where(x => x.noteid == book.id).Count(),
                          totalspam = book.totalspam
                      });

            if (!string.IsNullOrEmpty(searchbook))
            {
                sn = sn.Where(x => x.title.Contains(searchbook) || x.categoryname.Contains(searchbook) || x.country.Contains(searchbook) || x.typename.Contains(searchbook)||x.coursename.Contains(searchbook)||x.university.Contains(searchbook));
            }
            if(!string.IsNullOrEmpty(bycategory))
            {
                sn = sn.Where(x => x.categoryname == bycategory);
            }
            if (!string.IsNullOrEmpty(bycountry))
            {
                sn = sn.Where(x => x.country == bycountry);
            }
            if (!string.IsNullOrEmpty(bytype))
            {
                sn = sn.Where(x => x.typename == bytype);
            }
            if (!string.IsNullOrEmpty(bycourse))
            {
                sn = sn.Where(x => x.coursename == bycourse);
            }
            if (!string.IsNullOrEmpty(byuniversity))
            {
                sn = sn.Where(x => x.university == byuniversity);
            }
            if (!string.IsNullOrEmpty(byrating))
            {
                var getrating = Convert.ToInt32(byrating);
                sn = sn.Where(x => x.avgeragerating >= getrating);
            }


            dynamic snotes = new ss();
            ViewBag.count = sn.Count();
            snotes.ssn = sn.OrderByDescending(x=>x.date).ToList().ToPagedList(i ?? 1, 9);
            ViewBag.defaultnoteimage = context.systemconfig.FirstOrDefault().defaultnotepicture;
            return View(snotes);
        }




        public SelectList categorylist()
        {
            var category = new SelectList(context.category.Where(x => x.isActive == true), "categoryname", "categoryname");
            return category;
        }
        public SelectList typelistlist()
        {
            var types = new SelectList(context.notetype.Where(x => x.isActive == true), "typename", "typename");
            return types;
        }
        public SelectList countrylist()
        {
            var countries = new SelectList(context.country.Where(x => x.isActive == true), "countryname", "countryname");
            return countries;
        }
        public SelectList universitylist()
        {
            var getdata = context.notedetails.Where(x => x.isActive == true).Select(x => x.universityname).Distinct().ToList();
            List<SelectListItem> list = new List<SelectListItem>();
            foreach (var g in getdata)
            {
                list.Add(new SelectListItem()
                {
                    Text = g,
                    Value = g
                });
            }
            return new SelectList(list, "Value", "Text");
        }
        public SelectList courselist()
        {
            var getdata = context.notedetails.Where(x => x.isActive == true).Select(x => x.coursename).Distinct().ToList();
            List<SelectListItem> list = new List<SelectListItem>();
            foreach (var g in getdata)
            {
                list.Add(new SelectListItem()
                {
                    Text = g,
                    Value = g
                });
            }
            return new SelectList(list, "Value", "Text");
        }
        public SelectList ratinglist()
        {
            List<SelectListItem> list = new List<SelectListItem>() {

            new SelectListItem { Text = "1+", Value = "1" },
            new SelectListItem { Text = "2+", Value = "2" },
            new SelectListItem { Text = "3+", Value = "3" },
            new SelectListItem { Text = "4+", Value = "4" },
            };               
            
            return new SelectList(list, "Value", "Text");
        }
    }
}