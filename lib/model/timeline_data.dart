import 'dart:io';

import 'package:youonline/model/colors.dart';
import 'package:youonline/model/page.dart';

class Timeline {
  bool success;
  Posts posts;

  Timeline({this.success, this.posts});

  Timeline.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    posts = json['posts'] != null ? new Posts.fromJson(json['posts']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    if (this.posts != null) {
      data['posts'] = this.posts.toJson();
    }
    return data;
  }
}

class Posts {
  List<TimelineData> data;
  bool success;

  Posts({this.data, this.success});

  Posts.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <TimelineData>[];
      json['data'].forEach((v) {
        data.add(new TimelineData.fromJson(v));
      });
    }
    success = json['success'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    data['success'] = this.success;
    return data;
  }
}

class TimelineData {
  int id;
  int postId;
  User user;
  int recipientId;
  String postText;
  TimelinePage page;
  Group group;
  // Null event;
  // Null pageEvent;
  String postLink;
  String postLinkTitle;
  String postLinkImage;
  String postLinkContent;
  String postVimeo;
  String postDailymotion;
  String postFacebook;
  String postFile;
  String postFileName;
  String postFileThumb;
  String postYoutube;
  String postVine;
  String postSoundCloud;
  String postPlaytube;
  String postDeepsound;
  String postMap;
  int postShare;
  String postPrivacy;
  String postType;
  String postFeeling;
  String postListening;
  String postTraveling;
  String postWatching;
  String postPlaying;
  String postPhoto;
  String time;
  String registered;
  String albumName;
  String multiImage;
  int multiImagePost;
  int boosted;
  int productId;
  int classifiedId;
  int jobsId;
  int propertyId;
  int pollId;
  int blogId;
  int forumId;
  int threadId;
  int videoViews;
  String postRecord;
  String postSticker;
  int sharedFrom;
  String postUrl;
  SharedBy sharedBy;
  int cache;
  int commentsStatus;
  int blur;
  int colorId;
  int jobId;
  int offerId;
  int fundRaiseId;
  int fundId;
  int active;
  String streamName;
  int ultimateVideos;
  int liveTime;
  int liveEnded;
  String agoraResourceId;
  String agoraSid;
  String type;
  int commentsCount;
  List<TimelinePostComments> comments;
  ColorPostTypes colored;
  int likesCount;
  int reactionCount;
  List<Reactions> reactions;
  List<ReactionTypes> reactionTypes;
  String youtube;
  String video;
  String image;
  List<Album> album;
  List<Options> options;

  TimelineData(
      {this.id,
      this.postId,
      this.user,
      this.recipientId,
      this.postText,
      this.page,
      this.group,
      // this.event,
      // this.pageEvent,
      this.postLink,
      this.postLinkTitle,
      this.postLinkImage,
      this.postLinkContent,
      this.postVimeo,
      this.postDailymotion,
      this.postFacebook,
      this.postFile,
      this.postFileName,
      this.postFileThumb,
      this.postYoutube,
      this.postVine,
      this.postSoundCloud,
      this.postPlaytube,
      this.postDeepsound,
      this.postMap,
      this.postShare,
      this.postPrivacy,
      this.postType,
      this.postFeeling,
      this.postListening,
      this.postTraveling,
      this.postWatching,
      this.postPlaying,
      this.postPhoto,
      this.time,
      this.registered,
      this.albumName,
      this.multiImage,
      this.multiImagePost,
      this.boosted,
      this.productId,
      this.classifiedId,
      this.jobsId,
      this.propertyId,
      this.pollId,
      this.blogId,
      this.forumId,
      this.threadId,
      this.videoViews,
      this.postRecord,
      this.postSticker,
      this.sharedFrom,
      this.postUrl,
      this.sharedBy,
      this.cache,
      this.commentsStatus,
      this.blur,
      this.colorId,
      this.jobId,
      this.offerId,
      this.fundRaiseId,
      this.fundId,
      this.active,
      this.streamName,
      this.ultimateVideos,
      this.liveTime,
      this.liveEnded,
      this.agoraResourceId,
      this.agoraSid,
      this.type,
      this.commentsCount,
      this.comments,
      this.colored,
      this.likesCount,
      this.reactionCount,
      this.reactions,
      this.reactionTypes,
      this.youtube,
      this.video,
      this.image});

