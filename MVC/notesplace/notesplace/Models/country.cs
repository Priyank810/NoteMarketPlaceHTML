using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.ComponentModel.DataAnnotations;

namespace notesplace.Models
{
    public class country
    {
        public int? countryid { get; set; }

        [Required]
        public string countryname { get; set; }

        [Required]
        public string countrycode { get; set; }
    }
}