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
    [Authorize(Roles ="superadmin,admin")]
    public class manageController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: manage
        public ActionResult country(string search, int? i, string sortBy)
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
            ViewBag.SortByCountryName = sortBy == "COUNTRY NAME" ? "COUNTRY NAME desc" : "COUNTRY NAME";
            ViewBag.SortByCountryCode = sortBy == "COUNTRY CODE" ? "COUNTRY CODE desc" : "COUNTRY CODE";

            var clist = (from country in context.country
                         join user in context.users
                         on country.createdby equals user.id
                         
                         select new countryinfo
                         {
                            countryid = country.id,
                            countryname = country.countryname,
                            countrycode = country.countrycode,
                            dateadded = country.createddate,
                            addedby = user.firstname+" "+user.lastname,
                            active = (bool)country.isActive,
                         }).Where(x=>x.countryname.Contains(search) || x.countrycode.Contains(search) || x.addedby.Contains(search) || search == null);

            switch (sortBy)
            {

                case "DATE ADDED":
                    clist = clist.OrderByDescending(x => x.dateadded);
                    break;

                case "COUNTRY NAME desc":
                    clist = clist.OrderByDescending(x => x.countryname);
                    break;

                case "COUNTRY NAME":
                    clist = clist.OrderBy(x => x.countryname);
                    break;

                case "COUNTRY CODE desc":
                    clist = clist.OrderByDescending(x => x.countrycode);
                    break;

                case "COUNTRY CODE":
                    clist = clist.OrderBy(x => x.countrycode);
                    break;
                default:
                    clist = clist.OrderBy(x => x.dateadded);
                    break;
            }

            var countrylist = new countrylist();
            countrylist.country = clist.ToList().ToPagedList(i ?? 1, 5);

             ViewBag.counter = 5 * (i - 1);

            return View(countrylist);
        }

        public ActionResult editcountry(int? countryid)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid; 
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            var getcountry = context.country.Where(x => x.id == countryid).FirstOrDefault();

            var model = new notesplace.Models.country();
            model.countryid = countryid;
            model.countryname = getcountry.countryname;
            model.countrycode = getcountry.countrycode;

            return View(model);
        }

        [HttpPost]
        public ActionResult editcountry(notesplace.Models.country model)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            if (ModelState.IsValid)
            {
                var checkcountryname = context.country.Any(x => x.countryname == model.countryname && x.id != model.countryid);
                if (checkcountryname == true)
                {
                    ModelState.AddModelError("countryname", "country already exists");
                    return View();
                }
                var checkcountrycode = context.country.Any(x => x.countrycode == model.countrycode && x.id != model.countryid);
                if (checkcountrycode == true)
                {
                    ModelState.AddModelError("countrycode", "country already exists");
                    return View();
                }

                var getcountry = context.country.Where(x => x.id == model.countryid).FirstOrDefault();

                getcountry.countryname = model.countryname;
                getcountry.countrycode = model.countrycode;

                context.SaveChanges();
                return RedirectToAction("country", "manage");
            }
            return View();
        }

        public ActionResult deactivatecountry(int? countryid)
        {

            var getcountry = context.country.Where(x => x.id == countryid).FirstOrDefault();
            
            getcountry.isActive = false;

            context.SaveChanges();
            return RedirectToAction("country", "manage");
        }

        public ActionResult reactivatecountry(int? countryid)
        {

            var getcountry = context.country.Where(x => x.id == countryid).FirstOrDefault();

            getcountry.isActive = true;

            context.SaveChanges();
            return RedirectToAction("country", "manage");
        }

        //manage category
        public ActionResult category(string search, int? i, string sortBy)
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
            ViewBag.SortByCategoryName = sortBy == "CATEGORY NAME" ? "CATEGORY NAME desc" : "CATEGORY NAME";

            var clist = (from category in context.category
                         join user in context.users
                         on category.createdby equals user.id

                         select new categoryinfo
                         {
                             categoryid = category.id,
                             categoryname = category.categoryname,
                             categorydescription = category.description,
                             dateadded = category.createddate,
                             addedby = user.firstname + " " + user.lastname,
                             active = (bool)category.isActive,
                         }).Where(x => x.categoryname.Contains(search) || x.addedby.Contains(search) || search == null);

            switch (sortBy)
            {

                case "DATE ADDED":
                    clist = clist.OrderByDescending(x => x.dateadded);
                    break;

                case "CATEGORY NAME desc":
                    clist = clist.OrderByDescending(x => x.categoryname);
                    break;

                case "CATEGORY NAME":
                    clist = clist.OrderBy(x => x.categoryname);
                    break;

                default:
                    clist = clist.OrderBy(x => x.dateadded);
                    break;
            }

            var categorylist = new categorylist();
            categorylist.category = clist.ToList().ToPagedList(i ?? 1, 5);

            ViewBag.counter = 5 * (i - 1);

            return View(categorylist);
        }
        public ActionResult editcategory(int? categoryid)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            var getcategory = context.category.Where(x => x.id == categoryid).FirstOrDefault();

            var model = new notesplace.Models.category();
            model.categoryid = categoryid;
            model.categoryname = getcategory.categoryname;
            model.categorydescription = getcategory.description;

            return View(model);
        }

        [HttpPost]
        public ActionResult editcategory(notesplace.Models.category model)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            if (ModelState.IsValid)
            {
                var checkcategoryname = context.category.Any(x => x.categoryname == model.categoryname && x.id != model.categoryid);
                if (checkcategoryname == true)
                {
                    ModelState.AddModelError("categoryname", "category already exists");
                    return View();
                }

                var getcategory = context.category.Where(x => x.id == model.categoryid).FirstOrDefault();

                getcategory.categoryname = model.categoryname;
                getcategory.description = model.categorydescription;

                context.SaveChanges();
                return RedirectToAction("category", "manage");
            }
            return View();
        }
        public ActionResult deactivatecategory(int? categoryid)
        {

            var getcategory = context.category.Where(x => x.id == categoryid).FirstOrDefault();
            getcategory.isActive = false;

            context.SaveChanges();
            return RedirectToAction("category", "manage");
        }

        public ActionResult reactivatecategory(int? categoryid)
        {

            var getcategory = context.category.Where(x => x.id == categoryid).FirstOrDefault();
            getcategory.isActive = true;

            context.SaveChanges();
            return RedirectToAction("category", "manage");
        }

        //manage type
        public ActionResult type(string search, int? i, string sortBy)
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
            ViewBag.SortByType = sortBy == "TYPE" ? "TYPE desc" : "TYPE";

            var clist = (from type in context.notetype
                         join user in context.users
                         on type.createdby equals user.id

                         select new typeinfo
                         {
                             typeid = type.id,
                             typename = type.typename,
                             typedescription = type.description,
                             dateadded = type.createddate,
                             addedby = user.firstname + " " + user.lastname,
                             active = (bool)type.isActive,
                         }).Where(x => x.typename.Contains(search) || x.addedby.Contains(search) || search == null);

            switch (sortBy)
            {

                case "DATE ADDED":
                    clist = clist.OrderByDescending(x => x.dateadded);
                    break;

                case "TYPE desc":
                    clist = clist.OrderByDescending(x => x.typename);
                    break;

                case "TYPE":
                    clist = clist.OrderBy(x => x.typename);
                    break;

                default:
                    clist = clist.OrderBy(x => x.dateadded);
                    break;
            }

            var typelist = new typelist();
            typelist.type = clist.ToList().ToPagedList(i ?? 1, 5);

            ViewBag.counter = 5 * (i - 1);

            return View(typelist);
        }
        public ActionResult edittype(int? typeid)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            var gettype = context.notetype.Where(x => x.id == typeid).FirstOrDefault();

            var model = new notesplace.Models.type();
            model.typeid = typeid;
            model.typename = gettype.typename;
            model.typedescription = gettype.description;

            return View(model);
        }

        [HttpPost]
        public ActionResult edittype(notesplace.Models.type model)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            if (ModelState.IsValid)
            {
                var checktypename = context.notetype.Any(x => x.typename == model.typename && x.id != model.typeid);
                if (checktypename == true)
                {
                    ModelState.AddModelError("typename", "type already exists");
                    return View();
                }

                var gettype = context.notetype.Where(x => x.id == model.typeid).FirstOrDefault();

                gettype.typename = model.typename;
                gettype.description = model.typedescription;

                context.SaveChanges();
                return RedirectToAction("type", "manage");
            }
            return View();
        }
        public ActionResult deactivatetype(int? typeid)
        {
            var gettype = context.notetype.Where(x => x.id == typeid).FirstOrDefault();

            gettype.isActive = false;

            context.SaveChanges();
            return RedirectToAction("type", "manage");
        }

        public ActionResult reactivatetype(int? typeid)
        {
            var gettype = context.notetype.Where(x => x.id == typeid).FirstOrDefault();

            gettype.isActive = true;

            context.SaveChanges();
            return RedirectToAction("type", "manage");
        }

        // manage administrator
        public ActionResult administrator(string search, int? i, string sortBy)
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
            ViewBag.SortByFirstName = sortBy == "FIRST NAME" ? "FIRST NAME desc" : "FIRST NAME";
            ViewBag.SortByLastName = sortBy == "LAST NAME" ? "LAST NAME desc" : "LAST NAME";
            ViewBag.SortByEmail = sortBy == "EMAIL" ? "EMAIL desc" : "EMAIL";
            
            var alist = (from admin in context.users
                         join admindetail in context.admindetails
                         on admin.id equals admindetail.adminid

                         where (admin.roleid ==2)

                         select new administrator
                         {
                             adminid = admin.id,
                             firstname = admin.firstname,
                             lastname = admin.lastname,
                             email=admin.email,
                             phonenumber = admindetail.mobilenumber,
                             dateadded=admin.createddate,
                             active = admin.isActive
                         }).Where(x => x.firstname.Contains(search) || x.lastname.Contains(search) || x.email.Contains(search) || search == null);

            switch (sortBy)
            {

                case "DATE ADDED":
                    alist = alist.OrderByDescending(x => x.dateadded);
                    break;

                case "FIRST NAME desc":
                    alist = alist.OrderByDescending(x => x.firstname);
                    break;

                case "FIRST NAME":
                    alist = alist.OrderBy(x => x.firstname);
                    break;

                case "LAST NAME desc":
                    alist = alist.OrderByDescending(x => x.lastname);
                    break;

                case "LAST NAME":
                    alist = alist.OrderBy(x => x.lastname);
                    break;
                case "EMAIL desc":
                    alist = alist.OrderByDescending(x => x.email);
                    break;

                case "EMAIL":
                    alist = alist.OrderBy(x => x.email);
                    break;
                default:
                    alist = alist.OrderBy(x => x.dateadded);
                    break;
            }

            var adminlist = new administratorlist();
            adminlist.administrators = alist.ToList().ToPagedList(i ?? 1, 5);

            ViewBag.counter = 5 * (i - 1);

            return View(adminlist);
        }
        public ActionResult editadministrator(int adminid)
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
            var getadmin = context.users.Where(x => x.id == adminid).FirstOrDefault();
            var getadmindetail = context.admindetails.Where(x => x.adminid == adminid).FirstOrDefault();

            var model = new addadminstrator();
            model.adminid = adminid;
            model.firstname = getadmin.firstname;
            model.lastname = getadmin.lastname;
            model.email = getadmin.email;
            model.countrycode = (int)getadmindetail.countrycodeid;
            model.phonenumber = getadmindetail.mobilenumber;

            return View(model);
        }

        [HttpPost]
        public ActionResult editadministrator(addadminstrator model)
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
            if (ModelState.IsValid)
            {
                bool isEmailExists = context.users.Any(x => x.email == model.email && x.id != model.adminid);
                if (isEmailExists)
                {
                    ModelState.AddModelError("email", "Email already exits");
                    return View(model);
                }

                var getadmin = context.users.Where(x => x.id == model.adminid).FirstOrDefault();
                var getadmindetail = context.admindetails.Where(x => x.adminid == model.adminid).FirstOrDefault();

                getadmin.firstname = model.firstname;
                getadmin.lastname = model.lastname;
                getadmin.email = model.email;
                getadmin.modifieddate = DateTime.Now;

                getadmindetail.countrycodeid = context.country.Where(x => x.id == model.countrycode).FirstOrDefault().id;
                getadmindetail.mobilenumber = model.phonenumber;

                context.SaveChanges();
                return RedirectToAction("administrator", "manage");
            }
            return View();
        }
        public ActionResult deactivatetadministrator(int adminid)
        {
            var gettype = context.users.Where(x => x.id == adminid).FirstOrDefault();

            gettype.isActive = false;

            context.SaveChanges();
            return RedirectToAction("administrator", "manage");
        }

        public ActionResult reactivatetadministrator(int adminid)
        {
            var gettype = context.users.Where(x => x.id == adminid).FirstOrDefault();

            gettype.isActive = true;

            context.SaveChanges();
            return RedirectToAction("administrator", "manage");
        }
        public SelectList countrycodelist()
        {
            var countrycode = new SelectList(context.country.Where(x => x.isActive == true), "id", "countrycode");
            return countrycode;
        }
    }
}