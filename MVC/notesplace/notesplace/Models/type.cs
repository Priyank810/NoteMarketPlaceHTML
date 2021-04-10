using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace notesplace.Models
{
    public class type
    {
        public int? typeid { get; set; }

        [Required]
        public string typename { get; set; }

        [Required]
        public string typedescription { get; set; }
    }
}