using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Models
{
    public class members
    {
        public IPagedList<member> member { get; set; }
    }
    public class member
    {
        public int memberid { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string email { get; set; }
        public DateTime? joiningdate { get; set; }
        public int? underreviewnotes { get; set; }
        public int? publishednotes { get; set; }
        public int? downloadednotes { get; set; }
        public int? totalexpense { get; set; }
        public int? totalearning { get; set; }
        public bool isActive { get; set; }
    }
}