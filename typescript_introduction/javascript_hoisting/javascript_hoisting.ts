// Still will work even though it's before the method
console.log(fullName51("Sam", "Holst"));

// Function Declaration
function fullName51(first : string, last : string) : string {
  return first + " " + last;
}

// Function Expression
var otherFullName1 : (first : string, last : string) => string;

otherFullName = function (first : string, last : string) {
  return first + " " + last;
}

var thirdFullName1 : (first : string, last : string) => string = function (first : string, last : string) {
  return first + " " + last;
}

// These won't work at the very top because they need to be declared first
console.log(otherFullName1("Jim", "Holst"));
console.log(thirdFullName1("Dennis", "Holst"));
