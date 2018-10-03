export class Producto {
    constructor(
        public IdProduct: number,
        public NameProduct: string,
        public ReleaseDate:string,
        public Email: string,
        public IdCountry: number,
        public Cost: string,
        public UnitsAvailable: string,
        public SoldUnits:string,
        public StateProduct:boolean,
        public NameCountry:string
    )
    {}
}
