using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList;
using PagedList.Mvc;

namespace notesplace.Models
{
    public class downloaded
    {
        public IPagedList<downloadednote> downloadednotes { get; set; }
    }
    public class downloadednote
    {
        public int? noteid { get; set; }
        public int? sellerid { get; set; }
        public int? buyerid { get; set; }
        public string notetitle { get; set; }
        public string category { get; set; }
        public bool? selltype { get; set; }
        public int? price { get; set; }
        public string sellername { get; set; }
        public string buyername { get; set; }
        public DateTime? downloadeddatetime { get; set; }
    }
}