  TimelineData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    recipientId = json['recipient_id'];
    postText = json['postText'];
    page = json['page'] != null ? new TimelinePage.fromJson(json['page']) : null;
    group = json['group'] != null ? new Group.fromJson(json['group']) : null;
    // event = json['event'];
    // pageEvent = json['page_event'];
    postLink = json['postLink'] ?? "";
    postLinkTitle = json['postLinkTitle'] ?? "";
    postLinkImage = json['postLinkImage'] ?? "";
    postLinkContent = json['postLinkContent'];
    postVimeo = json['postVimeo'];
    postDailymotion = json['postDailymotion'];
    postFacebook = json['postFacebook'];
    postFile = json['postFile'] ?? "";
    postFileName = json['postFileName'];
    postFileThumb = json['postFileThumb'];
    postYoutube = json['postYoutube'] ?? "";
    postVine = json['postVine'];
    postSoundCloud = json['postSoundCloud'];
    postPlaytube = json['postPlaytube'];
    postDeepsound = json['postDeepsound'];
    postMap = json['postMap'];
    postShare = json['postShare'];
    postPrivacy = json['postPrivacy'];
    postType = json['postType'];
    postFeeling = json['postFeeling'];
    postListening = json['postListening'];
    postTraveling = json['postTraveling'];
    postWatching = json['postWatching'];
    postPlaying = json['postPlaying'];
    postPhoto = json['postPhoto'];
    time = json['time'];
    registered = json['registered'];
    albumName = json['album_name'];
    multiImage = json['multi_image'];
    multiImagePost = json['multi_image_post'];
    boosted = json['boosted'];
    productId = json['product_id'];
    classifiedId = json['classified_id'];
    jobsId = json['jobs_id'];
    propertyId = json['property_id'];
    pollId = json['poll_id'];
    blogId = json['blog_id'];
    forumId = json['forum_id'];
    threadId = json['thread_id'];
    videoViews = json['videoViews'];
    postRecord = json['postRecord'];
    postSticker = json['postSticker'];
    sharedFrom = json['shared_from'];
    postUrl = json['post_url'];
    sharedBy = json['sharedBy'] != null
        ? new SharedBy.fromJson(json['sharedBy'])
        : null;
    cache = json['cache'];
    commentsStatus = json['comments_status'];
    blur = json['blur'];
    colorId = json['color_id'];
    jobId = json['job_id'];
    offerId = json['offer_id'];
    fundRaiseId = json['fund_raise_id'];
    fundId = json['fund_id'];
    active = json['active'];
    streamName = json['stream_name'];
    ultimateVideos = json['ultimate_videos'];
    liveTime = json['live_time'];
    liveEnded = json['live_ended'];
    agoraResourceId = json['agora_resource_id'];
    agoraSid = json['agora_sid'];
    type = json['type'];
    commentsCount = json['comments_count'];
    if (json['comments'] != null) {
      comments = <TimelinePostComments>[];
      json['comments'].forEach((v) {
        comments.add(new TimelinePostComments.fromJson(v));
      });
    }
    colored = json['colored'] != null
        ? ColorPostTypes.fromJson(json['colored'])
        : null;
    likesCount = json['likes_count'];

