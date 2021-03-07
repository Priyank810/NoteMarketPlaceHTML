using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace notesplace.Models
{
    public class contactus
    {
        [Required]
        public string fullname { get; set; }

        [Required]
        [EmailAddress]
        public string email { get; set; }

        [Required]
        public string subject { get; set; }

        [Required]
        public string comment { get; set; }
    }
}