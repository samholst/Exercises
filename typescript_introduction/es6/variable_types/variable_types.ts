// TypeScript has to be in snake case and not camal case

var fullName : string = "Sam Holst";
// Cannot redefine (instantiate another one with same name) a let statement, you can only change the value
let paidAccount : boolean = true;
// Cannot be change at all in the program
const versionNumber : number = 1.3;

// fullName = "Changed Name";
// paidAccount = false;
//
// console.log(fullName);
// console.log(paidAccount);
// console.log(versionNumber);

function printName(f, l) {
  var greeting : string = "Hi there, ";
  console.log(greeting + f + " " + l);
}

printName("Sam", "Holst");
