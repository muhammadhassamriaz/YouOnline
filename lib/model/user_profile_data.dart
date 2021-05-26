import 'package:youonline/model/timeline_data.dart';

class UserTimelineData {
  bool success;
  User user;
  Posts posts;
  bool profileOwner;

  UserTimelineData({this.success, this.user, this.posts, this.profileOwner});

  UserTimelineData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    posts = json['posts'] != null ? new Posts.fromJson(json['posts']) : null;
    profileOwner = json['profile_owner'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    if (this.posts != null) {
      data['posts'] = this.posts.toJson();
    }
    data['profile_owner'] = this.profileOwner;
    return data;
  }
}
