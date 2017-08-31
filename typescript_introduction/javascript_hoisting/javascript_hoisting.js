// Still will work even though it's before the method
console.log(fullName51("Sam", "Holst"));
// Function Declaration
function fullName51(first, last) {
    return first + " " + last;
}
// Function Expression
var otherFullName1;
otherFullName = function (first, last) {
    return first + " " + last;
};
var thirdFullName1 = function (first, last) {
    return first + " " + last;
};
// These won't work at the very top because they need to be declared first
console.log(otherFullName1("Jim", "Holst"));
console.log(thirdFullName1("Dennis", "Holst"));
//# sourceMappingURL=javascript_hoisting.js.map