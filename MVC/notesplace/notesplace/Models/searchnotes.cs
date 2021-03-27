using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList.Mvc;
using PagedList;

namespace notesplace.Models
{
    public class ss
    {
        public IPagedList<searchnotes> ssn { get; set; }
    }
    public class searchnotes
    {
        public int noteid { get; set; }
        public string title { get; set; }
        public string university { get; set; }
        public string country { get; set; }
        public int? numberofpages { get; set; }
        public DateTime? date { get; set; }
        public string displaypicture { get; set; }
        public string categoryname { get; set; }
        public string typename { get; set; }
        public string coursename { get; set; }
        public double? avgeragerating { get; set; }
        public int? totalrating { get; set; }
        public int? totalspam { get; set; }
    }
}