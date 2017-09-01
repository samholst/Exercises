@detailsLog('billing')
class AccountsPayable {
  constructor() {}
}

@detailsLog('warehouse')
class ProductManager {
  constructor() {}
}

// decorators return a function and for classes, need to return an object
function detailsLog(dashboard : string) {
  if(dashboard == 'billing') {
    console.log('Working in the billing department');
    return function (target : Object) {};
  } else {
    return function (target : Object) {};
  }
}

var account = new AccountsPayable;
var pm = new ProductManager;
