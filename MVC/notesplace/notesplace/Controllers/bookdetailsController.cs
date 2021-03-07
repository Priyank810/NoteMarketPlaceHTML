using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using notesplace.Models;

namespace notesplace.Controllers
{
    public class bookdetailsController : Controller
    {
        // GET: bookdetails

        notesmarketplaceEntities context = new notesmarketplaceEntities();

        public ActionResult display(int nid)
        {
            
            var userid = context.users.Where(x => x.email == HttpContext.User.Identity.Name).FirstOrDefault();

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

                           select new bookdetails
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
                           }).ToList();

            ViewBag.data = details;
            return View();
        }


    }
}