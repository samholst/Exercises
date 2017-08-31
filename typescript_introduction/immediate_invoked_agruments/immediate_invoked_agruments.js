// **STUDY MORE**
// Function Expression
var otherFullName12;
otherFullName12 = function (first, last) {
    return first + " " + last;
};
console.log(otherFullName12);
// Immediatly Invoked version
(function (first, last) {
    console.log(first + " " + last);
})("Sam", "Holst");
// VS (invoked_functions)
// (function() {
//   for (let name in names2) {
//     counter++;
//   }
// })();
//# sourceMappingURL=immediate_invoked_agruments.js.map