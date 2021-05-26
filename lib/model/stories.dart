class StoryModel {
  List<Data> data;

  StoryModel({this.data});

  StoryModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int userId;
  String username;
  String email;
  String firstName;
  String lastName;
  String avatar;
  String cover;
  List<Stories> stories;

  Data(
      {this.userId,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.avatar,
      this.cover,
      this.stories});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    cover = json['cover'];
    if (json['stories'] != null) {
      stories = <Stories>[];
      json['stories'].forEach((v) {
        stories.add(new Stories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['user_id'] = this.userId;
    data['username'] = this.username;
    data['email'] = this.email;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['avatar'] = this.avatar;
    data['cover'] = this.cover;
    if (this.stories != null) {
      data['stories'] = this.stories.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Stories {
  int id;
  int userId;
  String title;
  String description;
  String posted;
  String expire;
  String thumbnail;
  StoryMediaImage storyMediaImage;
  Null storyMediaVideo;

  Stories(
      {this.id,
      this.userId,
      this.title,
      this.description,
      this.posted,
      this.expire,
      this.thumbnail,
      this.storyMediaImage,
      this.storyMediaVideo});

  Stories.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
    description = json['description'];
    posted = json['posted'];
    expire = json['expire'];
    thumbnail = json['thumbnail'];
    storyMediaImage = json['story_media_image'] != null
        ? new StoryMediaImage.fromJson(json['story_media_image'])
        : null;
    storyMediaVideo = json['story_media_video'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['title'] = this.title;
    data['description'] = this.description;
    data['posted'] = this.posted;
    data['expire'] = this.expire;
    data['thumbnail'] = this.thumbnail;
    if (this.storyMediaImage != null) {
      data['story_media_image'] = this.storyMediaImage.toJson();
    }
    data['story_media_video'] = this.storyMediaVideo;
    return data;
  }
}

class StoryMediaImage {
  int storyId;
  String type;
  String filename;
  String expire;

  StoryMediaImage({this.storyId, this.type, this.filename, this.expire});

  StoryMediaImage.fromJson(Map<String, dynamic> json) {
    storyId = json['story_id'];
    type = json['type'];
    filename = json['filename'];
    expire = json['expire'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['story_id'] = this.storyId;
    data['type'] = this.type;
    data['filename'] = this.filename;
    data['expire'] = this.expire;
    return data;
  }
}