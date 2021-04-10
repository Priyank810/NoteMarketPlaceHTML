using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using notesplace.Models;
using PagedList;
using PagedList.Mvc;
using System.IO;
using System.IO.Compression;
using Ionic.Zip;

namespace notesplace.Controllers
{
    [Authorize(Roles ="member")]
    public class myrejectednotesController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: myrejectednotes
        public ActionResult myrejectednotes(int? i, string search, string sortBy)
        {
            var currentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            var userprofilestatus = context.userdetails.Where(x => x.usserid == currentuser.id).FirstOrDefault();

            if (userprofilestatus != null)
            {
                ViewBag.image = userprofilestatus.profilepicture;

                ViewBag.SortByTitle = sortBy == "Title" ? "title desc" : "Title";
                ViewBag.SortByCategory = sortBy == "Category" ? "category desc" : "Category";

                myrejectednotelist myrejectednotelist = new myrejectednotelist();

                var nlist = (from note in context.notedetails
                             join user in context.users
                             on note.userid equals user.id


                             where note.statusid == 4 && user.id == currentuser.id

                             select new myrejectednote
                             {
                                 noteid = note.id,
                                 notetitle = note.title,
                                 category = context.category.Where(x=>x.id == note.categoryid).FirstOrDefault().categoryname,
                                 remarks = note.remarks
                             }).Where(x => x.category.Contains(search) || x.notetitle.Contains(search) || search == null);

                switch (sortBy)
                {

                    case "title desc":
                        nlist = nlist.OrderByDescending(x => x.notetitle);
                        break;

                    case "Title":
                        nlist = nlist.OrderBy(x => x.notetitle);
                        break;

                    case "category desc":
                        nlist = nlist.OrderByDescending(x => x.category);
                        break;

                    case "Category":
                        nlist = nlist.OrderBy(x => x.category);
                        break;
                    default:
                        nlist = nlist.OrderBy(x => x.notetitle);
                        break;
                }

                myrejectednotelist.myrejectednote = nlist.ToList().ToPagedList(i ?? 1, 10);
                ViewBag.counter = 10 * (i - 1);
                return View(myrejectednotelist);
                //}

                //return View();
            }
            return RedirectToAction("userprofile", "userprofile");
        }
        public ActionResult download(int noteid)
        {
            var getnote = context.notedetails.Where(x => x.id == noteid).FirstOrDefault();
            string filePaths = Server.MapPath("~/Members/Attachments/" + getnote.userid.ToString() + "/" + getnote.id.ToString() + "/");
            List<string> files = new List<string>();

            foreach (var filepath in Directory.GetFiles(filePaths))
            {
                files.Add(filepath);
            }

            using (var zip = new Ionic.Zip.ZipFile())
            {
                zip.AlternateEncodingUsage = ZipOption.AsNecessary;
                zip.AddDirectoryByName("Files");
                foreach (var file in files)
                {
                    zip.AddFile(file, "Files");

                }
                string zipName = String.Format("Zip_{0}.zip", DateTime.Now.ToString("yyyy-MMM-dd-HHmmss"));
                using (MemoryStream memoryStream = new MemoryStream())
                {
                    zip.Save(memoryStream);
                    return File(memoryStream.ToArray(), "application/zip", zipName);
                }
            }
        }
    }
}