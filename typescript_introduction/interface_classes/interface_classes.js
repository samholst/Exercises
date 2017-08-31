// Loosely connected Interface with Class
var Admin2 = (function () {
    function Admin2(email2) {
        this.email2 = email2;
        this.role = 'Admin';
    }
    return Admin2;
}());
function profile2(user) {
    return "Welcome, " + user.email2;
}
var joe = new Admin2('joe@joe.com');
console.log(joe.role);
console.log(joe.email2);
var Post = (function () {
    function Post(post) {
        this.title = post.title;
        this.body = post.body;
    }
    Post.prototype.printPost = function () {
        console.log(this.title);
        console.log(this.body);
    };
    return Post;
}());
var post = new Post({ title: 'My Title', body: 'My small body' });
console.log(post.title);
console.log(post.body);
post.printPost();
//# sourceMappingURL=interface_classes.js.map