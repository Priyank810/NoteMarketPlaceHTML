using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList.Mvc;
using PagedList;

namespace notesplace.Models
{
    public class mydownload
    {
        public IPagedList<mydownloads> downloads { get; set; }
    }
    public class mydownloads
    {
        public int downloadid { get; set; }
        public int noteid { get; set; }
        public int sellerid { get; set; }
        public int buyerid { get; set; }
        public string selleremail { get; set; }
        public DateTime? downloadeddate { get; set; }
        public DateTime? approveddate { get; set; }
        public string title { get; set; }
        public string category { get; set; }
        public int price { get; set; }
        public bool ispaid { get; set; }
    }
}