    reactionCount = json['reaction_count'];
    if (json['reactions'] != null) {
      reactions = <Reactions>[];
      json['reactions'].forEach((v) {
        reactions.add(new Reactions.fromJson(v));
      });
    }
    if (json['reactionTypes'] != null) {
      reactionTypes = <ReactionTypes>[];
      json['reactionTypes'].forEach((v) {
        reactionTypes.add(new ReactionTypes.fromJson(v));
      });
    }
    if (json['album'] != null) {
      album = <Album>[];
      json['album'].forEach((e) {
        album.add(Album.fromMap(e));
      });
    }
    if (json['options'] != null) {
      options = <Options>[];
      json['options'].forEach((e) {
        options.add(Options.fromMap(e));
      });
    }
    youtube = json['youtube'];
    video = json['video'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_id'] = this.postId;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['recipient_id'] = this.recipientId;
    data['postText'] = this.postText;
    data['page'] = this.page;
    data['group'] = this.group;
    // data['event'] = this.event;
    // data['page_event'] = this.pageEvent;
    data['postLink'] = this.postLink;
    data['postLinkTitle'] = this.postLinkTitle;
    data['postLinkImage'] = this.postLinkImage;
    data['postLinkContent'] = this.postLinkContent;
    data['postVimeo'] = this.postVimeo;
    data['postDailymotion'] = this.postDailymotion;
    data['postFacebook'] = this.postFacebook;
    data['postFile'] = this.postFile;
    data['postFileName'] = this.postFileName;
    data['postFileThumb'] = this.postFileThumb;
    data['postYoutube'] = this.postYoutube;
    data['postVine'] = this.postVine;
    data['postSoundCloud'] = this.postSoundCloud;
    data['postPlaytube'] = this.postPlaytube;
    data['postDeepsound'] = this.postDeepsound;
    data['postMap'] = this.postMap;
    data['postShare'] = this.postShare;
    data['postPrivacy'] = this.postPrivacy;
    data['postType'] = this.postType;
    data['postFeeling'] = this.postFeeling;
    data['postListening'] = this.postListening;
    data['postTraveling'] = this.postTraveling;
    data['postWatching'] = this.postWatching;
    data['postPlaying'] = this.postPlaying;
    data['postPhoto'] = this.postPhoto;
    data['time'] = this.time;
    data['registered'] = this.registered;
    data['album_name'] = this.albumName;
    data['multi_image'] = this.multiImage;
    data['multi_image_post'] = this.multiImagePost;
    data['boosted'] = this.boosted;
    data['product_id'] = this.productId;
    data['classified_id'] = this.classifiedId;
    data['jobs_id'] = this.jobsId;
    data['property_id'] = this.propertyId;
    data['poll_id'] = this.pollId;
    data['blog_id'] = this.blogId;
    data['forum_id'] = this.forumId;
    data['thread_id'] = this.threadId;
    data['videoViews'] = this.videoViews;
    data['postRecord'] = this.postRecord;
    data['postSticker'] = this.postSticker;
    data['shared_from'] = this.sharedFrom;
    data['post_url'] = this.postUrl;
    if (this.sharedBy != null) {
      data['sharedBy'] = this.sharedBy.toJson();
    }
    if (this.colored != null) {
      data['colored'] = this.colored.toJson();
    }

    data['cache'] = this.cache;
    data['comments_status'] = this.commentsStatus;
    data['blur'] = this.blur;
    data['color_id'] = this.colorId;
    data['job_id'] = this.jobId;
    data['offer_id'] = this.offerId;
    data['fund_raise_id'] = this.fundRaiseId;
    data['fund_id'] = this.fundId;
    data['active'] = this.active;
    data['stream_name'] = this.streamName;
    data['ultimate_videos'] = this.ultimateVideos;
    data['live_time'] = this.liveTime;
    data['live_ended'] = this.liveEnded;
    data['agora_resource_id'] = this.agoraResourceId;
    data['agora_sid'] = this.agoraSid;
    data['type'] = this.type;
    data['comments_count'] = this.commentsCount;
    if (this.comments != null) {
      data['comments'] = this.comments.map((v) => v.toJson()).toList();
    }
    data['likes_count'] = this.likesCount;

    data['reaction_count'] = this.reactionCount;
    if (this.reactions != null) {
      data['reactions'] = this.reactions.map((v) => v.toJson()).toList();
    }
    if (this.reactionTypes != null) {
      data['reactionTypes'] =
          this.reactionTypes.map((v) => v.toJson()).toList();
    }
    if (this.album != null) {
      data['album'] = this.album.map((e) => e.toMap()).toList();
    }
    if (this.options != null) {
      data['options'] = this.options.map((e) => e.toMap()).toList();
    }
    data['youtube'] = this.youtube;
    data['video'] = this.video;
    data['image'] = this.image;
    return data;
  }
}

