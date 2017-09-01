class Posty {
  @processOne()
  @processTwo()
  someFunction() {}
}

function processOne() {
  console.log('processOne has run');
  return function (target, propertyKey : string, descriptor : PropertyDescriptor) {
    console.log('processOne has been called');
  }
}

function processTwo() {
  console.log('processTwo has run');
  return function (target, propertyKey : string, descriptor : PropertyDescriptor) {
    console.log('processTwo has been called');
  }
}

// class RealPost {
//   @admin()
//   delete() {}
// }
