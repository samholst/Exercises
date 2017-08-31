// **STUDY MORE**

// Function Expression
var otherFullName12 : (first : string, last : string) => string;

otherFullName12 = function (first : string, last : string) {
  return first + " " + last;
}

console.log(otherFullName12);

// Immediatly Invoked version
(function(first :string, last :string) {
  console.log(first + " " + last);
})("Sam", "Holst");

// VS (invoked_functions)
// (function() {
//   for (let name in names2) {
//     counter++;
//   }
// })();
