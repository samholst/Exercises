class Report {
  companyProfile : string;

  constructor(public name : string) {
    this.companyProfile = name;
  }
}

class Invoice2 extends Report {
  constructor(public name : string, public total : number) {
    super(name);
  }

  printInvoice() {
    return this.name + ", " + this.total;
  }
}

class BillOfLading extends Report {
  constructor(public name : string, public city : string, public state : string) {
    super(name);
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
