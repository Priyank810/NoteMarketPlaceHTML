using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Models
{
    public class administratorlist
    {
        public IPagedList<administrator> administrators { get; set; }
    }

    public class administrator
    {
        public int? adminid { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string email { get; set; }
        public string phonenumber { get; set; }
        public DateTime? dateadded { get; set; }
        public bool? active { get; set; }
    }
}