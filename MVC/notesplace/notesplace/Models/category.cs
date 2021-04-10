using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace notesplace.Models
{
    public class category
    {
        public int? categoryid { get; set; }

        [Required]
        public string categoryname { get; set; }

        [Required]
        public string categorydescription { get; set; }
    }
}