//------------------------------------------------------------------------------
// <auto-generated>
//     Этот код создан по шаблону.
//
//     Изменения, вносимые в этот файл вручную, могут привести к непредвиденной работе приложения.
//     Изменения, вносимые в этот файл вручную, будут перезаписаны при повторном создании кода.
// </auto-generated>
//------------------------------------------------------------------------------

namespace tren3_4_Makarov
{
    using System;
    using System.Collections.Generic;
    
    public partial class Sklad
    {
    
        public int id { get; set; }
        public string Adress { get; set; }
        public Nullable<int> Type_id { get; set; }
        public Nullable<int> Rasstoyanie { get; set; }
        public virtual ICollection<Material> Materials { get; set; }
        public virtual Type_Material Type_Material { get; set; }
    }
}