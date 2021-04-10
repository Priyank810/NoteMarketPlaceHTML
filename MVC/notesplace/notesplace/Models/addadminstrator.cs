using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace notesplace.Models
{
    public class addadminstrator
    {
        public int? adminid { get; set; }
        
        [Required]
        public string firstname { get; set; }

        [Required]
        public string lastname { get; set; }

        [Required]
        [EmailAddress]
        public string email { get; set; }

        [Required]
        public int countrycode { get; set; }

        [Required]
        public string phonenumber { get; set; }

        [EmailAddress]
        public string secondaryemail { get; set; }
        public HttpPostedFileBase profilepicture { get; set; }
    }
}