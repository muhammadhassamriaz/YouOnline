import 'package:youonline/model/timeline_data.dart';

class SingleGroupData {
  bool success;
  Group group;
  Posts posts;

  SingleGroupData({this.success, this.group, this.posts});

  SingleGroupData.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    group = json['group'] != null ? new Group.fromJson(json['group']) : null;
    posts = json['posts'] != null ? new Posts.fromJson(json['posts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.group != null) {
      data['group'] = this.group.toJson();
    }
    if (this.posts != null) {
      data['posts'] = this.posts.toJson();
    }
    return data;
  }
}
