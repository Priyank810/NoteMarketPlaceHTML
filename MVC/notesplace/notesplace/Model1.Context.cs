﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class notesmarketplaceEntities : DbContext
    {
        public notesmarketplaceEntities()
            : base("name=notesmarketplaceEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<admindetails> admindetails { get; set; }
        public virtual DbSet<category> category { get; set; }
        public virtual DbSet<contact> contact { get; set; }
        public virtual DbSet<country> country { get; set; }
        public virtual DbSet<download> download { get; set; }
        public virtual DbSet<gender> gender { get; set; }
        public virtual DbSet<noteattachment> noteattachment { get; set; }
        public virtual DbSet<notedetails> notedetails { get; set; }
        public virtual DbSet<notetype> notetype { get; set; }
        public virtual DbSet<reviews> reviews { get; set; }
        public virtual DbSet<spam> spam { get; set; }
        public virtual DbSet<statustype> statustype { get; set; }
        public virtual DbSet<systemconfig> systemconfig { get; set; }
        public virtual DbSet<userdetails> userdetails { get; set; }
        public virtual DbSet<userroles> userroles { get; set; }
        public virtual DbSet<users> users { get; set; }
    }
}
