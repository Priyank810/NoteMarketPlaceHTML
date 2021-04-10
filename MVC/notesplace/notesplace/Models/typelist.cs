using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Models
{
    public class typelist
    {
        public IPagedList<typeinfo> type { get; set; }
    }
    public class typeinfo
    {
        public int? typeid { get; set; }
        public string typename { get; set; }
        public string typedescription { get; set; }
        public DateTime? dateadded { get; set; }
        public string addedby { get; set; }
        public bool active { get; set; }
    }
}