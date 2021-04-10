using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Models
{
    public class countrylist
    {
        public IPagedList<countryinfo> country { get; set; }
    }
    public class countryinfo
    {
        public int? countryid { get; set; }
        public string countryname { get; set; }
        public string countrycode { get; set; }
        public DateTime? dateadded { get; set; }
        public string addedby { get; set; }
        public bool active { get; set; }
    }
}