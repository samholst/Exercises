// ? makes the argument optional. You cannot have a required value after an optional value
function printAddress(street, streetTwo, state) {
    if (state === void 0) { state = 'AZ'; }
    console.log(street);
    if (streetTwo) {
        console.log(streetTwo);
    }
    console.log(state);
}
printAddress('123 hi street', 'Suite #45');
printAddress('123 hi street');
printAddress('123 hi street', 'Suite #45', 'NV');
function lineupCard(team) {
    var players = [];
    for (var _i = 1; _i < arguments.length; _i++) {
        players[_i - 1] = arguments[_i];
    }
    console.log('Team: ' + team);
    for (var _a = 0, players_1 = players; _a < players_1.length; _a++) {
        var player_1 = players_1[_a];
        console.log(player_1);
    }
}
lineupCard('Astros', "Sam", "John", "Jack");
//# sourceMappingURL=function_agruments.js.map