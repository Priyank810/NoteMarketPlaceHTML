using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace notesplace.Models
{
    public class systemconfig
    {
        public int? systemconfigid { get; set; }

        [Required]
        [EmailAddress]
        public string supportemail { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [RegularExpression("^((?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])|(?=.*?[A-Z])(?=.*?[a-z])" +
            "(?=.*?[^a-zA-Z0-9])|(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[^a-zA-Z0-9])|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^a-zA-Z0-9])).{6,24}$",
            ErrorMessage = "Enter Proper Password")]
        public string password { get; set; }
        [Required]
        [DataType(DataType.Password)]
        [Compare(nameof(password), ErrorMessage = "Password do not match")]
        public string confirmpassword { get; set; }

        [Required]
        public string supportphonenumber { get; set; }

        [Required]
        public string othereamil { get; set; }

        public string facebookurl { get; set; }
        public string twitterurl { get; set; }
        public string linkeinurl { get; set; }

        [Required]
        public HttpPostedFileBase defaultprofilepicture { get; set; }

        [Required]
        public HttpPostedFileBase defaultnotepicture { get; set; }
    }
}