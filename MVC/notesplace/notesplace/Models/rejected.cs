using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Models
{
    public class rejected
    {
        public IPagedList<rejectednote> rejectednotes { get; set; }
    }

    public class rejectednote
    {
        public int? sellerid { get; set; }
        public int? noteid { get; set; }
        public string notetitle { get; set; }
        public string category { get; set; }
        public string sellername { get; set; }
        public DateTime? rejecteddate { get; set; }
        public string rejectedby { get; set; }
        public string remark { get; set; }
    }
}