import { Component, OnInit } from '@angular/core';
import { CountryService } from "../services/country.service";
import { ProductService } from "../services/product.service";
import { Producto } from "../models/producto";
import {PagerService} from "../services/pager.service";

@Component({
  selector: 'app-products-out-stock',
  templateUrl: './products-out-stock.component.html',
  styleUrls: ['./products-out-stock.component.css'],
  providers: [ProductService, CountryService, PagerService]
})
export class ProductsOutStockComponent implements OnInit {
  public products: Producto[];
  public ltsproduct: Producto[];
  pager: any = {}; //paginador
  pagedItems: any[]; //paginador items
  temprod: ""; //temporal del filtro
  NotificationStatus: boolean = false;
  TypeNotification: string = "success";
  TextNotification: string = "Primera notificación";
  public active = true;
  public submitted = false;

  constructor(
    private productservice: ProductService, 
    private pagerservice: PagerService,
  ) { }

  ngOnInit() {this.productservice.GetProductFalseAll().subscribe(result => {
    this.products = result;
    this.ltsproduct = result;
    this.setPage(1);
  }),
    error => console.error(error);
}


setPage(page: number) {
  if (page < 1 || page > this.pager.totalPages) {
    return;
  }

  // get pager object from service
  this.pager = this.pagerservice.getPager(this.ltsproduct.length, page);

  // get current page of items
  this.pagedItems = this.ltsproduct.slice(
    this.pager.startIndex,
    this.pager.endIndex + 1
  );
}

  //Busca  por nombre prod
  onClickSearchIdProduct() {
    this.ltsproduct = this.products.filter(x =>
      x.NameProduct.toUpperCase().includes(this.temprod.toUpperCase())
    );
    this.pager = {};
    this.setPage(1);
  }

    //Busca  por nombre pais
    onClickSearchIdCountry() {
      this.ltsproduct = this.products.filter(x =>
        x.NameCountry.toUpperCase().includes(this.temprod.toUpperCase())
      );
      this.pager = {};
      this.setPage(1);
    }

    //Limpia el formulario
OnClickCleanProductAll() {
  this.ltsproduct  = this.products;
  this.temprod="";
  this.pager = {};
  this.setPage(1);
}
}