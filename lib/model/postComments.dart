class CommentData {
  bool success;
  List<AllComments> comments;

  CommentData({this.success, this.comments});

  CommentData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['comments'] != null) {
      comments = <AllComments>[];
      json['comments'].forEach((v) {
        comments.add(new AllComments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllComments {
  int id;
  int userId;
  int pageId;
  int postId;
  String text;
  String record;
  String cFile;
  int time;
  int repliesCount;

  AllComments(
      {this.id,
      this.userId,
      this.pageId,
      this.postId,
      this.text,
      this.record,
      this.cFile,
      this.time,
      this.repliesCount});

  AllComments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    pageId = json['page_id'];
    postId = json['post_id'];
    text = json['text'];
    record = json['record'];
    cFile = json['c_file'];
    time = json['time'];
    repliesCount = json['replies_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['page_id'] = this.pageId;
    data['post_id'] = this.postId;
    data['text'] = this.text;
    data['record'] = this.record;
    data['c_file'] = this.cFile;
    data['time'] = this.time;
    data['replies_count'] = this.repliesCount;
    return data;
  }
}

class PostComments {
  bool success;
  List<AllComments> comments;

  PostComments({this.success, this.comments});

  PostComments.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['comments'] != null) {
      comments = <AllComments>[];
      json['comments'].forEach((v) {
        comments.add(new AllComments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  int id;
  int userId;
  int pageId;
  int postId;
  String text;
  String record;
  String cFile;
  int time;
  int repliesCount;

  Comments(
      {this.id,
      this.userId,
      this.pageId,
      this.postId,
      this.text,
      this.record,
      this.cFile,
      this.time,
      this.repliesCount});

  Comments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    pageId = json['page_id'];
    postId = json['post_id'];
    text = json['text'];
    record = json['record'];
    cFile = json['c_file'];
    time = json['time'];
    repliesCount = json['replies_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['page_id'] = this.pageId;
    data['post_id'] = this.postId;
    data['text'] = this.text;
    data['record'] = this.record;
    data['c_file'] = this.cFile;
    data['time'] = this.time;
    data['replies_count'] = this.repliesCount;
    return data;
  }
}
