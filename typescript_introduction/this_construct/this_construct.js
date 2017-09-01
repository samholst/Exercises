class InvoiceNew {
    constructor(total) {
        this.total = total;
    }
    printTotal() {
        console.log(this.total);
    }
    // printLater(time : number) {
    //   setTimeout(function() {
    //     console.log(this.total);
    //   }, time);
    // }
    printLater(time) {
        setTimeout(() => {
            console.log(this.total);
        }, time);
    }
}
var invoiceNew = new InvoiceNew(400);
invoiceNew.printTotal();
invoiceNew.printLater(1000);
//# sourceMappingURL=this_construct.js.map