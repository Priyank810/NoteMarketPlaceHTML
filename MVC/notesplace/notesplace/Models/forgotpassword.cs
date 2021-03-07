using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace notesplace.Models
{
    public class forgotpassword
    {
        [Required]
        [EmailAddress]
        public string email { get; set; }
    }
}