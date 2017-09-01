@detailsLog2('billing')
class AccountsPayable2 {
  constructor() {}

  @admin
  deleteAccount() {
    console.log('Deleting account...');
  }
}

// decorators return a function and for classes, need to return an object
function detailsLog2(dashboard : string) {
  if(dashboard == 'billing') {
    console.log('Working in the billing department');
    return function (target : Object) {};
  } else {
    return function (target : Object) {};
  }
}

function admin(target : Object, propertyKey : string, descriptor : TypedPropertyDescriptor<any>) : any {
  console.log('Doing admin check');
  return descriptor;
}

var account2 = new AccountsPayable2;
account2.deleteAccount();

// OUTPUT
// Doing admin check
// Working in the billing department
// Deleting account...
