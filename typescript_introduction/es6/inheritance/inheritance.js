class Report {
    constructor(name) {
        this.name = name;
        this.companyProfile = name;
    }
}
class Invoice2 extends Report {
    constructor(name, total) {
        super(name);
        this.name = name;
        this.total = total;
    }
    printInvoice() {
        return this.name + ", " + this.total;
    }
}
class BillOfLading extends Report {
    constructor(name, city, state) {
        super(name);
        this.name = name;
        this.city = city;
        this.state = state;
    }
    printBol() {
        return this.name + ", " + this.city + ", " + this.state;
    }
}
var invoice = new Invoice2('Google', 200);
console.log(invoice.companyProfile);
console.log(invoice.printInvoice());
var bol = new BillOfLading('Google', 'Portland', 'OR');
console.log(bol.printBol());
//# sourceMappingURL=inheritance.js.map