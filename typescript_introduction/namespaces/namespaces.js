var Blog;
(function (Blog) {
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
    Blog.Post = Post;
})(Blog || (Blog = {}));
var Content;
(function (Content) {
    var Post = (function () {
        function Post(post) {
            this.title = post.title;
            this.body = post.body;
            this.slug = post.slug;
            this.seoKeywords = post.seoKeywords;
        }
        Post.prototype.printPost = function () {
            console.log(this.title);
            console.log(this.body);
            console.log(this.slug);
            console.log(this.seoKeywords);
        };
        return Post;
    }());
    Content.Post = Post;
})(Content || (Content = {}));
var blog_post = new Blog.Post({
    title: 'My Title',
    body: 'My small body'
});
var content_post = new Content.Post({
    title: 'My Title',
    body: 'My small body',
    slug: 'my-title',
    seoKeywords: 'My small body'
});
console.log(blog_post.title);
console.log(blog_post.body);
blog_post.printPost();
content_post.printPost();
//# sourceMappingURL=namespaces.js.map