class User {
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
  String iosMDeviceId;
  String androidNDeviceId;
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

  User(
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

  User.fromJson(Map<String, dynamic> json) {
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

class SharedBy {
  int id;
  int postId;
  int recipientId;
  String postText;
  String postLink;
  String postLinkTitle;
  String postLinkImage;
  String postLinkContent;
  String postVimeo;
  String postDailymotion;
  String postFacebook;
  String postFile;
  String postFileName;
  String postFileThumb;
  String postYoutube;
  String postVine;
  String postSoundCloud;
  String postPlaytube;
  String postMap;
  int postShare;
  String postPrivacy;
  String postType;
  String postFeeling;
  String postListening;
  String postWatching;
  String postPlaying;
  String postPhoto;
  String time;
  String registered;
  String albumName;
  String multiImage;
  int multiImagePost;
  int boosted;
  int productId;
  int classifiedId;
  int jobsId;
  int propertyId;
  int pollId;
  int blogId;
  int forumId;
  int threadId;
  int videoViews;
  String postRecord;
  String postSticker;
  int sharedFrom;
  String postUrl;
  int cache;
  int blur;
  int colorId;
  int jobId;
  int offerId;
  int fundRaiseId;
  int fundId;
  int active;
  String streamName;
  int ultimateVideos;
  int liveTime;
  int liveEnded;
  int agoraResourceId;
  String agoraSid;
  String type;
  int commentsCount;
  ColorPostTypes colored;
  int likesCount;

  int reactionCount;
  String reactionTypes;
  String youtube;
  String video;
  String image;
  List<Album> album;

  SharedBy(
      {this.id,
      this.postId,
      this.recipientId,
      this.postText,
      this.postLink,
      this.postLinkTitle,
      this.postLinkImage,
      this.postLinkContent,
      this.postVimeo,
      this.postDailymotion,
      this.postFacebook,
      this.postFile,
      this.postFileName,
      this.postFileThumb,
      this.postYoutube,
      this.postVine,
      this.postSoundCloud,
      this.postPlaytube,
      this.postMap,
      this.postShare,
      this.postPrivacy,
      this.postType,
      this.postFeeling,
      this.postListening,
      this.postWatching,
      this.postPlaying,
      this.postPhoto,
      this.time,
      this.registered,
      this.albumName,
      this.multiImage,
      this.multiImagePost,
      this.boosted,
      this.productId,
      this.classifiedId,
      this.jobsId,
      this.propertyId,
      this.pollId,
      this.blogId,
      this.forumId,
      this.threadId,
      this.videoViews,
      this.postRecord,
      this.postSticker,
      this.sharedFrom,
      this.postUrl,
      this.cache,
      this.blur,
      this.colorId,
      this.jobId,
      this.offerId,
      this.fundRaiseId,
      this.fundId,
      this.active,
      this.streamName,
      this.ultimateVideos,
      this.liveTime,
      this.liveEnded,
      this.agoraResourceId,
      this.agoraSid,
      this.type,
      this.commentsCount,
      this.colored,
      this.likesCount,
      this.reactionCount,
      this.reactionTypes,
      this.youtube,
      this.video,
      this.image});

  SharedBy.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    postId = json['post_id'];
    recipientId = json['recipient_id'];
    postText = json['postText'];
    postLink = json['postLink'] ?? "";
    postLinkTitle = json['postLinkTitle'];
    postLinkImage = json['postLinkImage'] ?? "";
    postLinkContent = json['postLinkContent'];
    postVimeo = json['postVimeo'];
    postDailymotion = json['postDailymotion'];
    postFacebook = json['postFacebook'];
    postFile = json['postFile'] ?? "";
    postFileName = json['postFileName'];
    postFileThumb = json['postFileThumb'];
    postYoutube = json['postYoutube'] ?? "";
    postVine = json['postVine'];
    postSoundCloud = json['postSoundCloud'];
    postPlaytube = json['postPlaytube'];
    postMap = json['postMap'];
    postShare = json['postShare'];
    postPrivacy = json['postPrivacy'];
    postType = json['postType'];
    postFeeling = json['postFeeling'];
    postListening = json['postListening'];
    postWatching = json['postWatching'];
    postPlaying = json['postPlaying'];
    postPhoto = json['postPhoto'];
    time = json['time'];
    registered = json['registered'];
    albumName = json['album_name'];
    multiImage = json['multi_image'];
    multiImagePost = json['multi_image_post'];
    boosted = json['boosted'];
    productId = json['product_id'];
    classifiedId = json['classified_id'];
    jobsId = json['jobs_id'];
    propertyId = json['property_id'];
    pollId = json['poll_id'];
    blogId = json['blog_id'];
    forumId = json['forum_id'];
    threadId = json['thread_id'];
    videoViews = json['videoViews'];
    postRecord = json['postRecord'];
    postSticker = json['postSticker'];
    sharedFrom = json['shared_from'];
    postUrl = json['post_url'];
    cache = json['cache'];
    blur = json['blur'];
    colorId = json['color_id'];
    jobId = json['job_id'];
    offerId = json['offer_id'];
    fundRaiseId = json['fund_raise_id'];
    fundId = json['fund_id'];
    active = json['active'];
    streamName = json['stream_name'];
    ultimateVideos = json['ultimate_videos'];
    liveTime = json['live_time'];
    liveEnded = json['live_ended'];
    agoraResourceId = json['agora_resource_id'];
    agoraSid = json['agora_sid'];
    type = json['type'];
    commentsCount = json['comments_count'];
    colored = json['colored'] != null
        ? ColorPostTypes.fromJson(json['colored'])
        : null;
    likesCount = json['likes_count'];

    reactionCount = json['reaction_count'];
    reactionTypes = json['reactionTypes'];
    youtube = json['youtube'];
    video = json['video'];
    image = json['image'];
    if (json['album'] != null) {
      album = <Album>[];
      json['album'].forEach((e) {
        album.add(Album.fromMap(e));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['post_id'] = this.postId;
    data['recipient_id'] = this.recipientId;
    data['postText'] = this.postText;
    data['postLink'] = this.postLink;
    data['postLinkTitle'] = this.postLinkTitle;
    data['postLinkImage'] = this.postLinkImage;
    data['postLinkContent'] = this.postLinkContent;
    data['postVimeo'] = this.postVimeo;
    data['postDailymotion'] = this.postDailymotion;
    data['postFacebook'] = this.postFacebook;
    data['postFile'] = this.postFile;
    data['postFileName'] = this.postFileName;
    data['postFileThumb'] = this.postFileThumb;
    data['postYoutube'] = this.postYoutube;
    data['postVine'] = this.postVine;
    data['postSoundCloud'] = this.postSoundCloud;
    data['postPlaytube'] = this.postPlaytube;
    data['postMap'] = this.postMap;
    data['postShare'] = this.postShare;
    data['postPrivacy'] = this.postPrivacy;
    data['postType'] = this.postType;
    data['postFeeling'] = this.postFeeling;
    data['postListening'] = this.postListening;
    data['postWatching'] = this.postWatching;
    data['postPlaying'] = this.postPlaying;
    data['postPhoto'] = this.postPhoto;
    data['time'] = this.time;
    data['registered'] = this.registered;
    data['album_name'] = this.albumName;
    data['multi_image'] = this.multiImage;
    data['multi_image_post'] = this.multiImagePost;
    data['boosted'] = this.boosted;
    data['product_id'] = this.productId;
    data['classified_id'] = this.classifiedId;
    data['jobs_id'] = this.jobsId;
    data['property_id'] = this.propertyId;
    data['poll_id'] = this.pollId;
    data['blog_id'] = this.blogId;
    data['forum_id'] = this.forumId;
    data['thread_id'] = this.threadId;
    data['videoViews'] = this.videoViews;
    data['postRecord'] = this.postRecord;
    data['postSticker'] = this.postSticker;
    data['shared_from'] = this.sharedFrom;
    data['post_url'] = this.postUrl;
    data['cache'] = this.cache;
    data['blur'] = this.blur;
    data['color_id'] = this.colorId;
    data['job_id'] = this.jobId;
    data['offer_id'] = this.offerId;
    data['fund_raise_id'] = this.fundRaiseId;
    data['fund_id'] = this.fundId;
    data['active'] = this.active;
    data['stream_name'] = this.streamName;
    data['ultimate_videos'] = this.ultimateVideos;
    data['live_time'] = this.liveTime;
    data['live_ended'] = this.liveEnded;
    data['agora_resource_id'] = this.agoraResourceId;
    data['agora_sid'] = this.agoraSid;
    data['type'] = this.type;
    data['comments_count'] = this.commentsCount;
    if (this.colored != null) {
      data['colored'] = this.colored.toJson();
    }
    data['likes_count'] = this.likesCount;

    data['reaction_count'] = this.reactionCount;
    data['reactionTypes'] = this.reactionTypes;
    data['youtube'] = this.youtube;
    data['video'] = this.video;
    data['image'] = this.image;
    if (this.album != null) {
      data['album'] = this.album.map((e) => e.toMap()).toList();
    }
    return data;
  }
}

class TimelinePostComments {
  int id;
  User user;
  int pageId;
  int postId;
  String text;
  String record;
  String cFile;
  String time;
  int reactionsCount;
  List<Reactions> reactions;
  List<Replies> replies;
  int repliesCount;
  File imageFile;

  TimelinePostComments({
    this.id,
    this.user,
    this.pageId,
    this.postId,
    this.text,
    this.record,
    this.cFile,
    this.time,
    this.reactionsCount,
    this.reactions,
    this.replies,
    this.repliesCount,
    this.imageFile,
  });

  TimelinePostComments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    pageId = json['page_id'];
    postId = json['post_id'];
    text = json['text'];
    record = json['record'];
    cFile = json['c_file'];
    time = json['time'];
    reactionsCount = json['reactions_count'];
    if (json['reactions'] != null) {
      reactions = <Reactions>[];
      json['reactions'].forEach((v) {
        reactions.add(new Reactions.fromJson(v));
      });
    }
    if (json['replies'] != null) {
      replies = <Replies>[];
      json['replies'].forEach((v) {
        replies.add(new Replies.fromJson(v));
      });
    }
    repliesCount = json['replies_count'];
    imageFile = json['imageFile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['page_id'] = this.pageId;
    data['post_id'] = this.postId;
    data['text'] = this.text;
    data['record'] = this.record;
    data['c_file'] = this.cFile;
    data['time'] = this.time;
    data['reactions_count'] = this.reactionsCount;
    if (this.reactions != null) {
      data['reactions'] = this.reactions.map((v) => v.toJson()).toList();
    }
    if (this.replies != null) {
      data['replies'] = this.replies.map((v) => v.toJson()).toList();
    }
    data['replies_count'] = this.repliesCount;
    data['imageFile'] = this.imageFile;
    return data;
  }
}

class Album {
  int id;
  int postId;
  int parentId;
  String imageURL;
  String thumbnail;
  Album({
    this.id,
    this.postId,
    this.parentId,
    this.imageURL,
    this.thumbnail,
  });

  Album copyWith({
    int id,
    int postId,
    int parentId,
    String imageURL,
    String thumbnail,
  }) {
    return Album(
      id: id ?? this.id,
      postId: postId ?? this.postId,
      parentId: parentId ?? this.parentId,
      imageURL: imageURL ?? this.imageURL,
      thumbnail: thumbnail ?? this.thumbnail,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'post_id': postId,
      'parent_id': parentId,
      'image': imageURL,
      'thumbnail': thumbnail,
    };
  }

  factory Album.fromMap(Map<String, dynamic> map) {
    return Album(
      id: map['id'],
      postId: map['post_id'],
      parentId: map['parent_id'],
      imageURL: map['image'],
      thumbnail: map['thumbnail'],
    );
  }
}

class Reactions {
  int postId;
  int commentId;
  int replayId;
  String reaction;
  User user;

  Reactions(
      {this.postId, this.commentId, this.replayId, this.reaction, this.user});

  Reactions.fromJson(Map<String, dynamic> json) {
    postId = json['post_id'];
    commentId = json['comment_id'];
    replayId = json['replay_id'];
    reaction = json['reaction'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['post_id'] = this.postId;
    data['comment_id'] = this.commentId;
    data['replay_id'] = this.replayId;
    data['reaction'] = this.reaction;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}

class Replies {
  int id;
  int commentId;
  User user;
  int pageId;
  String text;
  String cFile;
  String time;
  List<Reactions> reactions;
  int reactionsCount;

  Replies(
      {this.id,
      this.commentId,
      this.user,
      this.pageId,
      this.text,
      this.cFile,
      this.time,
      this.reactions,
      this.reactionsCount});

  Replies.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    commentId = json['comment_id'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    pageId = json['page_id'];
    text = json['text'];
    cFile = json['c_file'];
    time = json['time'];

    reactionsCount = json['reactions_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['comment_id'] = this.commentId;
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['page_id'] = this.pageId;
    data['text'] = this.text;
    data['c_file'] = this.cFile;
    data['time'] = this.time;

    data['reactions_count'] = this.reactionsCount;
    return data;
  }
}

class ReactionTypes {
  int id;
  String name;
  String wowonderIcon;
  String sunshineIcon;
  int status;

  ReactionTypes(
      {this.id, this.name, this.wowonderIcon, this.sunshineIcon, this.status});

  ReactionTypes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    wowonderIcon = json['wowonder_icon'];
    sunshineIcon = json['sunshine_icon'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['wowonder_icon'] = this.wowonderIcon;
    data['sunshine_icon'] = this.sunshineIcon;
    data['status'] = this.status;
    return data;
  }
}

class Options {
  int id;
  int postId;
  String text;
  int time;
  int percentage;
  List<Votes> votes;
  Options({
    this.id,
    this.postId,
    this.text,
    this.time,
    this.percentage,
    this.votes,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'post_id': postId,
      'text': text,
      'time': time,
      'percentage': percentage,
      'votes': votes?.map((x) => x.toMap())?.toList(),
    };
  }

  factory Options.fromMap(Map<String, dynamic> map) {
    return Options(
      id: map['id'],
      postId: map['post_id'],
      text: map['text'],
      time: map['time'],
      percentage: map['percentage'],
      votes: List<Votes>.from(map['votes']?.map((x) => Votes.fromMap(x))),
    );
  }
}

class Votes {
  int id;
  int userId;
  int postId;
  int optionId;
  Votes({
    this.id,
    this.userId,
    this.postId,
    this.optionId,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'user_id': userId,
      'post_id': postId,
      'option_id': optionId,
    };
  }

  factory Votes.fromMap(Map<String, dynamic> map) {
    return Votes(
      id: map['id'],
      userId: map['user_id'],
      postId: map['post_id'],
      optionId: map['option_id'],
    );
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
    return data;
  }
}
