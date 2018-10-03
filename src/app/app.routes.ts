import { Routes, RouterModule } from "@angular/router";
import { NgModule, ModuleWithProviders } from "@angular/core";
import { HomeComponent } from "./home/home.component";
import {ProductComponent} from "./product/product.component";
import {ProductsStockComponent} from "./products-stock/products-stock.component";
import{ProductsOutStockComponent} from "./products-out-stock/products-out-stock.component";


const APP_ROUTES: Routes = [
  { path: "", redirectTo: "home", pathMatch: "full" },
  { path: "home", component: HomeComponent },
  { path: "product", component: ProductComponent },
  { path: "productstock", component: ProductsStockComponent },
  {path: "productoutstock", component:ProductsOutStockComponent},

];
@NgModule({
  imports: [RouterModule.forRoot(APP_ROUTES)],
  exports: [RouterModule]
})
export class AppRoutingModule {}
