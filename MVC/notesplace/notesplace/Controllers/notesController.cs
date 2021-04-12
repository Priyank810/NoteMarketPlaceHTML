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
using System.Net.Mail;

namespace notesplace.Controllers
{
    [Authorize(Roles = "superadmin,admin")]
    public class notesController : Controller
    {
        notesmarketplaceEntities context = new notesmarketplaceEntities();
        // GET: notes

        //all the notes that are submitted for review or are in review
        //from here admin can approve, reject or make status inreview of notes
        public ActionResult notesunderreview(int? i, string search, string byseller, string sortBy)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            ViewBag.sellers = sellerlist(6);

            ViewBag.byseller = byseller;


            ViewBag.SortByDate = string.IsNullOrEmpty(sortBy) ? "DATE ADDED" : "";
            ViewBag.SortByTitle = sortBy == "NOTE TITLE" ? "NOTE TITLE desc" : "NOTE TITLE";
            ViewBag.SortByCategory = sortBy == "CATEGORY" ? "CATEGORY desc" : "CATEGORY";
            ViewBag.SortBySeller = sortBy == "SELLER" ? "SELLER desc" : "SELLER";

            var n = (from book in context.notedetails
                     join user in context.users
                     on book.userid equals user.id
                     join status in context.statustype
                     on book.statusid equals status.id
                     join category in context.category
                     on book.categoryid equals category.id

                     where (status.status == "inreview" || status.status == "submittedforreview") && book.isActive == true

                     select new note
                     {
                         noteid = book.id,
                         sellerid = user.id,
                         notetitle = book.title,
                         category = category.categoryname,
                         status = status.status,
                         sellername = user.firstname + " " + user.lastname,
                         addeddate = (DateTime)book.createddate
                     });

            var onlysearch = n;
            int flag_search = 0, flag_dropdown = 0;
            if (!string.IsNullOrEmpty(search))
            {
                flag_search = 1;
                onlysearch = n.Where(x => x.notetitle.Contains(search) || x.category.Contains(search) || x.sellername.Contains(search));
            }


            if (!string.IsNullOrEmpty(byseller))
            {
                flag_dropdown = 1;
                n = n.Where(x => x.sellername.ToLower() == byseller.ToLower());
                if (flag_search == 1)
                {
                    n = onlysearch.Union(n);
                }
            }

            notesunderreview notesunderreview = new notesunderreview();

            var temp = n;

            if (flag_search == 0 && flag_dropdown == 0)
            {
                temp = n;
            }

            else if (flag_search == 1 && flag_dropdown == 0)
            {
                temp = onlysearch;
            }

            switch (sortBy)
            {
                case "DOWNLOADED DATE/TIME":
                    temp = temp.OrderByDescending(x => x.addeddate);
                    break;

                case "NOTE TITLE desc":
                    temp = temp.OrderByDescending(x => x.notetitle);
                    break;

                case "NOTE TITLE":
                    temp = temp.OrderBy(x => x.notetitle);
                    break;

                case "SELLER desc":
                    temp = temp.OrderByDescending(x => x.sellername);
                    break;

                case "SELLER":
                    temp = temp.OrderBy(x => x.sellername);
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

            notesunderreview.notes = temp.ToList().ToPagedList(i ?? 1, 9);
            ViewBag.counter = 9 * (i - 1);

            return View(notesunderreview);
        }

        //approve the note set status to published 
        public ActionResult approve(int? noteid)
        {
            var getnote = context.notedetails.Where(x => x.id == (int)noteid).FirstOrDefault();

            getnote.statusid = context.statustype.Where(x => x.status == "published").FirstOrDefault().id;
            getnote.approveddate = DateTime.Now;
            getnote.actionby = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault().id;

            context.SaveChanges();

            return RedirectToAction("notesunderreview", "notes");
        }

        //reject the note
        [HttpPost]
        public ActionResult reject(int? noteid, string comments)
        {
            var getnote = context.notedetails.Where(x => x.id == (int)noteid).FirstOrDefault();

            getnote.statusid = context.statustype.Where(x => x.status == "rejected").FirstOrDefault().id;
            getnote.modifieddate = DateTime.Now;
            getnote.actionby = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault().id;
            getnote.remarks = comments;

            context.SaveChanges();

            return RedirectToAction("notesunderreview", "notes");
        }

