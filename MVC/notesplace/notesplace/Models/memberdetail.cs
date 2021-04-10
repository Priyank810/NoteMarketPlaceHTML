using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Models
{
    public class memberdetail
    {
        public int? memberid { get; set; }
        public string photo { get; set; }
        public string firstname { get; set; }
        public string lastname { get; set; }
        public string email { get; set; }
        public string dob { get; set; }
        public string phonenumber { get; set; }
        public string university { get; set; }
        public string address1 { get; set; }
        public string address2 { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public string country { get; set; }
        public string zipcode { get; set; }
        public IPagedList<membernotes> membernotes { get; set; }
    }
    public class membernotes
    {
        public int? noteid { get; set; }
        public string notetitle { get; set; }
        public string category { get; set; }
        public string status { get; set; }
        public int? downloadednotes { get; set; }
        public int? totalearnings { get; set; }
        public DateTime? addeddate { get; set; }
        public DateTime? publisheddate { get; set; }
    }
}