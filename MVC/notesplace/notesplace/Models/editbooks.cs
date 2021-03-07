using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace notesplace.Models
{
    public class editbooks
    {
        public int nid { get; set; }

        [Required]
        public string title { get; set; }

        [Required]
        public int categoryid { get; set; }

       
        public HttpPostedFileBase displaypicture { get; set; }

        
        public HttpPostedFileBase[] notes { get; set; }

        [Required]
        public int typeid { get; set; }

        [Required]
        public int? numberofpages { get; set; }

        [Required]
        public string description { get; set; }

        [Required]
        public int countryid { get; set; }

        [Required]
        public string institutename { get; set; }

        [Required]
        public string coursename { get; set; }

        [Required]
        public string coursecode { get; set; }

        [Required]
        public string professor { get; set; }

        
        public bool isp { get; set; }
        public int ispaid { get; set; }


        public int? sellprice { get; set; }


        public HttpPostedFileBase previewfile { get; set; }
    }
}