        // set status to inreview
        public ActionResult inreview(int? noteid)
        {
            var getnote = context.notedetails.Where(x => x.id == (int)noteid).FirstOrDefault();

            getnote.statusid = context.statustype.Where(x => x.status == "inreview").FirstOrDefault().id;
            getnote.approveddate = DateTime.Now;
            getnote.actionby = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault().id;

            context.SaveChanges();

            return RedirectToAction("notesunderreview", "notes");
        }

        // all the notes which are published
        public ActionResult publishednotes(int? i, string search, string byseller, string sortBy)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            ViewBag.sellers = sellerlist(2);

            ViewBag.byseller = byseller;


            ViewBag.SortByDate = string.IsNullOrEmpty(sortBy) ? "PUBLISHED DATE" : "";
            ViewBag.SortByTitle = sortBy == "NOTE TITLE" ? "NOTE TITLE desc" : "NOTE TITLE";
            ViewBag.SortByCategory = sortBy == "CATEGORY" ? "CATEGORY desc" : "CATEGORY";
            ViewBag.SortBySeller = sortBy == "SELLER" ? "SELLER desc" : "SELLER";
            ViewBag.SortByApprovedby = sortBy == "APPROVED BY" ? "APPROVED BY desc" : "APPROVED BY";
            ViewBag.SortByPrice = sortBy == "PRICE" ? "PRICE desc" : "PRICE";
            ViewBag.SortByNumberofdownloads = sortBy == "NUMBER OF DOWNLOADS" ? "NUMBER OF DOWNLOADS desc" : "NUMBER OF DOWNLOADS";

            var n = (from book in context.notedetails
                     join user in context.users
                     on book.userid equals user.id
                     join status in context.statustype
                     on book.statusid equals status.id
                     join category in context.category
                     on book.categoryid equals category.id

                     where (status.status == "published") && book.isActive == true

                     select new publisednote
                     {
                         noteid = book.id,
                         sellerid = user.id,
                         notetitle = book.title,
                         category = category.categoryname,
                         selltype = book.ispaid,
                         price = book.sellprice,
                         sellername = user.firstname + " " + user.lastname,
                         publisheddate = (DateTime)book.approveddate,
                         approvedby = context.users.Where(x => x.id == book.actionby).FirstOrDefault().firstname + " " + context.users.Where(x => x.id == book.actionby).FirstOrDefault().lastname,
                         downloads = context.download.Where(x => x.isdownloaded == true && x.noteid == book.id).Count()
                     });

            var onlysearch = n;
            int flag_search = 0, flag_dropdown = 0;
            if (!string.IsNullOrEmpty(search))
            {
                flag_search = 1;
                onlysearch = n.Where(x => x.notetitle.Contains(search) || x.category.Contains(search) || x.sellername.Contains(search));
            }


            if (!string.IsNullOrEmpty(byseller))
            {
                flag_dropdown = 1;
                n = n.Where(x => x.sellername.ToLower() == byseller.ToLower());
                if (flag_search == 1)
                {
                    n = onlysearch.Union(n);
                }
            }

            published published = new published();

            var temp = n;

            if (flag_search == 0 && flag_dropdown == 0)
            {
                temp = n;
            }

            else if (flag_search == 1 && flag_dropdown == 0)
            {
                temp = onlysearch;
            }
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

                case "SELLER desc":
                    temp = temp.OrderByDescending(x => x.sellername);
                    break;

                case "SELLER":
                    temp = temp.OrderBy(x => x.sellername);
                    break;

                case "APPROVED BY desc":
                    temp = temp.OrderByDescending(x => x.approvedby);
                    break;

                case "APPROVED BY":
                    temp = temp.OrderBy(x => x.approvedby);
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

            published.publisednotes = temp.ToList().ToPagedList(i ?? 1, 9);
            ViewBag.counter = 9 * (i - 1);

            return View(published);
        }

        // unpublish the notes
        public ActionResult unpublish(int? noteid, string remarks, string dashboard)
        {
            var getnote = context.notedetails.Where(x => x.id == noteid).FirstOrDefault();
            getnote.isActive = false;
            getnote.remarks = remarks;

            var sellerdetail = context.users.Where(x => x.id == getnote.userid).FirstOrDefault();
            var sellername = sellerdetail.firstname + " " + sellerdetail.lastname;
            var selleremail = sellerdetail.email;

            context.SaveChanges();
            sendMail(sellername,selleremail,getnote.title,remarks);
            if(dashboard == "1")
            {
                return RedirectToAction("dashboard", "admin");
            }
            return RedirectToAction("publishednotes", "notes");
        }

