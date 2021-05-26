// class Blogs {
//   List<Data> data;
//   Links links;
//   Meta meta;

//   Blogs({this.data, this.links, this.meta});

//   Blogs.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data.add(new Data.fromJson(v));
//       });
//     }
//     links = json['links'] != null ? new Links.fromJson(json['links']) : null;
//     meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.data != null) {
//       data['data'] = this.data.map((v) => v.toJson()).toList();
//     }
//     if (this.links != null) {
//       data['links'] = this.links.toJson();
//     }
//     if (this.meta != null) {
//       data['meta'] = this.meta.toJson();
//     }
//     return data;
//   }
// }

// class Data {
//   int id;
//   int user;
//   String title;
//   String content;
//   String description;
//   String posted;
//   Category category;
//   String thumbnail;
//   int view;
//   int shared;
//   String tags;
//   List<Comments> comments;

//   Data(
//       {this.id,
//       this.user,
//       this.title,
//       this.content,
//       this.description,
//       this.posted,
//       this.category,
//       this.thumbnail,
//       this.view,
//       this.shared,
//       this.tags,
//       this.comments});

//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     user = json['user'];
//     title = json['title'];
//     content = json['content'];
//     description = json['description'];
//     posted = json['posted'];
//     category = json['category'] != null
//         ? new Category.fromJson(json['category'])
//         : null;
//     thumbnail = json['thumbnail'];
//     view = json['view'];
//     shared = json['shared'];
//     tags = json['tags'];
//     if (json['comments'] != null) {
//       comments = <Comments>[];
//       json['comments'].forEach((v) {
//         comments.add(new Comments.fromJson(v));
//       });
//     }
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['user'] = this.user;
//     data['title'] = this.title;
//     data['content'] = this.content;
//     data['description'] = this.description;
//     data['posted'] = this.posted;
//     if (this.category != null) {
//       data['category'] = this.category.toJson();
//     }
//     data['thumbnail'] = this.thumbnail;
//     data['view'] = this.view;
//     data['shared'] = this.shared;
//     data['tags'] = this.tags;
//     if (this.comments != null) {
//       data['comments'] = this.comments.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }

// class Category {
//   int id;
//   Lang lang;

//   Category({this.id, this.lang});

//   Category.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     lang = json['lang'] != null ? new Lang.fromJson(json['lang']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     if (this.lang != null) {
//       data['lang'] = this.lang.toJson();
//     }
//     return data;
//   }
// }

// class Lang {
//   int id;
//   String name;

//   Lang({this.id, this.name});

//   Lang.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     return data;
//   }
// }

// class Comments {
//   int id;
//   int blogId;
//   int userId;
//   String text;
//   int likes;
//   int posted;

//   Comments(
//       {this.id, this.blogId, this.userId, this.text, this.likes, this.posted});

//   Comments.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     blogId = json['blog_id'];
//     userId = json['user_id'];
//     text = json['text'];
//     likes = json['likes'];
//     posted = json['posted'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['blog_id'] = this.blogId;
//     data['user_id'] = this.userId;
//     data['text'] = this.text;
//     data['likes'] = this.likes;
//     data['posted'] = this.posted;
//     return data;
//   }
// }

// class Links {
//   String first;
//   String last;
//   Null prev;
//   String next;

//   Links({this.first, this.last, this.prev, this.next});

//   Links.fromJson(Map<String, dynamic> json) {
//     first = json['first'];
//     last = json['last'];
//     prev = json['prev'];
//     next = json['next'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['first'] = this.first;
//     data['last'] = this.last;
//     data['prev'] = this.prev;
//     data['next'] = this.next;
//     return data;
//   }
// }

// class Meta {
//   int currentPage;
//   int from;
//   int lastPage;
//   List<Link> links;
//   String path;
//   int perPage;
//   int to;
//   int total;

//   Meta(
//       {this.currentPage,
//       this.from,
//       this.lastPage,
//       this.links,
//       this.path,
//       this.perPage,
//       this.to,
//       this.total});

//   Meta.fromJson(Map<String, dynamic> json) {
//     currentPage = json['current_page'];
//     from = json['from'];
//     lastPage = json['last_page'];
//     if (json['links'] != null) {
//       links = <Link>[];
//       json['links'].forEach((v) {
//         links.add(new Link.fromJson(v));
//       });
//     }
//     path = json['path'];
//     perPage = json['per_page'];
//     to = json['to'];
//     total = json['total'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['current_page'] = this.currentPage;
//     data['from'] = this.from;
//     data['last_page'] = this.lastPage;
//     if (this.links != null) {
//       data['links'] = this.links.map((v) => v.toJson()).toList();
//     }
//     data['path'] = this.path;
//     data['per_page'] = this.perPage;
//     data['to'] = this.to;
//     data['total'] = this.total;
//     return data;
//   }
// }

// class Link {
//   String url;
//   String label;
//   bool active;

//   Link({this.url, this.label, this.active});

//   Link.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     label = json['label'];
//     active = json['active'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['url'] = this.url;
//     data['label'] = this.label;
//     data['active'] = this.active;
//     return data;
//   }
// }
