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
    
    public partial class spam
    {
        public int id { get; set; }
        public int noteid { get; set; }
        public int buyerid { get; set; }
        public Nullable<int> downloadid { get; set; }
        public bool isspam { get; set; }
        public string remarks { get; set; }
        public Nullable<System.DateTime> createddate { get; set; }
        public Nullable<int> createdby { get; set; }
        public Nullable<System.DateTime> modifieddate { get; set; }
        public Nullable<int> modifiedby { get; set; }
        public Nullable<bool> isActive { get; set; }
    
        public virtual download download { get; set; }
        public virtual notedetails notedetails { get; set; }
        public virtual users users { get; set; }
        public virtual users users1 { get; set; }
        public virtual users users2 { get; set; }
    }
}
