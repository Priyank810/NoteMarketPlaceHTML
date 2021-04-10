using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Models
{
    public class categorylist
    {
        public IPagedList<categoryinfo> category { get; set; }
    }
    public class categoryinfo
    {
        public int? categoryid { get; set; }
        public string categoryname { get; set; }
        public string categorydescription { get; set; }
        public DateTime? dateadded { get; set; }
        public string addedby { get; set; }
        public bool active { get; set; }
    }
}
