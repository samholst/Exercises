var Blog;
(function (Blog) {
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
    Blog.Post = Post;
})(Blog || (Blog = {}));
var Content;
(function (Content) {
    class Post {
        constructor(post) {
            this.title = post.title;
            this.body = post.body;
            this.slug = post.slug;
            this.seoKeywords = post.seoKeywords;
        }
        printPost() {
            console.log(this.title);
            console.log(this.body);
            console.log(this.slug);
            console.log(this.seoKeywords);
        }
    }
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