class PageModel {
  bool success;
  List<Pages> pages;
  List<Suggestions> suggestions;

  PageModel({this.success, this.pages, this.suggestions});

  PageModel.fromJson(Map<String, dynamic> json) {
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
  int pageId;
  int time;
  String active;
  TimelinePage page;

  Pages({this.id, this.userId, this.pageId, this.time, this.active, this.page});

  Pages.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    pageId = json['page_id'];
    time = json['time'];
    active = json['active'];
    page =
        json['page'] != null ? new TimelinePage.fromJson(json['page']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['page_id'] = this.pageId;
    data['time'] = this.time;
    data['active'] = this.active;
    if (this.page != null) {
      data['page'] = this.page.toJson();
    }
    return data;
  }
}

class TimelinePage {
  int pageId;
  PageUser user;
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

  TimelinePage(
      {this.pageId,
      this.user,
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

  TimelinePage.fromJson(Map<String, dynamic> json) {
    pageId = json['page_id'];
    user = json['user'] != null ? new PageUser.fromJson(json['user']) : null;
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
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
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

class PageUser {
  int userId;
  String username;
  String email;
  String firstName;
  String lastName;
  String avatar;
  String cover;
  String backgroundImage;
  String backgroundImageStatus;
  int relationshipId;
  String address;
  String working;
  String workingLink;
  String about;
  String school;
  String gender;
  String birthday;
  int countryId;
  String website;
  String facebook;
  String google;
  String twitter;
  String linkedin;
  String youtube;
  String vk;
  String instagram;
  String language;
  String emailCode;
  String src;
  String ipAddress;
  String followPrivacy;
  String friendPrivacy;
  String postPrivacy;
  String messagePrivacy;
  String confirmFollowers;
  String showActivitiesPrivacy;
  String birthPrivacy;
  String visitPrivacy;
  String verified;
  int businessMedia;
  int allowAddBusiness;
  String lastseen;
  String showlastseen;
  String emailNotification;
  String eLiked;
  String eWondered;
  String eShared;
  String eFollowed;
  String eCommented;
  String eVisited;
  String eLikedPage;
  String eMentioned;
  String eJoinedGroup;
  String eAccepted;
  String eProfileWallPost;
  Null eSentmeMsg;
  String eLastNotif;
  String notificationSettings;
  String status;
  String active;
  String admin;
  String type;
  String registered;
  String startUp;
  String startUpInfo;
  String startupFollow;
  String startupImage;
  int lastEmailSent;
  String phoneNumber;
  int smsCode;
  String isPro;
  int proTime;
  String proType;
  int joined;
  String cssFile;
  String timezone;
  int referrer;
  int refUserId;
  String balance;
  String paypalEmail;
  String notificationsSound;
  String orderPostsBy;
  String socialLogin;
  String androidMDeviceId;
  Null iosMDeviceId;
  Null androidNDeviceId;
  String iosNDeviceId;
  String webDeviceId;
  String wallet;
  String lat;
  String lng;
  String lastLocationUpdate;
  int shareMyLocation;
  int lastDataUpdate;
  String details;
  String sidebarData;
  int lastAvatarMod;
  int lastCoverMod;
  int points;
  int dailyPoints;
  String pointDayExpire;
  int lastFollowId;
  int shareMyData;
  String lastLoginData;
  int twoFactor;
  String newEmail;
  int twoFactorVerified;
  String newPhone;
  String infoFile;
  String city;
  String state;
  String zip;
  int schoolCompleted;
  String weatherUnit;
  String paystackRef;
  int bloggerApproved;

  PageUser(
      {this.userId,
      this.username,
      this.email,
      this.firstName,
      this.lastName,
      this.avatar,
      this.cover,
      this.backgroundImage,
      this.backgroundImageStatus,
      this.relationshipId,
      this.address,
      this.working,
      this.workingLink,
      this.about,
      this.school,
      this.gender,
      this.birthday,
      this.countryId,
      this.website,
      this.facebook,
      this.google,
      this.twitter,
      this.linkedin,
      this.youtube,
      this.vk,
      this.instagram,
      this.language,
      this.emailCode,
      this.src,
      this.ipAddress,
      this.followPrivacy,
      this.friendPrivacy,
      this.postPrivacy,
      this.messagePrivacy,
      this.confirmFollowers,
      this.showActivitiesPrivacy,
      this.birthPrivacy,
      this.visitPrivacy,
      this.verified,
      this.businessMedia,
      this.allowAddBusiness,
      this.lastseen,
      this.showlastseen,
      this.emailNotification,
      this.eLiked,
      this.eWondered,
      this.eShared,
      this.eFollowed,
      this.eCommented,
      this.eVisited,
      this.eLikedPage,
      this.eMentioned,
      this.eJoinedGroup,
      this.eAccepted,
      this.eProfileWallPost,
      this.eSentmeMsg,
      this.eLastNotif,
      this.notificationSettings,
      this.status,
      this.active,
      this.admin,
      this.type,
      this.registered,
      this.startUp,
      this.startUpInfo,
      this.startupFollow,
      this.startupImage,
      this.lastEmailSent,
      this.phoneNumber,
      this.smsCode,
      this.isPro,
      this.proTime,
      this.proType,
      this.joined,
      this.cssFile,
      this.timezone,
      this.referrer,
      this.refUserId,
      this.balance,
      this.paypalEmail,
      this.notificationsSound,
      this.orderPostsBy,
      this.socialLogin,
      this.androidMDeviceId,
      this.iosMDeviceId,
      this.androidNDeviceId,
      this.iosNDeviceId,
      this.webDeviceId,
      this.wallet,
      this.lat,
      this.lng,
      this.lastLocationUpdate,
      this.shareMyLocation,
      this.lastDataUpdate,
      this.details,
      this.sidebarData,
      this.lastAvatarMod,
      this.lastCoverMod,
      this.points,
      this.dailyPoints,
      this.pointDayExpire,
      this.lastFollowId,
      this.shareMyData,
      this.lastLoginData,
      this.twoFactor,
      this.newEmail,
      this.twoFactorVerified,
      this.newPhone,
      this.infoFile,
      this.city,
      this.state,
      this.zip,
      this.schoolCompleted,
      this.weatherUnit,
      this.paystackRef,
      this.bloggerApproved});

  PageUser.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    username = json['username'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
    cover = json['cover'];
    backgroundImage = json['background_image'];
    backgroundImageStatus = json['background_image_status'];
    relationshipId = json['relationship_id'];
    address = json['address'];
    working = json['working'];
    workingLink = json['working_link'];
    about = json['about'];
    school = json['school'];
    gender = json['gender'];
    birthday = json['birthday'];
    countryId = json['country_id'];
    website = json['website'];
    facebook = json['facebook'];
    google = json['google'];
    twitter = json['twitter'];
    linkedin = json['linkedin'];
    youtube = json['youtube'];
    vk = json['vk'];
    instagram = json['instagram'];
    language = json['language'];
    emailCode = json['email_code'];
    src = json['src'];
    ipAddress = json['ip_address'];
    followPrivacy = json['follow_privacy'];
    friendPrivacy = json['friend_privacy'];
    postPrivacy = json['post_privacy'];
    messagePrivacy = json['message_privacy'];
    confirmFollowers = json['confirm_followers'];
    showActivitiesPrivacy = json['show_activities_privacy'];
    birthPrivacy = json['birth_privacy'];
    visitPrivacy = json['visit_privacy'];
    verified = json['verified'];
    businessMedia = json['business_media'];
    allowAddBusiness = json['allow_add_business'];
    lastseen = json['lastseen'];
    showlastseen = json['showlastseen'];
    emailNotification = json['emailNotification'];
    eLiked = json['e_liked'];
    eWondered = json['e_wondered'];
    eShared = json['e_shared'];
    eFollowed = json['e_followed'];
    eCommented = json['e_commented'];
    eVisited = json['e_visited'];
    eLikedPage = json['e_liked_page'];
    eMentioned = json['e_mentioned'];
    eJoinedGroup = json['e_joined_group'];
    eAccepted = json['e_accepted'];
    eProfileWallPost = json['e_profile_wall_post'];
    eSentmeMsg = json['e_sentme_msg'];
    eLastNotif = json['e_last_notif'];
    notificationSettings = json['notification_settings'];
    status = json['status'];
    active = json['active'];
    admin = json['admin'];
    type = json['type'];
    registered = json['registered'];
    startUp = json['start_up'];
    startUpInfo = json['start_up_info'];
    startupFollow = json['startup_follow'];
    startupImage = json['startup_image'];
    lastEmailSent = json['last_email_sent'];
    phoneNumber = json['phone_number'];
    smsCode = json['sms_code'];
    isPro = json['is_pro'];
    proTime = json['pro_time'];
    proType = json['pro_type'];
    joined = json['joined'];
    cssFile = json['css_file'];
    timezone = json['timezone'];
    referrer = json['referrer'];
    refUserId = json['ref_user_id'];
    balance = json['balance'];
    paypalEmail = json['paypal_email'];
    notificationsSound = json['notifications_sound'];
    orderPostsBy = json['order_posts_by'];
    socialLogin = json['social_login'];
    androidMDeviceId = json['android_m_device_id'];
    iosMDeviceId = json['ios_m_device_id'];
    androidNDeviceId = json['android_n_device_id'];
    iosNDeviceId = json['ios_n_device_id'];
    webDeviceId = json['web_device_id'];
    wallet = json['wallet'];
    lat = json['lat'];
    lng = json['lng'];
    lastLocationUpdate = json['last_location_update'];
    shareMyLocation = json['share_my_location'];
    lastDataUpdate = json['last_data_update'];
    details = json['details'];
    sidebarData = json['sidebar_data'];
    lastAvatarMod = json['last_avatar_mod'];
    lastCoverMod = json['last_cover_mod'];
    points = json['points'];
    dailyPoints = json['daily_points'];
    pointDayExpire = json['point_day_expire'];
    lastFollowId = json['last_follow_id'];
    shareMyData = json['share_my_data'];
    lastLoginData = json['last_login_data'];
    twoFactor = json['two_factor'];
    newEmail = json['new_email'];
    twoFactorVerified = json['two_factor_verified'];
    newPhone = json['new_phone'];
    infoFile = json['info_file'];
    city = json['city'];
    state = json['state'];
    zip = json['zip'];
    schoolCompleted = json['school_completed'];
    weatherUnit = json['weather_unit'];
    paystackRef = json['paystack_ref'];
    bloggerApproved = json['blogger_approved'];
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
    data['background_image'] = this.backgroundImage;
    data['background_image_status'] = this.backgroundImageStatus;
    data['relationship_id'] = this.relationshipId;
    data['address'] = this.address;
    data['working'] = this.working;
    data['working_link'] = this.workingLink;
    data['about'] = this.about;
    data['school'] = this.school;
    data['gender'] = this.gender;
    data['birthday'] = this.birthday;
    data['country_id'] = this.countryId;
    data['website'] = this.website;
    data['facebook'] = this.facebook;
    data['google'] = this.google;
    data['twitter'] = this.twitter;
    data['linkedin'] = this.linkedin;
    data['youtube'] = this.youtube;
    data['vk'] = this.vk;
    data['instagram'] = this.instagram;
    data['language'] = this.language;
    data['email_code'] = this.emailCode;
    data['src'] = this.src;
    data['ip_address'] = this.ipAddress;
    data['follow_privacy'] = this.followPrivacy;
    data['friend_privacy'] = this.friendPrivacy;
    data['post_privacy'] = this.postPrivacy;
    data['message_privacy'] = this.messagePrivacy;
    data['confirm_followers'] = this.confirmFollowers;
    data['show_activities_privacy'] = this.showActivitiesPrivacy;
    data['birth_privacy'] = this.birthPrivacy;
    data['visit_privacy'] = this.visitPrivacy;
    data['verified'] = this.verified;
    data['business_media'] = this.businessMedia;
    data['allow_add_business'] = this.allowAddBusiness;
    data['lastseen'] = this.lastseen;
    data['showlastseen'] = this.showlastseen;
    data['emailNotification'] = this.emailNotification;
    data['e_liked'] = this.eLiked;
    data['e_wondered'] = this.eWondered;
    data['e_shared'] = this.eShared;
    data['e_followed'] = this.eFollowed;
    data['e_commented'] = this.eCommented;
    data['e_visited'] = this.eVisited;
    data['e_liked_page'] = this.eLikedPage;
    data['e_mentioned'] = this.eMentioned;
    data['e_joined_group'] = this.eJoinedGroup;
    data['e_accepted'] = this.eAccepted;
    data['e_profile_wall_post'] = this.eProfileWallPost;
    data['e_sentme_msg'] = this.eSentmeMsg;
    data['e_last_notif'] = this.eLastNotif;
    data['notification_settings'] = this.notificationSettings;
    data['status'] = this.status;
    data['active'] = this.active;
    data['admin'] = this.admin;
    data['type'] = this.type;
    data['registered'] = this.registered;
    data['start_up'] = this.startUp;
    data['start_up_info'] = this.startUpInfo;
    data['startup_follow'] = this.startupFollow;
    data['startup_image'] = this.startupImage;
    data['last_email_sent'] = this.lastEmailSent;
    data['phone_number'] = this.phoneNumber;
    data['sms_code'] = this.smsCode;
    data['is_pro'] = this.isPro;
    data['pro_time'] = this.proTime;
    data['pro_type'] = this.proType;
    data['joined'] = this.joined;
    data['css_file'] = this.cssFile;
    data['timezone'] = this.timezone;
    data['referrer'] = this.referrer;
    data['ref_user_id'] = this.refUserId;
    data['balance'] = this.balance;
    data['paypal_email'] = this.paypalEmail;
    data['notifications_sound'] = this.notificationsSound;
    data['order_posts_by'] = this.orderPostsBy;
    data['social_login'] = this.socialLogin;
    data['android_m_device_id'] = this.androidMDeviceId;
    data['ios_m_device_id'] = this.iosMDeviceId;
    data['android_n_device_id'] = this.androidNDeviceId;
    data['ios_n_device_id'] = this.iosNDeviceId;
    data['web_device_id'] = this.webDeviceId;
    data['wallet'] = this.wallet;
    data['lat'] = this.lat;
    data['lng'] = this.lng;
    data['last_location_update'] = this.lastLocationUpdate;
    data['share_my_location'] = this.shareMyLocation;
    data['last_data_update'] = this.lastDataUpdate;
    data['details'] = this.details;
    data['sidebar_data'] = this.sidebarData;
    data['last_avatar_mod'] = this.lastAvatarMod;
    data['last_cover_mod'] = this.lastCoverMod;
    data['points'] = this.points;
    data['daily_points'] = this.dailyPoints;
    data['point_day_expire'] = this.pointDayExpire;
    data['last_follow_id'] = this.lastFollowId;
    data['share_my_data'] = this.shareMyData;
    data['last_login_data'] = this.lastLoginData;
    data['two_factor'] = this.twoFactor;
    data['new_email'] = this.newEmail;
    data['two_factor_verified'] = this.twoFactorVerified;
    data['new_phone'] = this.newPhone;
    data['info_file'] = this.infoFile;
    data['city'] = this.city;
    data['state'] = this.state;
    data['zip'] = this.zip;
    data['school_completed'] = this.schoolCompleted;
    data['weather_unit'] = this.weatherUnit;
    data['paystack_ref'] = this.paystackRef;
    data['blogger_approved'] = this.bloggerApproved;
    return data;
  }
}

class Suggestions {
  int id;
  int userId;
  SuggestedPage page;
  int time;
  String active;

  Suggestions({this.id, this.userId, this.page, this.time, this.active});

  Suggestions.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    page =
        json['page'] != null ? new SuggestedPage.fromJson(json['page']) : null;
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

class SuggestedPage {
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

  SuggestedPage(
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

  SuggestedPage.fromJson(Map<String, dynamic> json) {
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
