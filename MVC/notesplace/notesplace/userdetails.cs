//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace notesplace
{
    using System;
    using System.Collections.Generic;
    
    public partial class userdetails
    {
        public int id { get; set; }
        public int usserid { get; set; }
        public System.DateTime dob { get; set; }
        public string profilepicture { get; set; }
        public string addressline1 { get; set; }
        public string addressline2 { get; set; }
        public string city { get; set; }
        public string state { get; set; }
        public Nullable<int> countryid { get; set; }
        public string zipcode { get; set; }
        public string university { get; set; }
        public string college { get; set; }
        public Nullable<int> countrycodeid { get; set; }
        public string mobilenumber { get; set; }
        public Nullable<System.DateTime> createddate { get; set; }
        public Nullable<int> createdby { get; set; }
        public Nullable<System.DateTime> modifieddate { get; set; }
        public Nullable<int> modifiedby { get; set; }
        public Nullable<bool> isActive { get; set; }
        public Nullable<int> genderid { get; set; }
    
        public virtual country country { get; set; }
        public virtual country country1 { get; set; }
        public virtual gender gender { get; set; }
        public virtual users users { get; set; }
        public virtual users users1 { get; set; }
        public virtual users users2 { get; set; }
    }
}
