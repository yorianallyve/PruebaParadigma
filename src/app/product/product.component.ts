import { Component, OnInit } from "@angular/core";
import * as moment from "moment";
import { Producto } from "../models/producto";
import { Country } from "../models/country";
import { ProductService } from '../services/product.service';
import { CountryService } from '../services/country.service';

@Component({
  selector: "app-product",
  templateUrl: "./product.component.html",
  styleUrls: ["./product.component.css"],
  providers: [ProductService, CountryService]
})
export class ProductComponent implements OnInit {
  public ltscountry: Country[];
  public temcountry: number=0;
  public product: Producto = new Producto(0,"","","",0,"","","",true,"");
  NotificationStatus: boolean = false;
  TypeNotification: string = "success";
  TextNotification: string = "Primera notificación";
  public active = true;
  public submitted = false;


  constructor(
    private productservice: ProductService,
    private CountryService: CountryService
  ) {}

  ngOnInit() {
    this.getCountrys();
  }

  getCountrys() {
    this.CountryService.GetCountryAll().subscribe(result => {
      this.ltscountry = result;
      console.log(this.ltscountry);
    }),
      error => console.error(error);
  }

  onClickInsertProduct() {
    this.productservice.InsertProduct(this.product).subscribe(
      result => {
        console.log(result);
        if (result.CodeError == 0) {
          this.NotificationStatus = true;
          this.TextNotification = result.DescriptionError;
          this.TypeNotification = "success";
        } else {
          this.NotificationStatus = true;
          this.TextNotification = result.DescriptionError;
          this.TypeNotification = "danger";
        }
      },
      error => console.error(error)
    );
  }

  onClickUpdateProduct() {
    this.productservice.UpdateProduct(this.product).subscribe(
      result => {
        console.log(result);
        if (result.CodeError == 0) {
          this.NotificationStatus = true;
          this.TextNotification = result.DescriptionError;
          this.TypeNotification = "success";
        } else {
          this.NotificationStatus = true;
          this.TextNotification = result.DescriptionError;
          this.TypeNotification = "danger";
        }
      },
      error => console.error(error)
    );
  }

  onClickSearchProductId() {
    this.productservice.SearchProductId(this.product.IdProduct).subscribe(
      result => {
        console.log(result);
        if (result != null) {
          this.product.IdProduct = result.IdProduct;
          this.product.NameProduct = result.NameProduct;
          this.product.ReleaseDate =moment( result.ReleaseDate).format("YYYY-MM-DD");
          this.product.Email = result.Email;
          this.product.IdCountry = result.IdCountry;
          this.product.Cost = result.Cost;
          this.product.UnitsAvailable = result.UnitsAvailable;
          this.product.SoldUnits = result.SoldUnits;
          this.product.StateProduct=result.StateProduct;
        } else {
          this.NotificationStatus = true;
          this.TextNotification = "La alacena no existe";
          this.TypeNotification = "danger";
        }
      },
      error => console.error(error)
    );
  }

  onClickGetProductAll() {
    this.productservice.GetProductAll().subscribe(
      result => {
        console.log(result);
        if (result != null) {
          this.product.IdProduct = result.IdProduct;
          this.product.NameProduct = result.NameProduct;
          this.product.ReleaseDate =moment( result.ReleaseDate).format("YYYY-MM-DD");
          this.product.Email = result.Email;
          this.product.IdCountry = result.IdCountry;
          this.product.Cost = result.Cost;
          this.product.UnitsAvailable = result.UnitsAvailable;
          this.product.SoldUnits = result.SoldUnits;
          this.product.StateProduct=result.StateProduct;
        } else {
          this.NotificationStatus = true;
          this.TextNotification = "El producto no existe";
          this.TypeNotification = "danger";
        }
      },
      error => console.error(error)
    );
  }

  OnClickCleanProduct() {
    this.product = {
      IdProduct: null,
      NameProduct:"",
      ReleaseDate: null,
      Email: null,
      IdCountry: null,
      Cost:null,
      UnitsAvailable:"", 
      SoldUnits:"",
      StateProduct:true,
      NameCountry: ""
    };
    this.temcountry=null;
    this.active = false;
    setTimeout(() => (this.active = true), 0);
  }

  closeAlert() {
    this.NotificationStatus = !this.NotificationStatus;
  }
}
