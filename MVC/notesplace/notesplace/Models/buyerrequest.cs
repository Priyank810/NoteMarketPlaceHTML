using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using PagedList.Mvc;
using PagedList;

namespace notesplace.Models
{
    public class buyerrequest
    {
        public  IPagedList<brequest> buy { get; set; }  
    }
    
    public class brequest
    {
        public int buyerid { get; set; }
        public int noteid { get; set; }
        public DateTime? addeddate { get; set; }
        public string title { get; set; }
        public string category { get; set; }
        public bool ispaid { get; set; }
        public int? sellprice { get; set; }
        public string buyeremail { get; set; }
        public string buyercountrycode { get; set; }
        public string byyernumber { get; set; }

    }
}