// var t : number = 0;
//
// while (t < 10) {
//   console.log(t);
//   t++;
// }

let players3 : number[] = [3, 4, 12, 49];

// for in (provides index values)
// => 0 1 2 3
for (let player in players3) {
  console.log(player);
}

// for of (provides values)
// => 3 4 12 49
for (let player of players3) {
  console.log(player);
}