        // all the downloaded notes
        public ActionResult downloadednotes(int? i, string search, string byseller, string bybuyer, string bynote, string sortBy)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            ViewBag.sellers = dsellerlist();
            ViewBag.buyers = dbuyerlist();
            ViewBag.notes = dnote();

            ViewBag.byseller = byseller;
            ViewBag.bybuyer = bybuyer;
            ViewBag.bynote = bynote;


            ViewBag.SortByDate = string.IsNullOrEmpty(sortBy) ? "DOWNLOADED DATE/TIME" : "";
            ViewBag.SortByTitle = sortBy == "NOTE TITLE" ? "NOTE TITLE desc" : "NOTE TITLE";
            ViewBag.SortByCategory = sortBy == "CATEGORY" ? "CATEGORY desc" : "CATEGORY";
            ViewBag.SortByBuyer = sortBy == "BUYER" ? "BUYER desc" : "BUYER";
            ViewBag.SortBySeller = sortBy == "SELLER" ? "SELLER desc" : "SELLER";
            ViewBag.SortBySellprice = sortBy == "SELL PRICE" ? "SELL PRICE desc" : "SELL PRICE";

            var n = (from book in context.download

                     where (book.isdownloaded == true) && book.isActive == true

                     select new downloadednote
                     {
                         noteid = book.noteid,
                         sellerid = context.users.Where(x => x.id == book.sellerid).FirstOrDefault().id,
                         buyerid = context.users.Where(x => x.id == book.buyerid).FirstOrDefault().id,
                         notetitle = book.title,
                         category = book.category,
                         selltype = book.ispaid,
                         price = book.purchaseprice,
                         sellername = context.users.Where(x => x.id == book.sellerid).FirstOrDefault().firstname + " " + context.users.Where(x => x.id == book.sellerid).FirstOrDefault().lastname,
                         buyername = context.users.Where(x => x.id == book.buyerid).FirstOrDefault().firstname + " " + context.users.Where(x => x.id == book.buyerid).FirstOrDefault().lastname,
                         downloadeddatetime = (DateTime)book.approveddate,
                     });

            var onlysearch = n;
            int flag_search = 0, flag_dropdown = 0;
            if (!string.IsNullOrEmpty(search))
            {
                flag_search = 1;
                onlysearch = n.Where(x => x.notetitle.Contains(search) || x.category.Contains(search) || x.sellername.Contains(search) || x.buyername.Contains(search));
            }


            if (!string.IsNullOrEmpty(byseller) || !string.IsNullOrEmpty(bybuyer) || !string.IsNullOrEmpty(bynote))
            {
                flag_dropdown = 1;
                n = n.Where(x => x.sellername.ToLower() == byseller.ToLower() || x.buyername.ToLower() == bybuyer.ToLower() || x.notetitle.ToLower() == bynote.ToLower());
                if (flag_search == 1)
                {
                    n = onlysearch.Union(n);
                }
            }

            downloaded downloaded = new downloaded();

            var temp = n;

            if (flag_search == 0 && flag_dropdown == 0)
            {
                temp = n;
            }

            else if (flag_search == 1 && flag_dropdown == 0)
            {
                temp = onlysearch;
            }

            switch (sortBy)
            {
                case "DOWNLOADED DATE/TIME":
                    temp = temp.OrderByDescending(x => x.downloadeddatetime);
                    break;

                case "NOTE TITLE desc":
                    temp = temp.OrderByDescending(x => x.notetitle);
                    break;

                case "NOTE TITLE":
                    temp = temp.OrderBy(x => x.notetitle);
                    break;

                case "BUYER desc":
                    temp = temp.OrderBy(x => x.buyername);
                    break;

                case "BUYER":
                    temp = temp.OrderByDescending(x => x.buyername);
                    break;

                case "SELLER desc":
                    temp = temp.OrderByDescending(x => x.sellername);
                    break;

                case "SELLER":
                    temp = temp.OrderBy(x => x.sellername);
                    break;

                case "SELL PRICE desc":
                    temp = temp.OrderByDescending(x => x.price);
                    break;

                case "SELL PRICE":
                    temp = temp.OrderBy(x => x.price);
                    break;

                case "CATEGORY desc":
                    temp = temp.OrderByDescending(x => x.category);
                    break;

                case "CATEGORY":
                    temp = temp.OrderBy(x => x.category);
                    break;
                default:
                    temp = temp.OrderBy(x => x.downloadeddatetime);
                    break;
            }

