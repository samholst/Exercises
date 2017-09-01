// ? makes the argument optional. You cannot have a required value after an optional value
function printAddress(street, streetTwo, state = 'AZ') {
    console.log(street);
    if (streetTwo) {
        console.log(streetTwo);
    }
    console.log(state);
}
printAddress('123 hi street', 'Suite #45');
printAddress('123 hi street');
printAddress('123 hi street', 'Suite #45', 'NV');
function lineupCard(team, ...players) {
    console.log('Team: ' + team);
    for (let player of players) {
        console.log(player);
    }
}
lineupCard('Astros', "Sam", "John", "Jack");
//# sourceMappingURL=function_agruments.js.map