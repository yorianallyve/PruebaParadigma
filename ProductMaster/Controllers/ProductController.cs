using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using ProductMaster.BussinessEntities;
using ProductMaster.BussinessLogic;
using System.Web.Http.Cors;


namespace ProductMaster.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]

    public class ProductController : ApiController
    {
        #region Insert Product 
        [Route("api/v1/product")]
        [HttpPost]
        public AnswerResponseBE InsertProduct(ProductBE IPROD)
        {
            AnswerResponseBE AR = new AnswerResponseBE();
            ProductLogic PL = new ProductLogic();
            AR = PL.InsertProduct(IPROD);
            return AR;
        }
        #endregion


        #region Get Product All True
        [Route("api/v1/product")]
        [HttpGet]
        public List<ProductBE> GetProductAll()
        {
            List<ProductBE> ltsprodtall = new List<ProductBE>();
            ProductLogic PL = new ProductLogic();
            ltsprodtall = PL.GetProductdTAll();
            return ltsprodtall;
        }
        #endregion 


        #region Get Product All False
        [Route("api/v1/product/false")]
        [HttpGet]
        public List<ProductBE> GetProductFalseAll()
        {
            List<ProductBE> ltsprodfall = new List<ProductBE>();
            ProductLogic PL = new ProductLogic();
            ltsprodfall = PL.GetProductFAll();
            return ltsprodfall;
        }
        #endregion 


        #region Update Product
        [Route("api/v1/product")]
        [HttpPut]
        public AnswerResponseBE UpdateCupboard(ProductBE UPPROD)
        {
            AnswerResponseBE AR = new AnswerResponseBE();
            ProductLogic PL = new ProductLogic();
            AR = PL.UpdateProduct(UPPROD);
            return AR;
        }
        #endregion


        #region Search Product Id
        [Route("api/v1/product/searidpro/{SEARIDPRO}")]
        [HttpGet]
        public ProductBE SearchCupboard(int SEARIDPRO)
        {
            ProductLogic PRODL = new ProductLogic();
            var ARS = PRODL.SearchIdProduct(SEARIDPRO);
            return ARS;
        }
        #endregion

    }
}
