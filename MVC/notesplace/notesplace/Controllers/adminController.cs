using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using notesplace.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;

namespace notesplace.Controllers
{
    [Authorize(Roles ="superadmin,admin")]
    public class adminController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: admin

        //admin dashboard
        public ActionResult dashboard(int? i, string search, string bymonth, string sortBy)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if ( getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            ViewBag.bymonth = bymonth;
            ViewBag.month = monthlist();

            ViewBag.SortByDate = string.IsNullOrEmpty(sortBy) ? "PUBLISHED DATE" : "";
            ViewBag.SortByTitle = sortBy == "NOTE TITLE" ? "NOTE TITLE desc" : "NOTE TITLE";
            ViewBag.SortByCategory = sortBy == "CATEGORY" ? "CATEGORY desc" : "CATEGORY";
            ViewBag.SortByPublisher = sortBy == "PUBLISHER" ? "PUBLISHER desc" : "PUBLISHER";
            ViewBag.SortByPrice = sortBy == "PRICE" ? "PRICE desc" : "PRICE";
            ViewBag.SortByNumberofdownloads = sortBy == "NUMBER OF DOWNLOADS" ? "NUMBER OF DOWNLOADS desc" : "NUMBER OF DOWNLOADS";

            admindashboard admindashboard = new admindashboard();
            stats stats = new stats();

            var dt = DateTime.Now.AddDays(-7);

            stats.notesforpublish = context.notedetails.Where(x => x.statusid == 5 || x.statusid == 6).Count();
            stats.notesdownloaded = context.download.Where(x => x.isdownloaded == true && x.downloadedate > dt).Count();
            stats.newregistration = context.users.Where(x => x.roleid == 3 && x.createddate > dt).Count();

            var pn = (from note in context.notedetails
                      join user in context.users
                      on note.userid equals user.id
                      join category in context.category
                      on note.categoryid equals category.id
                      join f in context.noteattachment
                      on note.id equals f.noteid

                      where (user.isActive == true && note.isActive == true && note.statusid == 2)
                      select new publishednote
                      {
                          noteid = note.id,
                          notetitle = note.title,
                          category = category.categoryname,
                          selltype = note.ispaid,
                          size = f.filepath,
                          price = note.sellprice,
                          publisher = user.firstname +" "+ user.lastname,
                          downloads = context.download.Where(x=>x.noteid == note.id && x.isdownloaded==true).Count(),
                          publisheddate = note.approveddate
                      });


            admindashboard.stats = stats;
            if (!string.IsNullOrEmpty(search))
            {
                pn=pn.Where(x => x.notetitle.Contains(search) || x.category.Contains(search) || x.publisher.Contains(search));
            }


            if (!string.IsNullOrEmpty(bymonth))
            {
                int bm = Convert.ToInt32(bymonth);
                pn = pn.Where(x => x.publisheddate.Value.Month == bm);
            }

            var temp = pn;

        
            switch (sortBy)
            {
                case "PUBLISHED DATE":
                    temp = temp.OrderByDescending(x => x.publisheddate);
                    break;

                case "NOTE TITLE desc":
                    temp = temp.OrderByDescending(x => x.notetitle);
                    break;

                case "NOTE TITLE":
                    temp = temp.OrderBy(x => x.notetitle);
                    break;

                case "PRICE desc":
                    temp = temp.OrderBy(x => x.price);
                    break;

                case "PRICE":
                    temp = temp.OrderByDescending(x => x.price);
                    break;

                case "PUBLISHER desc":
                    temp = temp.OrderByDescending(x => x.publisher);
                    break;

                case "PUBLISHER":
                    temp = temp.OrderBy(x => x.publisher);
                    break;

                case "CATEGORY desc":
                    temp = temp.OrderByDescending(x => x.category);
                    break;

                case "CATEGORY":
                    temp = temp.OrderBy(x => x.category);
                    break;

                case "NUMBER OF DOWNLOADS desc":
                    temp = temp.OrderByDescending(x => x.downloads);
                    break;

                case "NUMBER OF DOWNLOADS":
                    temp = temp.OrderBy(x => x.downloads);
                    break;

                default:
                    temp = temp.OrderBy(x => x.publisheddate);
                    break;
            }

            admindashboard.publishednotes = temp.ToList().ToPagedList(i ?? 1, 5);
            ViewBag.counter = 5 * (i - 1);

            return View(admindashboard);
        }

        //For updating profile 
        public ActionResult updateprofile()
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid; 
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            ViewBag.countrycodelist = countrycodelist();
            var getadmin = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            var getadmindetail = context.admindetails.Where(x => x.adminid == getadmin.id).FirstOrDefault();

