using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Models
{
    public class admindashboard
    {
        public stats stats { get; set; }
        public IPagedList<publishednote> publishednotes { get; set; }
    }

    public class stats
    {
        public int notesforpublish { get; set; }
        public int notesdownloaded { get; set; }
        public int newregistration { get; set; }
    }
    public class publishednote
    {
        public int? noteid { get; set; }
        public string notetitle { get; set; }
        public string category { get; set; }
        public string size { get; set; }
        public bool selltype { get; set; }
        public int? price { get; set; }
        public string publisher { get; set; }
        public DateTime? publisheddate { get; set; }
        public int? downloads { get; set; }
    }
}