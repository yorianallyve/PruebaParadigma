using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ProductMaster.BussinessEntities
{
    public class ProductBE
    {
        public int IdProduct { get; set; }
        public string NameProduct { get; set; }
        public System.DateTime ReleaseDate { get; set; }
        public string Email { get; set; }
        public int IdCountry { get; set; }
        public string NameCountry { get; set; }
        public string Cost { get; set; }
        public string UnitsAvailable { get; set; }
        public string SoldUnits { get; set; }
        public Boolean StateProduct { get; set; }
    }
}
