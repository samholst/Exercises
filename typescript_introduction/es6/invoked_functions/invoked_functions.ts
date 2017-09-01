// **STUDY MORE**

var names2 : string[] = ['Jordan', 'Tiffany', 'Kristine'];
var counter : number = 0;

(function() {
  for (let name in names2) {
    counter++;
  }
})();

console.log(counter);
