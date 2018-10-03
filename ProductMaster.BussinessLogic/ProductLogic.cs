using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ProductMaster.BussinessEntities;
using ProductMaster.DataAccess.SQL;

namespace ProductMaster.BussinessLogic
{
    public class ProductLogic
    {
        #region Insert Product
        public AnswerResponseBE InsertProduct(ProductBE IPROD)
        {
            AnswerResponseBE AR = new AnswerResponseBE();
            ProductMasterEntities BDPM = new ProductMasterEntities();
            try
            {
                int CountProd = 0;
                CountProd = BDPM.Product.Where(x => x.IdProduct == IPROD.IdProduct).ToList().Count();
                if (CountProd == 0)
                {
                    Product PROD = new Product();
                    PROD.IdProduct = IPROD.IdProduct;
                    PROD.NameProduct = IPROD.NameProduct;
                    PROD.ReleaseDate = IPROD.ReleaseDate;
                    PROD.Email = IPROD.Email;
                    PROD.IdCountry = IPROD.IdCountry;
                    PROD.Cost = IPROD.Cost;
                    PROD.UnitsAvailable = IPROD.UnitsAvailable;
                    PROD.SoldUnits = IPROD.SoldUnits;
                    PROD.StateProduct = IPROD.StateProduct;

                    BDPM.Product.Add(PROD);
                    BDPM.SaveChanges();

                    AR.CodeError = 0;
                    AR.DescriptionError = "Se ha insertado el producto correctamente";
                }
                else
                {
                    AR.CodeError = 2;
                    AR.DescriptionError = "El producto ya existe, por favor verifique la información";
                }
            }
            catch (Exception EX)
            {
                AR.CodeError = 1;
                AR.DescriptionError = "Hubo un error";
            }
            finally
            {
                BDPM.Dispose();
            }
            return AR;
        }
        #endregion


        #region Update Product
        public AnswerResponseBE UpdateProduct(ProductBE UPROD)
        {
            AnswerResponseBE AR = new AnswerResponseBE();
            ProductMasterEntities BDPM = new ProductMasterEntities();
            try
            {
                Product product = new Product();
                product = BDPM.Product.Where(x => x.IdProduct == UPROD.IdProduct).FirstOrDefault();
                if (product != null)
                {
                    product.IdProduct = UPROD.IdProduct;
                    product.NameProduct = UPROD.NameProduct;
                    product.ReleaseDate = UPROD.ReleaseDate;
                    product.Email = UPROD.Email;
                    product.IdCountry = UPROD.IdCountry;
                    product.Cost = UPROD.Cost;
                    product.UnitsAvailable = UPROD.UnitsAvailable;
                    product.SoldUnits = UPROD.SoldUnits;
                    product.StateProduct = UPROD.StateProduct;
                    BDPM.SaveChanges();

                    AR.CodeError = 0;
                    AR.DescriptionError = "Se ha actualizado el producto correctamente";
                }
                else
                {
                    AR.CodeError = 2;
                    AR.DescriptionError = "El registro no existe, por favor verifique la información";
                }
            }
            catch (Exception EX)
            {
                AR.CodeError = 1;
                AR.DescriptionError = "Hubo un error";
            }
            finally
            {
                BDPM.Dispose();
            }
            return AR;
        }
        #endregion


        //Trae por los que sean true
        #region Get all Product True
        public List<ProductBE> GetProductdTAll()
        {
            List<ProductBE> lstprod = new List<ProductBE>();
            ProductMasterEntities BDPM = new ProductMasterEntities();
            try
            {
                lstprod = (from Product in BDPM.Product
                           where Product.StateProduct == true

                           select new ProductBE
                           {
                               IdProduct = Product.IdProduct,
                               NameProduct = Product.NameProduct,
                               ReleaseDate = Product.ReleaseDate,
                               Email = Product.Email,
                               IdCountry = Product.IdCountry,
                               NameCountry = Product.Country.NameCountry,
                               Cost = Product.Cost,
                               UnitsAvailable = Product.UnitsAvailable,
                               SoldUnits = Product.SoldUnits,
                               StateProduct = Product.StateProduct
                           }).OrderBy(x => x.ReleaseDate).ThenBy(x => x.StateProduct).ToList();
            }
            catch (Exception EX)
            {

            }
            finally
            {
                BDPM.Dispose();
            }
            return lstprod;
        }
        #endregion

        //Trae por los que sean False
        #region Get all Product False
        public List<ProductBE> GetProductFAll()
        {
            List<ProductBE> lstprodf = new List<ProductBE>();
            ProductMasterEntities BDPM = new ProductMasterEntities();
            try
            {
                lstprodf = (from Product in BDPM.Product
                            where Product.StateProduct == false

                            select new ProductBE
                            {
                                IdProduct = Product.IdProduct,
                                NameProduct = Product.NameProduct,
                                ReleaseDate = Product.ReleaseDate,
                                Email = Product.Email,
                                IdCountry = Product.IdCountry,
                                NameCountry = Product.Country.NameCountry,
                                Cost = Product.Cost,
                                UnitsAvailable = Product.UnitsAvailable,
                                SoldUnits = Product.SoldUnits,
                                StateProduct = Product.StateProduct
                            }).OrderBy(x => x.ReleaseDate).ThenBy(x => x.StateProduct).ToList();
            }
            catch (Exception EX)
            {

            }
            finally
            {
                BDPM.Dispose();
            }
            return lstprodf;
        }
        #endregion


        #region Search for Id Product
        public ProductBE SearchIdProduct(int SEARIDPRO)
        {
            ProductMasterEntities BDMP = new ProductMasterEntities();
            ProductBE idprod = new ProductBE();
            try
            {
                idprod = (from Product in BDMP.Product
                          where Product.IdProduct == SEARIDPRO
                          select new ProductBE
                          {
                              IdProduct = Product.IdProduct,
                              NameProduct = Product.NameProduct,
                              ReleaseDate = Product.ReleaseDate,
                              Email = Product.Email,
                              IdCountry = Product.IdCountry,
                              NameCountry = Product.NameProduct,
                              Cost = Product.Cost,
                              UnitsAvailable = Product.UnitsAvailable,
                              SoldUnits= Product.SoldUnits,
                              StateProduct=Product.StateProduct,
                          }).FirstOrDefault();
            }
            catch (Exception EX)
            {

            }
            finally
            {
                BDMP.Dispose();
            }
            return idprod;
        }

        #endregion
    }
}
