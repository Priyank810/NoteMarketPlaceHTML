using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace notesplace.Models
{
    public class login
    {
        [Required]
        [EmailAddress]
        public string email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string password { get; set; }
        
        public bool rememberme { get; set; }
    }
}