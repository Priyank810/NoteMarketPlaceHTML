using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Models
{
    public class spamreports
    {
        public IPagedList<spamreport> spamreport { get; set; }
    }

    public class spamreport
    {
        public int noteid { get; set; }
        public int reportid { get; set; }
        public string reportedby { get; set; }
        public string notetitle { get; set; }
        public string category { get; set; }
        public DateTime? dateedited { get; set; }
        public string remark { get; set; }

    }
}