namespace Blog {
  export interface IPost {
    title: string;
    body: string;
  }

  export class Post implements IPost {
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
}

namespace Content {
  export interface IPost {
    title: string;
    body: string;
    slug: string;
    seoKeywords: string;
  }

  export class Post implements IPost {
    title: string;
    body: string;
    slug: string;
    seoKeywords: string;

    constructor(post: IPost) {
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
}

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