            var model = new addadminstrator();
            model.adminid = getadmin.id;
            model.firstname = getadmin.firstname;
            model.lastname = getadmin.lastname;
            model.email = getadmin.email;
            if (getadmindetail.countrycodeid != null)
            {
                model.countrycode = (int)getadmindetail.countrycodeid;
            }
            model.phonenumber = getadmindetail.mobilenumber;

            return View(model);
        }

        [HttpPost]
        public ActionResult updateprofile(addadminstrator model)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            ViewBag.role = getcurrentuser.roleid;
            ViewBag.countrycodelist = countrycodelist();
            if (ModelState.IsValid)
            {
                string profilepicturepath = null;
                if(model.profilepicture!=null)
                {
                    string folderpath = Server.MapPath("~/Members/" + model.adminid.ToString() + "/");
                    if (!Directory.Exists(folderpath))
                    {
                        Directory.CreateDirectory(folderpath);
                    }
                    if (context.admindetails.Where(x=>x.adminid == getcurrentuser.id).FirstOrDefault().profilepicture != null)
                    {
                        var pathf = Server.MapPath(context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault().profilepicture);
                        FileInfo file = new FileInfo(pathf);
                        if (file.Exists)
                        {
                            file.Delete();
                        }
                    }
                    string extension = Path.GetExtension(model.profilepicture.FileName).ToLower();
                    if (extension == ".jpeg" || extension == ".jpg" || extension == ".png")
                    {
                        string path = Server.MapPath("~/Members/" + model.adminid.ToString());
                        string fileName = "DP_" + DateTime.Now.ToString().Replace(':', '-') + extension;
                        string fullpath = Path.Combine(path, fileName);
                        profilepicturepath = "~/Members/" + model.adminid.ToString() + "/" + fileName;
                        model.profilepicture.SaveAs(fullpath);
                    }
                    else
                    {
                        ModelState.AddModelError("profilepicture", "Please Add file with proper extension");
                        return View();
                    }
                }

                var getadmin = context.users.Where(x => x.id == model.adminid).FirstOrDefault();
                var getadmindetail = context.admindetails.Where(x => x.adminid == model.adminid).FirstOrDefault();

                getadmin.firstname = model.firstname;
                getadmin.lastname = model.lastname;
                getadmin.email = model.email;
                getadmin.modifieddate = DateTime.Now;

                getadmindetail.countrycodeid = context.country.Where(x => x.id == model.countrycode).FirstOrDefault().id;
                getadmindetail.mobilenumber = model.phonenumber;
                
                if (model.secondaryemail != null)
                {
                    getadmindetail.secondaryemail = model.secondaryemail;
                }
                getadmindetail.profilepicture = profilepicturepath;
                context.SaveChanges();
                return RedirectToAction("dashboard","admin");
            }
            return View();
        }

        //deleteing comments pf notes 
        public ActionResult deletecomment(int? commentid, int? nid)
        {
            var getcomment = context.reviews.Where(x => x.id == commentid).FirstOrDefault();
            context.reviews.Remove(getcomment);
            context.SaveChanges();

            return RedirectToAction("display", "bookdetails", new { nid = nid });
        }

        public SelectList monthlist()
        {
            List<SelectListItem> list = new List<SelectListItem>();
            list.Add(new SelectListItem()
            {
                Text = "January",
                Value = "01"
            }); list.Add(new SelectListItem()
            {
                Text = "February",
                Value = "02"
            }); list.Add(new SelectListItem()
            {
                Text = "March",
                Value = "03"
            }); list.Add(new SelectListItem()
            {
                Text = "April",
                Value = "04"
            }); list.Add(new SelectListItem()
            {
                Text = "May",
                Value = "05"
            }); list.Add(new SelectListItem()
            {
                Text = "June",
                Value = "06"
            }); list.Add(new SelectListItem()
            {
                Text = "July",
                Value = "07"
            }); list.Add(new SelectListItem()
            {
                Text = "August",
                Value = "08"
            }); list.Add(new SelectListItem()
            {
                Text = "September",
                Value = "09"
            }); list.Add(new SelectListItem()
            {
                Text = "October",
                Value = "10"
            }); list.Add(new SelectListItem()
            {
                Text = "November",
                Value = "11"
            }); list.Add(new SelectListItem()
            {
                Text = "December",
                Value = "12"
            });
            return new SelectList(list, "Value", "Text");
        }
        public SelectList countrycodelist()
        {
            var countrycode = new SelectList(context.country.Where(x => x.isActive == true), "id", "countrycode");
            return countrycode;
        }
    }
}