using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList.Mvc;
using PagedList;

namespace notesplace.Models
{
    public class merge
    {
        public dashboard00 DM0 { get; set; }
        public IPagedList<dashboard01> DM1 { get; set; }
        public IPagedList<dashboard02> DM2 { get; set; }
    }
    
    public class dashboard00
    {
        public int notessold { get; set; }
        public int moneyearned { get; set; }
        public int mydownloads { get; set; }
        public int myrejected { get; set; }
        public int buyerrequests { get; set; }
    }

    public class dashboard01
    {
        public int noteid { get; set; }
        public DateTime? addeddate { get; set; }
        public string title { get; set; }
        public string category { get; set; }
        public string status { get; set; }
    }
    public class dashboard02
    {
        public int noteid { get; set; }
        public DateTime? addeddate { get; set; }
        public string title { get; set; }
        public string category { get; set; }
        public string status { get; set; }
        public bool ispaid { get; set; }
        public int? sellprice { get; set; }
    }
}