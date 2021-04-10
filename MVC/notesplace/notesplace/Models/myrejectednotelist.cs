using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Models
{
    public class myrejectednotelist
    {
        public IPagedList<myrejectednote> myrejectednote { get; set; }
    }
    public class myrejectednote
    {
        public int noteid { get; set; }
        public string notetitle { get; set; }
        public string category { get; set; }
        public string remarks { get; set; }
    }
}