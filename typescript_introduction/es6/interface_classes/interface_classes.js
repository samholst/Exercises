// Loosely connected Interface with Class
class Admin2 {
    constructor(email2) {
        this.email2 = email2;
        this.role = 'Admin';
    }
}
function profile2(user) {
    return `Welcome, ${user.email2}`;
}
var joe = new Admin2('joe@joe.com');
console.log(joe.role);
console.log(joe.email2);
class Post {
    constructor(post) {
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
//# sourceMappingURL=interface_classes.js.map