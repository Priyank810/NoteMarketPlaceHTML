using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace notesplace.Models
{
    public class userprofile
    {
        [Required]
        public string firstname { get; set; }

        [Required]
        public string lastname { get; set; }

        [Required]
        [EmailAddress]
        public string email { get; set; }

        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:yyyy-MM-dd}", ApplyFormatInEditMode =true)]
        public DateTime?  dob { get; set; }
        public int? gender { get; set; }

        [Required]
        public int? countrycode { get; set; }

        [Required]
        public string mobilenumber { get; set; } 
  
        public HttpPostedFileBase profilepicture { get; set; }

        [Required]
        public string addressline1 { get; set; }

        public string addressline2 { get; set; }

        [Required]
        public string city { get; set; }

        [Required]
        public string state { get; set; }

        [Required]
        public string zipcode { get; set; }

        [Required]
        public int? country { get; set; }

        public string university { get; set; }

        public string college { get; set; }
    }
}