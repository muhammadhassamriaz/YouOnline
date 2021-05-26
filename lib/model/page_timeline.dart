import 'package:youonline/model/page.dart';
import 'package:youonline/model/timeline_data.dart';

class SinglePageTimeline {
  bool success;
  TimelinePage page;
  Posts posts;

  SinglePageTimeline({this.success, this.page, this.posts});

  SinglePageTimeline.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    page = json['page'] != null ? new TimelinePage.fromJson(json['page']) : null;
    posts = json['posts'] != null ? new Posts.fromJson(json['posts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.page != null) {
      data['page'] = this.page.toJson();
    }
    if (this.posts != null) {
      data['posts'] = this.posts.toJson();
    }
    return data;
  }
}
