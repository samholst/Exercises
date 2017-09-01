class HelloAngularComponents {
    constructor() {
        this.greeting = ' Hello TypeScript';
    }
}
class Invoice {
    constructor(name, city, state) {
        this.name = name;
        this.city = city;
        this.state = state;
        this.companyProfile = name + ", " + city + ", " + state;
    }
}
var googleInvoice = new Invoice('Google', 'Mountain View', 'OR');
var yahooInvoice = new Invoice('Yahoo', 'SF', 'CA');
console.log(googleInvoice.companyProfile);
console.log(yahooInvoice.companyProfile);
//# sourceMappingURL=classes_intro.js.map