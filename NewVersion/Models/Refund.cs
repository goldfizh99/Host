//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace NewVersion.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class Refund
    {
        public int RefundID { get; set; }
        public string OrderID { get; set; }
        public System.DateTime RefundRequestDate { get; set; }
        public Nullable<System.DateTime> RefundClosureDate { get; set; }
        public string RefundStatus { get; set; }
    
        public virtual Order Order { get; set; }
    }
}
