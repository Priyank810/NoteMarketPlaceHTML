using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace notesplace.Models
{
    public class bookdetails
    {
        public int userid { get; set; }
        public int noteid { get; set; }
        public string title { get; set; }
        public string booktype { get; set; }
        public string categoryname { get; set; }
        public string description { get; set; }
        public int? sellprice { get; set; }
        public string institutename { get; set; }
        public string country { get; set; }
        public string coursename { get; set; }
        public string coursecode { get; set; }
        public string professor { get; set; }
        public int? numberofpages { get; set; }
        public string bookimage { get; set; }
        public string bookpreview { get; set; }
        public string bookpdf { get; set; }
    }
}