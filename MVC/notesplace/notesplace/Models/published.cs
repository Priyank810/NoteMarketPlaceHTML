using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Models
{
    public class published
    {
        public IPagedList<publisednote> publisednotes { get; set; }
    }

    public class publisednote
    {
        public int? noteid { get; set; }
        public int? sellerid { get; set; }
        public string notetitle { get; set; }
        public string category { get; set; }
        public bool? selltype { get; set; }
        public int? price { get; set; }
        public string sellername { get; set; }
        public DateTime? publisheddate { get; set; }
        public string approvedby { get; set; }
        public int? downloads { get; set; }
    }
}