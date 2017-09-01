var InvoiceNew = (function () {
    function InvoiceNew(total) {
        this.total = total;
    }
    InvoiceNew.prototype.printTotal = function () {
        console.log(this.total);
    };
    // printLater(time : number) {
    //   setTimeout(function() {
    //     console.log(this.total);
    //   }, time);
    // }
    InvoiceNew.prototype.printLater = function (time) {
        var _this = this;
        setTimeout(function () {
            console.log(_this.total);
        }, time);
    };
    return InvoiceNew;
}());
var invoiceNew = new InvoiceNew(400);
invoiceNew.printTotal();
invoiceNew.printLater(1000);
//# sourceMappingURL=this_construct.js.map