            downloaded.downloadednotes = temp.ToList().ToPagedList(i ?? 1, 9);
            ViewBag.counter = 9 * (i - 1);

            return View(downloaded);
        }

        //all the rejected notes
        public ActionResult rejectednotes(int? i, string search, string byseller, string sortBy)
        {
            var getcurrentuser = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();
            ViewBag.role = getcurrentuser.roleid;
            ViewBag.profilepicture = null;
            var getadminprofiledetails = context.admindetails.Where(x => x.adminid == getcurrentuser.id).FirstOrDefault();
            if (getadminprofiledetails != null)
            {
                ViewBag.profilepicture = getadminprofiledetails.profilepicture;
            }

            ViewBag.sellers = sellerlist(4);

            ViewBag.byseller = byseller;

            ViewBag.SortByDate = string.IsNullOrEmpty(sortBy) ? "REJECTED DATE" : "";
            ViewBag.SortByTitle = sortBy == "NOTE TITLE" ? "NOTE TITLE desc" : "NOTE TITLE";
            ViewBag.SortByCategory = sortBy == "CATEGORY" ? "CATEGORY desc" : "CATEGORY";
            ViewBag.SortBySeller = sortBy == "SELLER" ? "SELLER desc" : "SELLER";
            ViewBag.SortByApprovedby = sortBy == "REJECTED BY" ? "REJECTED BY desc" : "REJECTED BY";

            var n = (from book in context.notedetails
                     join user in context.users
                     on book.userid equals user.id
                     join status in context.statustype
                     on book.statusid equals status.id
                     join category in context.category
                     on book.categoryid equals category.id

                     where (status.status == "rejected") && book.isActive == true

                     select new rejectednote
                     {
                         noteid = book.id,
                         sellerid = user.id,
                         notetitle = book.title,
                         category = category.categoryname,
                         sellername = user.firstname + " " + user.lastname,
                         rejecteddate = (DateTime)book.modifieddate,
                         rejectedby = context.users.Where(x => x.id == book.actionby).FirstOrDefault().firstname + " " + context.users.Where(x => x.id == book.actionby).FirstOrDefault().lastname,
                         remark = book.remarks
                     });

            var onlysearch = n;
            int flag_search = 0, flag_dropdown = 0;
            if (!string.IsNullOrEmpty(search))
            {
                flag_search = 1;
                onlysearch = n.Where(x => x.notetitle.Contains(search) || x.category.Contains(search) || x.sellername.Contains(search));
            }


            if (!string.IsNullOrEmpty(byseller))
            {
                flag_dropdown = 1;
                n = n.Where(x => x.sellername.ToLower() == byseller.ToLower());
                if (flag_search == 1)
                {
                    n = onlysearch.Union(n);
                }
            }

            rejected rejected = new rejected();

            var temp = n;

            if (flag_search == 0 && flag_dropdown == 0)
            {
                temp = n;
            }

            else if (flag_search == 1 && flag_dropdown == 0)
            {
                temp = onlysearch;
            }

            switch (sortBy)
            {
                case "REJECTED DATE":
                    temp = temp.OrderByDescending(x => x.rejecteddate);
                    break;

                case "NOTE TITLE desc":
                    temp = temp.OrderByDescending(x => x.notetitle);
                    break;

                case "NOTE TITLE":
                    temp = temp.OrderBy(x => x.notetitle);
                    break;

                case "REJECTED BY desc":
                    temp = temp.OrderBy(x => x.rejectedby);
                    break;

                case "REJECTED BY":
                    temp = temp.OrderByDescending(x => x.rejectedby);
                    break;

                case "SELLER desc":
                    temp = temp.OrderByDescending(x => x.sellername);
                    break;

                case "SELLER":
                    temp = temp.OrderBy(x => x.sellername);
                    break;

                case "CATEGORY desc":
                    temp = temp.OrderByDescending(x => x.category);
                    break;

                case "CATEGORY":
                    temp = temp.OrderBy(x => x.category);
                    break;
                default:
                    temp = temp.OrderBy(x => x.rejecteddate);
                    break;
            }

            rejected.rejectednotes = temp.ToList().ToPagedList(i ?? 1, 9);
            ViewBag.counter = 9 * (i - 1);

            return View(rejected);
        }

        //approve the note
        public ActionResult approved(int? noteid)
        {
            var getnote = context.notedetails.Where(x => x.id == (int)noteid).FirstOrDefault();

            getnote.statusid = context.statustype.Where(x => x.status == "published").FirstOrDefault().id;
            getnote.modifieddate = DateTime.Now;
            getnote.actionby = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault().id;

            context.SaveChanges();

            return RedirectToAction("rejectednotes", "notes");
        }

        //download the note
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
        public SelectList sellerlist(int statusid)
        {
            var getdata = context.notedetails.Where(x => x.statusid == statusid).Select(x => x.userid).Distinct().ToList();
            List<SelectListItem> list = new List<SelectListItem>();
            foreach (var g in getdata)
            {
                list.Add(new SelectListItem()
                {
                    Text = context.users.Where(x => x.id == g).FirstOrDefault().firstname,
                    Value = context.users.Where(x => x.id == g).FirstOrDefault().firstname + " " + context.users.Where(x => x.id == g).FirstOrDefault().lastname
                });
            }
            return new SelectList(list, "Value", "Text");
        }

        public SelectList dsellerlist()
        {
            var getdata = context.download.Where(x => x.isdownloaded == true).Select(x => x.sellerid).Distinct().ToList(); List<SelectListItem> list = new List<SelectListItem>();
            foreach (var g in getdata)
            {
                list.Add(new SelectListItem()
                {
                    Text = context.users.Where(x => x.id == g).FirstOrDefault().firstname,
                    Value = context.users.Where(x => x.id == g).FirstOrDefault().firstname + " " + context.users.Where(x => x.id == g).FirstOrDefault().lastname
                });
            }
            return new SelectList(list, "Value", "Text");
        }
        public SelectList dbuyerlist()
        {
            var getdata = context.download.Where(x => x.isdownloaded == true).Select(x => x.buyerid).Distinct().ToList(); 
            List<SelectListItem> list = new List<SelectListItem>();
            foreach (var g in getdata)
            {
                list.Add(new SelectListItem()
                {
                    Text = context.users.Where(x => x.id == g).FirstOrDefault().firstname,
                    Value = context.users.Where(x => x.id == g).FirstOrDefault().firstname + " " + context.users.Where(x => x.id == g).FirstOrDefault().lastname
                });
            }
            return new SelectList(list, "Value", "Text");
        }
        public SelectList dnote()
        {
            var getdata = context.download.Where(x => x.isdownloaded == true).Select(x=>x.title).ToList(); 
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


        [NonAction]
        public void sendMail(string sellername, string selleremail, string notetitle, string remarks)
        {
            var sender = context.systemconfig.FirstOrDefault();
            var senderemail = sender.supportemail;
            var senderpassword = sender.password;

            var fromEmail = new MailAddress(senderemail, "Unpublish Note");
            var toEmail = new MailAddress(selleremail);
            var fromEmailPassword = senderpassword; 
            string subject = "Sorry! we need to remove your notes from our portal";

            string body = "Hello, "+sellername + "<br/><br/>" + "We wnat to inform you that, your note" + notetitle +"has been removed from our portal.<br/> Please look at the notes and take required actions.<br/>"+ remarks + "<br/><br/>" + "Regards, <br/>" + "Notes Marketplace";

            var smtp = new SmtpClient
            {
                Host = "smtp.gmail.com",
                Port = 587,
                EnableSsl = true,
                DeliveryMethod = SmtpDeliveryMethod.Network,
                UseDefaultCredentials = false,
                Credentials = new System.Net.NetworkCredential(fromEmail.Address, fromEmailPassword)
            };

            using (var message = new MailMessage(fromEmail, toEmail)
            {
                Subject = subject,
                Body = body,
                IsBodyHtml = true
            })
            smtp.Send(message);
        }
    }
}