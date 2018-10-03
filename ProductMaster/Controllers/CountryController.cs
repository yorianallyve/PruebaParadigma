using ProductMaster.BussinessEntities;
using ProductMaster.BussinessLogic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;

namespace ProductMaster.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
    public class CountryController : ApiController
    {
        #region Get Country All
        [Route("api/v1/country")]
        [HttpGet]
        public List<CountryBE> GetCountryAll()
        {
            List<CountryBE> ltscouall = new List<CountryBE>();
            CountryLogic CL = new CountryLogic();
            ltscouall = CL.GetCountryAll();
            return ltscouall;
        }
        #endregion 
    }
}
