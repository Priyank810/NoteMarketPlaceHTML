using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace notesplace.Models
{
    public class changepassword
    {
        [Required]
        [DataType(DataType.Password)]
        public string oldpassword { get; set; }
        
        [Required]
        [DataType(DataType.Password)]
        [RegularExpression("^((?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])|(?=.*?[A-Z])(?=.*?[a-z])" +
            "(?=.*?[^a-zA-Z0-9])|(?=.*?[A-Z])(?=.*?[0-9])(?=.*?[^a-zA-Z0-9])|(?=.*?[a-z])(?=.*?[0-9])(?=.*?[^a-zA-Z0-9])).{6,24}$",
            ErrorMessage = "Enter Proper Password")]
        public string newpassword { get; set; }
       
        [Required]
        [DataType(DataType.Password)]
        [Compare(nameof(newpassword), ErrorMessage = "Password do not match")]
        public string confirmnewpassword { get; set; }

    }
}