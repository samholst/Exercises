// Loosely connected Interface with Class

interface User2 {
  email2 : string;
  firstName2? : string;
  lastName2? : string;
}

class Admin2 {
  role : string;
  constructor(public email2 : string) {
    this.role = 'Admin'
  }
}

function profile2(user: User2) : string {
  return `Welcome, ${user.email2}`;
}

var joe = new Admin2('joe@joe.com');
console.log(joe.role);
console.log(joe.email2);

// Direct implementation

interface IPost {
  title: string;
  body: string;
}

class Post implements IPost {
  title: string;
  body: string;

  constructor(post: IPost) {
    this.title = post.title;
    this.body = post.body;
  }

  printPost() {
    console.log(this.title);
    console.log(this.body);
  }
}

var post = new Post({ title: 'My Title', body: 'My small body' });
console.log(post.title);
console.log(post.body);

post.printPost();
