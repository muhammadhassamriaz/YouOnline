import 'package:youonline/model/page.dart';

class AllPages {
  bool success;
  List<Pages> pages;
  List<Suggestions> suggestions;

  AllPages({this.success, this.pages});

  AllPages.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['pages'] != null) {
      pages = <Pages>[];
      json['pages'].forEach((v) {
        pages.add(new Pages.fromJson(v));
      });
    }
    if (json['suggestions'] != null) {
      suggestions = <Suggestions>[];
      json['suggestions'].forEach((v) {
        suggestions.add(new Suggestions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.pages != null) {
      data['pages'] = this.pages.map((v) => v.toJson()).toList();
    }
    if (this.suggestions != null) {
      data['suggestions'] = this.suggestions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pages {
  int id;
  int userId;
  Page page;
  int time;
  String active;

  Pages({this.id, this.userId, this.page, this.time, this.active});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    page = json['page'] != null ? new Page.fromJson(json['page']) : null;
    time = json['time'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    if (this.page != null) {
      data['page'] = this.page.toJson();
    }
    data['time'] = this.time;
    data['active'] = this.active;
    return data;
  }
}

class Page {
  int pageId;
  String pageName;
  String pageTitle;
  String pageDescription;
  String avatar;
  String cover;
  int usersPost;
  int pageCategory;
  String subCategory;
  String website;
  String facebook;
  String google;
  String vk;
  String twitter;
  String linkedin;
  String company;
  String phone;
  String address;
  int callActionType;
  String callActionTypeUrl;
  String backgroundImage;
  int backgroundImageStatus;
  String instgram;
  String youtube;
  String verified;
  String active;
  String registered;
  String boosted;

  Page(
      {this.pageId,
      this.pageName,
      this.pageTitle,
      this.pageDescription,
      this.avatar,
      this.cover,
      this.usersPost,
      this.pageCategory,
      this.subCategory,
      this.website,
      this.facebook,
      this.google,
      this.vk,
      this.twitter,
      this.linkedin,
      this.company,
      this.phone,
      this.address,
      this.callActionType,
      this.callActionTypeUrl,
      this.backgroundImage,
      this.backgroundImageStatus,
      this.instgram,
      this.youtube,
      this.verified,
      this.active,
      this.registered,
      this.boosted});

  Page.fromJson(Map<String, dynamic> json) {
    pageId = json['page_id'];
    pageName = json['page_name'];
    pageTitle = json['page_title'];
    pageDescription = json['page_description'];
    avatar = json['avatar'];
    cover = json['cover'];
    usersPost = json['users_post'];
    pageCategory = json['page_category'];
    subCategory = json['sub_category'];
    website = json['website'];
    facebook = json['facebook'];
    google = json['google'];
    vk = json['vk'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    company = json['company'];
    phone = json['phone'];
    address = json['address'];
    callActionType = json['call_action_type'];
    callActionTypeUrl = json['call_action_type_url'];
    backgroundImage = json['background_image'];
    backgroundImageStatus = json['background_image_status'];
    instgram = json['instgram'];
    youtube = json['youtube'];
    verified = json['verified'];
    active = json['active'];
    registered = json['registered'];
    boosted = json['boosted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['page_id'] = this.pageId;
    data['page_name'] = this.pageName;
    data['page_title'] = this.pageTitle;
    data['page_description'] = this.pageDescription;
    data['avatar'] = this.avatar;
    data['cover'] = this.cover;
    data['users_post'] = this.usersPost;
    data['page_category'] = this.pageCategory;
    data['sub_category'] = this.subCategory;
    data['website'] = this.website;
    data['facebook'] = this.facebook;
    data['google'] = this.google;
    data['vk'] = this.vk;
    data['twitter'] = this.twitter;
    data['linkedin'] = this.linkedin;
    data['company'] = this.company;
    data['phone'] = this.phone;
    data['address'] = this.address;
    data['call_action_type'] = this.callActionType;
    data['call_action_type_url'] = this.callActionTypeUrl;
    data['background_image'] = this.backgroundImage;
    data['background_image_status'] = this.backgroundImageStatus;
    data['instgram'] = this.instgram;
    data['youtube'] = this.youtube;
    data['verified'] = this.verified;
    data['active'] = this.active;
    data['registered'] = this.registered;
    data['boosted'] = this.boosted;
    return data;
  }
}
