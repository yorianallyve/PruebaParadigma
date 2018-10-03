import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ProductsOutStockComponent } from './products-out-stock.component';

describe('ProductsOutStockComponent', () => {
  let component: ProductsOutStockComponent;
  let fixture: ComponentFixture<ProductsOutStockComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ProductsOutStockComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ProductsOutStockComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
