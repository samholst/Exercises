// Function Declaration
function fullName5(first : string, last : string) : string {
  return first + " " + last;
}

// Function Expression
var otherFullName : (first : string, last : string) => string;

otherFullName = function (first : string, last : string) {
  return first + " " + last;
}

var thirdFullName : (first : string, last : string) => string = function (first : string, last : string) {
  return first + " " + last;
}

console.log(fullName5("Sam", "Holst"));
console.log(otherFullName("Jim", "Holst"));
console.log(thirdFullName("Dennis", "Holst"));
