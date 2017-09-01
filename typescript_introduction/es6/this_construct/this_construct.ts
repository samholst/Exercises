class InvoiceNew {
  total : number;

  constructor(total : number) {
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

  printLater(time : number) {
    setTimeout(() => {
      console.log(this.total);
    }, time);
  }
}

var invoiceNew = new InvoiceNew(400);
invoiceNew.printTotal();
invoiceNew.printLater(1000);
