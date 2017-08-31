class HelloAngularComponents {
  greeting : string;
  constructor() {
    this.greeting = ' Hello TypeScript'
  }
}

class Invoice {
  companyProfile : string;

  constructor(public name, public city, public state) {
    this.companyProfile = name + ", " + city + ", " + state;
  }
}

var googleInvoice = new Invoice('Google', 'Mountain View', 'OR');
var yahooInvoice = new Invoice('Yahoo', 'SF', 'CA');

console.log(googleInvoice.companyProfile);
console.log(yahooInvoice.companyProfile);
