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
    
    public partial class country
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public country()
        {
            this.notedetails = new HashSet<notedetails>();
        }
    
        public int id { get; set; }
        public string countryname { get; set; }
        public string countrycode { get; set; }
        public Nullable<System.DateTime> createddate { get; set; }
        public Nullable<int> createdby { get; set; }
        public Nullable<System.DateTime> modifieddate { get; set; }
        public Nullable<int> modifiedby { get; set; }
        public Nullable<bool> isActive { get; set; }
    
        public virtual users users { get; set; }
        public virtual users users1 { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<notedetails> notedetails { get; set; }
    }
}
