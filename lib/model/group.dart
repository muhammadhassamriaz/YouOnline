class GroupModel {
  int id;
  int userId;
  int groupId;
  String time;
  String active;
  Group group;

  GroupModel(
      {this.id, this.userId, this.groupId, this.time, this.active, this.group});

  GroupModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    groupId = json['group_id'];
    time = json['time'];
    active = json['active'];
    group = json['group'] != null ? new Group.fromJson(json['group']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['group_id'] = this.groupId;
    data['time'] = this.time;
    data['active'] = this.active;
    if (this.group != null) {
      data['group'] = this.group.toJson();
    }
    return data;
  }
}

class Group {
  int id;
  int userId;
  String groupName;
  String groupTitle;
  String avatar;
  String cover;
  String about;
  int groupId;
  int category;
  String subCategory;
  String privacy;
  String joinPrivacy;
  String active;
  String registered;

  Group(
      {this.id,
      this.userId,
      this.groupName,
      this.groupTitle,
      this.avatar,
      this.cover,
      this.about,
      this.category,
      this.subCategory,
      this.privacy,
      this.joinPrivacy,
      this.active,
      this.registered});

  Group.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    groupName = json['group_name'];
    groupTitle = json['group_title'];
    avatar = json['avatar'];
    cover = json['cover'];
    about = json['about'];
    category = json['category'];
    subCategory = json['sub_category'];
    privacy = json['privacy'];
    joinPrivacy = json['join_privacy'];
    groupId = json['group_id'];
    active = json['active'];
    registered = json['registered'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['group_name'] = this.groupName;
    data['group_title'] = this.groupTitle;
    data['avatar'] = this.avatar;
    data['cover'] = this.cover;
    data['about'] = this.about;
    data['category'] = this.category;
    data['sub_category'] = this.subCategory;
    data['privacy'] = this.privacy;
    data['join_privacy'] = this.joinPrivacy;
    data['active'] = this.active;
    data['registered'] = this.registered;
    data['group_id'] = this.groupId;
    return data;
  }
}

class SuggestionModel {
  int id;
  int userId;
  int groupId;
  String time;
  String active;
  Group group;

  SuggestionModel(
      {this.id, this.userId, this.groupId, this.time, this.active, this.group});

  SuggestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    groupId = json['group_id'];
    time = json['time'];
    active = json['active'];
    group = json['group'] != null ? new Group.fromJson(json['group']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['group_id'] = this.groupId;
    data['time'] = this.time;
    data['active'] = this.active;
    if (this.group != null) {
      data['group'] = this.group.toJson();
    }
    return data;
  }
}

class AllGroups {
  bool success;
  List<GroupModel> groups;
  List<SuggestionModel> suggestions;

  AllGroups({this.success, this.groups, this.suggestions});

  AllGroups.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['groups'] != null) {
      groups = <GroupModel>[];
      json['groups'].forEach((v) {
        groups.add(new GroupModel.fromJson(v));
      });
    }
    if (json['suggestions'] != null) {
      suggestions = <SuggestionModel>[];
      json['suggestions'].forEach((v) {
        suggestions.add(new SuggestionModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.groups != null) {
      data['groups'] = this.groups.map((v) => v.toJson()).toList();
    }
    if (this.suggestions != null) {
      data['suggestions'] = this.suggestions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
