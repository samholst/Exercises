var age = '12';
let name = 'Kirstine';

var name, city, age;

// alert(name);
console.log(age);
console.log(name);

// Hoisted
name = 'Kristine';
console.log(name); // 'Kristine'
var name;

// Initializers not hoisted
console.log(age); // undefined
var age = 33;
