interface User {
  email : string;
  firstName : string;
  lastName : string;
}

function profile(user: User) : string {
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
