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


            dynamic snotes = new ss();

            var sn = (from book in context.notedetails
                      join country in context.country
                      on book.countryid equals country.id
                      join category in context.category
                      on book.categoryid equals category.id
                      join type in context.notetype
                      on book.typeid equals type.id
                      join r in context.reviews
                      on book.id equals r.noteid into rr
                      from r in rr.DefaultIfEmpty()
                     
                      
                      where book.isActive == true
                      group new { book,r,category,type,country} by new {book.id} into pg


                      select new searchnotes
                      {
                          noteid = pg.FirstOrDefault().book.id,
                          date = pg.FirstOrDefault().book.createddate,
                          title = pg.FirstOrDefault().book.title,
                          university = pg.FirstOrDefault().book.universityname,
                          numberofpages = pg.FirstOrDefault().book.numberofpages,
                          country = pg.FirstOrDefault().country.countryname,
                          displaypicture = pg.FirstOrDefault().book.displaypicture,
                          categoryname = pg.FirstOrDefault().category.categoryname,
                          typename = pg.FirstOrDefault().type.typename,
                          coursename = pg.FirstOrDefault().book.coursename,
                          avgeragerating = pg.Average(m=>m.r.ratingstar),
                          totalrating = pg.Count(),
                          totalspam = pg.FirstOrDefault().book.totalspam
                      });

            
            var onlysearch = sn;
            int s = 0;
            int d = 0;

            if (searchbook != null && searchbook !="")
            {
                s = 1;
                onlysearch = sn.Where(x => x.title.Contains(searchbook) || searchbook==null);
            }
            
            if (bycategory != null || bycountry != null || bycourse!=null || bytype!=null || byuniversity!=null || byrating!=null)
            {
                
                bool a = false;
            
                string catn = null;
                if (bycategory != null)
                {
                    if (bycategory != "")
                    {
                        var cat = context.category.Where(x => x.id.ToString() == (bycategory)).FirstOrDefault();
                        catn = cat.categoryname;
                        a = true;
                    }
                }
                string coun = null;
                if (bycountry != null)
                {
                    if (bycountry != "")
                    {
                        var cat = context.country.Where(x => x.id.ToString() == (bycountry)).FirstOrDefault();
                        coun = cat.countryname;
                        a = true;
                    }
                }
                string typn = null;
                if (bytype != null)
                {
                    if (bytype != "")
                    {
                        var cat = context.notetype.Where(x => x.id.ToString() == (bytype)).FirstOrDefault();
                        typn = cat.typename;
                        a = true;
                    }
                }
                string courn = null;
                if (bycourse != null)
                {
                    if (bycourse != "")
                    {
                        courn = bycourse;
                        a = true;
                    }
                }
                string unin = null;
                if (byuniversity != null)
                {
                    if (byuniversity != "")
                    {
                        unin = byuniversity;
                        a = true;
                    }
                }

                int getrating = 0;
                if(!string.IsNullOrEmpty(byrating))
                {
                    getrating = Convert.ToInt32(byrating);
                    a = true;
                }
                
                if (a == true)
                {
                    d = 1;
                    if (!String.IsNullOrEmpty(searchbook))
                    {
                        if (getrating != 0)
                        {
                            sn = sn.Where(x => x.categoryname == catn || x.country == coun || x.typename == typn || x.university == unin || x.coursename == courn || x.avgeragerating >= getrating);
                        }
                        else
                        {
                            sn = sn.Where(x => x.categoryname == catn || x.country == coun || x.typename == typn || x.university == unin || x.coursename == courn);
                        }
                        sn = onlysearch.Union(sn);
                    }
                    else
                    {
                        if (getrating != 0)
                        {
                            sn = sn.Where(x => x.categoryname.ToLower() == catn.ToLower() || x.country.ToLower() == coun.ToLower() || x.typename.ToLower() == typn.ToLower() || x.university.ToLower() == unin.ToLower() || x.coursename.ToLower() == courn.ToLower() || x.avgeragerating >= getrating);
                        }
                        else
                        {
                            sn = sn.Where(x => x.categoryname.ToLower() == catn.ToLower() || x.country.ToLower() == coun.ToLower() || x.typename.ToLower() == typn.ToLower() || x.university.ToLower() == unin.ToLower() || x.coursename.ToLower() == courn.ToLower());
                        }
                    }
                } 
            }

            
            
            if(s==1 && d==0)
            {
                ViewBag.count = onlysearch.Count();
                snotes.ssn = onlysearch.ToList().ToPagedList(i ?? 1, 9);
                return View(snotes);
            }
            ViewBag.count = sn.Count();
            snotes.ssn = sn.ToList().ToPagedList(i ?? 1, 9);
            return View(snotes);
        }




        public SelectList categorylist()
        {
            var category = new SelectList(context.category.Where(x => x.isActive == true), "id", "categoryname");
            return category;
        }
        public SelectList typelistlist()
        {
            var types = new SelectList(context.notetype.Where(x => x.isActive == true), "id", "typename");
            return types;
        }
        public SelectList countrylist()
        {
            var countries = new SelectList(context.country.Where(x => x.isActive == true), "id", "countryname");
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