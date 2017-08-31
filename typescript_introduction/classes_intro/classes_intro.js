var HelloAngularComponents = (function () {
    function HelloAngularComponents() {
        this.greeting = ' Hello TypeScript';
    }
    return HelloAngularComponents;
}());
var Invoice = (function () {
    function Invoice(name, city, state) {
        this.name = name;
        this.city = city;
        this.state = state;
        this.companyProfile = name + ", " + city + ", " + state;
    }
    return Invoice;
}());
var googleInvoice = new Invoice('Google', 'Mountain View', 'OR');
var yahooInvoice = new Invoice('Yahoo', 'SF', 'CA');
console.log(googleInvoice.companyProfile);
console.log(yahooInvoice.companyProfile);
//# sourceMappingURL=classes_intro.js.map