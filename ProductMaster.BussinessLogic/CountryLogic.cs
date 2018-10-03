using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProductMaster.BussinessEntities;
using ProductMaster.DataAccess.SQL;

namespace ProductMaster.BussinessLogic
{
    public class CountryLogic
    {
        #region Get All Country
        public List<CountryBE> GetCountryAll()
        {
            List<CountryBE> ltscate = new List<CountryBE>();
            ProductMasterEntities BDPM = new ProductMasterEntities();
            try
            {
                ltscate = (from Country in BDPM.Country
                           select new CountryBE
                           {
                               IdCountry = Country.IdCountry,
                               NameCountry = Country.NameCountry
                           }).ToList();
            }
            catch (Exception EX)
            {

            }
            finally
            {
                BDPM.Dispose();
            }
            return ltscate;
        }
        #endregion
    }
}
