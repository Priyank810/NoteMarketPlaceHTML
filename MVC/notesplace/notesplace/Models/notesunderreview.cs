using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Models
{
    public class notesunderreview
    {
        public IPagedList<note> notes { get; set; }
    }

    public class note
    {
        public int noteid { get; set; }
        public int sellerid { get; set; }
        public string notetitle { get; set; }
        public string sellername { get; set; }
        public string category { get; set; }
        public string status { get; set; }
        public DateTime addeddate { get; set; }
    }
}