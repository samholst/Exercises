function profile(user) {
    return `Welcome, ${user.firstName} ${user.lastName}`;
}
var realPerson = {
    email: 'test@gmail.com',
    firstName: 'Jimmy',
    lastName: 'Barnes',
    test: 'iii'
};
console.log(profile(realPerson));
console.log(realPerson.email);
//-----------------------------------------------//
//# sourceMappingURL=interfaces.js.map