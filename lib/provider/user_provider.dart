import 'dart:convert';
import 'dart:io';

// ignore: implementation_imports
import 'package:async/src/delegate/stream.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'package:youonline/helper/api_client.dart';
import 'package:youonline/model/all_pages.dart';
import 'package:youonline/model/follower.dart';
import 'package:youonline/model/following.dart';
import 'package:youonline/model/group.dart';
import 'package:youonline/model/group_data.dart';
import 'package:youonline/model/page_timeline.dart';
import 'package:youonline/model/profile_timelinedata.dart';
import 'package:youonline/model/search.dart';
import 'package:youonline/model/stories.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/model/user.dart';
import 'package:youonline/model/user_profile_data.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/widget_provider.dart';
import 'package:youonline/route/group_detail_screen.dart';
import 'package:youonline/route/login_screen.dart';
import 'package:youonline/route/main_screen.dart';
import 'package:youonline/route/single_page_screen.dart';
import 'package:youonline/route/verify_otp_screen.dart';
import 'package:youonline/utils/prefs.dart';
import 'package:youonline/utils/styles.dart';

class UserProvider with ChangeNotifier {
  //AUTHENTICATE USER WHICH IS PROVIDED BY THE ADMIN PANEL
  Future<String> authenticateUser() async {
    String authenticationUserToken;
    Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().authenticateRequest);
    await http
        .post(
      uri,
      headers: <String, String>{
        "Accept": "application/json",
      },
      body: ApiNetwork.authenticateUserBody(),
    )
        .then((value) async {
      var response = json.decode(value.body);
      if (response != null) {
        authenticationUserToken = response['access_token'];
      }
    });
    print(authenticationUserToken);
    return authenticationUserToken;
  }

  Future signUp({
    @required String firstName,
    @required String lastName,
    @required String email,
    @required String password,
    @required String confirmPassword,
    @required String gender,
    @required String termsAgreementStatus,
    @required BuildContext context,
  }) async {
    BotToast.showLoading();
    Map body = {
      "firstname": firstName,
      "lastname": lastName,
      "email": email,
      "gender": gender,
      "terms": termsAgreementStatus,
      "password": password,
      "password_confirmation": password,
      "src": "Phone",
    };
    print(body);

    String token = await authenticateUser();
    if (token != null) {
      Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().createAccountURL);
      await http
          .post(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        },
        body: body,
      )
          .catchError((err) {
        print(err);
      }).then((value) {
        var response = jsonDecode(value.body);
        print(response);
        if (response['message'].toString().toLowerCase().contains("invalid")) {
          BotToast.closeAllLoading();
          BotToast.showText(
            text: 'The given data is invalid.',
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.red,
            ),
            contentColor: Colors.white,
          );
        } else {
          BotToast.closeAllLoading();
          setUserToken(response['user_auth_token']);
          changeUserAuthenticationToken(response['user_auth_token']);
          getUserData(context: context);
          BotToast.showText(
            text: 'Your has been successfully created.',
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
            contentColor: Colors.white,
          );
        }
      });
    } else {
      BotToast.closeAllLoading();
      BotToast.showText(
        text: 'Something went wrong.',
        textStyle: labelTextStyle.copyWith(
          fontSize: 12,
          color: Colors.white,
        ),
        contentColor: Colors.red,
      );
    }
  }

  String userAuthenticationToken;
  changeUserAuthenticationToken(String token) {
    userAuthenticationToken = token;
    notifyListeners();
  }

  Future requestResetPassword(String email, BuildContext context) async {
    BotToast.showLoading();
    String token = await authenticateUser();
    if (token != null) {
      Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().requestEmail);
      await http.post(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: {
          "email": email,
        },
      ).then((value) {
        var response = json.decode(value.body);
        if (response['success']) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => PinVerificationScreen(),
            ),
          );
        }
      });
    }
  }

  Future signIn({
    @required String email,
    @required String password,
    @required BuildContext context,
  }) async {
    BotToast.showLoading();
    String token = await authenticateUser();
    userAuthenticationToken = "";
    if (token != null) {
      Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().loginURL);
      await http.post(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $token",
        },
        body: {
          "email": email,
          "password": password,
        },
      ).then((value) async {
        var response = json.decode(value.body);
        if (response != null) {
          if (response['message']
              .toString()
              .toLowerCase()
              .contains("invalid")) {
            BotToast.closeAllLoading();
            BotToast.showText(
              text: 'Email/Password is invalid.',
              textStyle: labelTextStyle.copyWith(
                fontSize: 12,
                color: Colors.white,
              ),
              contentColor: Colors.red,
            );
          } else if (response['success'] != null) {
            if (response['success']) {
              setUserToken(response['user_auth_token']);
              userAuthenticationToken = response['user_auth_token'];
              notifyListeners();
              await getUserData(
                context: context,
              );
              // await getUserGroups();
              BotToast.closeAllLoading();
              Provider.of<TimelineProvider>(context, listen: false)
                  .changeTimelineData([]);
              Provider.of<WidgetProvider>(context, listen: false)
                  .changeReaction(null);
              Provider.of<WidgetProvider>(context, listen: false)
                  .changePageNo(1);
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (_) => MainScreen(),
                ),
                (route) => false,
              );
            } else {
              BotToast.closeAllLoading();
              BotToast.showText(
                text: 'Something went wrong.',
                textStyle: labelTextStyle.copyWith(
                  fontSize: 12,
                  color: Colors.white,
                ),
                contentColor: Colors.red,
              );
            }
          }
        } else {
          BotToast.closeAllLoading();
          BotToast.showText(
            text: 'Something went wrong.',
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.white,
            ),
            contentColor: Colors.red,
          );
        }
      });
    } else {
      BotToast.closeAllLoading();
      BotToast.showText(
        text: 'Something went wrong.',
        textStyle: labelTextStyle.copyWith(
          fontSize: 12,
          color: Colors.white,
        ),
        contentColor: Colors.red,
      );
    }
  }

  AppUser user;
  UserTimelineData userTimelineData;

  Future<UserTimelineData> getUserPosts({
    @required String pageNo,
    @required BuildContext context,
    @required String userID,
  }) async {
    if (userAuthenticationToken != null) {
      Uri uri = Uri.parse(ApiNetwork.BASE_URL +
          ApiNetwork().getUserPosts +
          userID +
          "page=$pageNo");
      await http.get(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken",
        },
      ).catchError(
        (err) {
          print(err);
        },
      ).then((value) {
        var response = json.decode(value.body);
        userTimelineData = UserTimelineData.fromJson(response);
        print(userTimelineData);
      });
    }
    return userTimelineData;
  }

  Future getUserData({
    @required BuildContext context,
    bool isUpdated = false,
  }) async {
    bool isError = false;
    Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().getUserData);
    await http.get(
      uri,
      headers: <String, String>{
        "Accept": "application/json",
        "Authorization": "Bearer $userAuthenticationToken",
      },
    ).catchError((err) {
      isError = true;
      print(err);
    }).then(
      (value) async {
        if (!isError) {
          try {
            var response = jsonDecode(value.body);
            if (!response['message']
                .toString()
                .toLowerCase()
                .contains("unauth")) {
              if (response != null) {
                user = AppUser.fromJson(response['user']);
                notifyListeners();
                print(user);

                if (!isUpdated) {
                  await Provider.of<UserProvider>(context, listen: false)
                      .getAllUserStories();
                  await Provider.of<TimelineProvider>(context, listen: false)
                      .getTimeLinePosts(
                    context: context,
                    pageNo: 1,
                  );
                  Future.delayed(Duration(seconds: 1), () {
                    Provider.of<WidgetProvider>(context, listen: false)
                        .changeReaction(null);
                    Provider.of<WidgetProvider>(context, listen: false)
                        .changePageNo(1);
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (_) => MainScreen(),
                      ),
                      (route) => false,
                    );
                  });
                }
              }
            } else {
              if (!isUpdated) {
                Future.delayed(Duration(seconds: 1), () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (_) => LoginScreen(),
                    ),
                    (route) => false,
                  );
                });
              }
            }
          } catch (e) {
            throw e;
          }
        }
      },
    );
  }

  ProfileTimelineData timelineUserProfile;
  changeTimelineUserProfile(ProfileTimelineData _timelineUserProfile) {
    timelineUserProfile = _timelineUserProfile;
    notifyListeners();
  }

  Future getTimelineUserProfile({
    @required String userId,
  }) async {
    bool isError = false;
    Uri uri = Uri.parse(ApiNetwork.BASE_URL + "api/profile?id=$userId");
    await http.get(
      uri,
      headers: <String, String>{
        "Accept": "application/json",
        "Authorization": "Bearer $userAuthenticationToken",
      },
    ).catchError((err) {
      isError = true;
      print(err);
    }).then(
      (value) async {
        if (!isError) {
          try {
            var response = jsonDecode(value.body);
            if (!response['message']
                .toString()
                .toLowerCase()
                .contains("unauth")) {
              if (response != null) {
                try {
                  timelineUserProfile = ProfileTimelineData.fromJson(response);
                  print(timelineUserProfile);
                  changeTimelineUserProfile(timelineUserProfile);
                } catch (e) {
                  throw e;
                }
              }
            } else {}
          } catch (e) {
            throw e;
          }
        }
      },
    );
  }

  Future createUserStory({
    @required BuildContext context,
    @required String description,
    @required List<File> imageFile,
  }) async {
    var uri = Uri.parse(
      ApiNetwork.BASE_URL + ApiNetwork().createStory,
    );

    var request = new http.MultipartRequest("POST", uri);

    String authenticationToken =
        Provider.of<UserProvider>(context, listen: false)
            .userAuthenticationToken;
    int i = -1;
    BotToast.showLoading();
    if (imageFile != null && imageFile.length > 0) {
      for (var file in imageFile) {
        String fileName = file.path.split("/").last;
        var stream =
            new http.ByteStream(DelegatingStream.typed(file.openRead()));
        i = i + 1;
        var length = await file.length();
        print("File lenght - $length");
        print("fileName - $fileName");
        var multipartFileSign =
            new http.MultipartFile('image', stream, length, filename: fileName);

        print(multipartFileSign);

        request.files.add(multipartFileSign);
      }
      request.fields['description'] = description;
    } else {
      request.fields['description'] = description;
    }

    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $authenticationToken"
    };
    request.headers.addAll(headers);

    var response = await request.send();

    print(response.statusCode);

    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Item form is statuscode 200");
      print(res.body);
      var responseDecode = json.decode(res.body);

      Provider.of<TimelineProvider>(context, listen: false)
          .changeTimelineData([]);
      await getAllUserStories();
      BotToast.showText(
        text: "User Story Created",
        textStyle: labelTextStyle.copyWith(
          fontSize: 12,
          color: Colors.black,
        ),
        contentColor: Colors.white,
      );
      BotToast.closeAllLoading();
      Provider.of<WidgetProvider>(context, listen: false).changeReaction(null);
      Provider.of<WidgetProvider>(context, listen: false).changePageNo(1);
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => MainScreen(),
          ),
          (route) => false);

      if (responseDecode['status'] == true) {
        return res.body;
      } else {
        return res.body;
      }
    } else {
      BotToast.closeAllLoading();
      BotToast.showText(
        text: "Something went wrong",
        textStyle: labelTextStyle.copyWith(
          fontSize: 12,
          color: Colors.white,
        ),
        contentColor: Colors.red,
      );
    }
  }

  AllGroups userGroups;
  changeGroupData(AllGroups _userGroup) {
    userGroups = _userGroup;
    notifyListeners();
  }

  Future<AllGroups> getUserGroups() async {
    if (userAuthenticationToken != null) {
      Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().getUserGroups);
      await http.get(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken"
        },
      ).catchError((err) {
        print(err);
      }).then((value) {
        try {
          var response = json.decode(value.body);
          userGroups = AllGroups.fromJson(response);
          changeGroupData(userGroups);
        } catch (exception) {
          print(exception);
          throw exception;
        }
      });
    }
    return userGroups;
  }

  Future<SingleGroupData> singleGroupData({
    @required String groupId,
  }) async {
    SingleGroupData singleGroupData;
    if (userAuthenticationToken != null) {
      Uri uri = Uri.parse(
          ApiNetwork.BASE_URL + ApiNetwork().getSingleGroup + groupId);
      await http.get(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken"
        },
      ).catchError((err) {
        print(err);
      }).then((value) {
        try {
          var response = json.decode(value.body);
          print(response);
          singleGroupData = SingleGroupData.fromJson(response);
          print(singleGroupData);
        } catch (ex) {
          print(ex);
          throw ex;
        }
      });
    }
    return singleGroupData;
  }

  Future joinGroup(
      {@required BuildContext context,
      @required String groupId,
      @required String groupName,
      @required String groupAvatar,
      @required String groupCover,
      @required String groupInfo}) async {
    if (userAuthenticationToken != null) {
      BotToast.showLoading();

      Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().joinGroup);

      await http.post(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken"
        },
        body: {
          "group_id": groupId,
        },
      ).catchError((err) {
        print(err);
      }).then((value) async {
        var response = json.decode(value.body);
        if (response['success']) {
          await getUserGroups();
          BotToast.closeAllLoading();

          BotToast.showText(
            text: "You have successfully joined $groupName",
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
            contentColor: Colors.white,
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => GroupDetailScreen(
                groupTitle: groupName,
                groupAvatar: groupAvatar,
                groupCoverPhoto: groupCover,
                groupInfo: groupInfo,
                groupId: int.tryParse(groupId),
              ),
            ),
          );
        } else {
          BotToast.closeAllLoading();
          BotToast.showText(
            text: "You have no permission to join $groupName",
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
            contentColor: Colors.white,
          );
        }
      });
    }
  }

  AllPages allPages;
  changeAllPages(AllPages _allPages) {
    allPages = _allPages;
    notifyListeners();
  }

  Future getUserPages() async {
    if (userAuthenticationToken != null) {
      Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().getUserPages);
      await http.get(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken"
        },
      ).catchError((err) {
        print(err);
      }).then((value) {
        var response = json.decode(value.body);
        try {
          allPages = AllPages.fromJson(response);
          changeAllPages(allPages);
        } catch (ex) {
          print(ex);
          throw ex;
        }
      });
    }
    return allPages;
  }

  Future<SinglePageTimeline> getSinglePageData({
    @required String pageID,
  }) async {
    SinglePageTimeline singlePageTimeline;
    if (userAuthenticationToken != null) {
      Uri uri =
          Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().getSinglePage + pageID);
      await http.get(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken"
        },
      ).catchError((err) {
        print(err);
      }).then((value) {
        try {
          var response = json.decode(value.body);
          print(response);

          try {
            singlePageTimeline = SinglePageTimeline.fromJson(response);
            print(singlePageTimeline);
          } catch (ex) {
            print(ex);
            throw ex;
          }
        } catch (ex) {
          print(ex);
          throw ex;
        }
      });
    }
    return singlePageTimeline;
  }

  Future unjoinGroup({
    @required String groupId,
  }) async {
    if (userAuthenticationToken != null) {
      Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().unjoinGroup);
      await http.post(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken"
        },
        body: {
          "group_id": groupId,
        },
      ).catchError((err) {
        print(err);
      }).then((value) {
        var response = json.decode(value.body);
        print(response);
      });
    }
  }

  FollowersData followerData;
  changeFollowersData(FollowersData _followersData) {
    followerData = _followersData;
    notifyListeners();
  }

  Future<FollowersData> getFollowersList({
    @required String userId,
  }) async {
    if (userAuthenticationToken != null) {
      Uri uri = Uri.parse(
          ApiNetwork.BASE_URL + ApiNetwork().getUserFollowers + userId);
      await http.get(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken"
        },
      ).catchError((err) {
        print(err);
      }).then((value) {
        var response = json.decode(value.body);
        try {
          followerData = FollowersData.fromJson(response);
          changeFollowersData(followerData);
        } catch (ex) {
          print(ex);
          throw ex;
        }
      });
    }
    return followerData;
  }

  FollowingData followingData;
  changeFollowingData(FollowingData _followingData) {
    followingData = _followingData;
    notifyListeners();
  }

  Future<FollowingData> getFollowingList({
    @required String userId,
  }) async {
    if (userAuthenticationToken != null) {
      Uri uri = Uri.parse(
          ApiNetwork.BASE_URL + ApiNetwork().getUserFollowings + userId);
      await http.get(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken"
        },
      ).catchError((err) {
        print(err);
      }).then((value) {
        var response = json.decode(value.body);
        try {
          followingData = FollowingData.fromJson(response);
          changeFollowingData(followingData);
        } catch (ex) {
          print(ex);
          throw ex;
        }
      });
    }
    return followingData;
  }

  Future followUser(
    BuildContext context, {
    @required String userId,
  }) async {
    if (userAuthenticationToken != null) {
      BotToast.showLoading();
      Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().followUser);
      await http.post(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken",
        },
        body: {
          "user_id": userId,
        },
      ).catchError((err) {
        print(err);
      }).then((value) async {
        var response = json.decode(value.body);
        print(response);
        if (response["success"]) {
          BotToast.closeAllLoading();
          BotToast.showText(
            text: "User successfully followed.",
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
            contentColor: Colors.white,
          );
          Provider.of<TimelineProvider>(context, listen: false)
              .changeTimelineData([]);
          Provider.of<WidgetProvider>(context, listen: false)
              .changeReaction(null);
          Provider.of<WidgetProvider>(context, listen: false).changePageNo(1);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => MainScreen(),
            ),
            (route) => false,
          );
        } else {
          BotToast.showText(
            text: "Something went wrong",
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
            contentColor: Colors.white,
          );
          BotToast.closeAllLoading();
        }
      });
    }
  }

  Future unfollowUser(
    BuildContext context, {
    @required String userId,
  }) async {
    if (userAuthenticationToken != null) {
      BotToast.showLoading();
      Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().unFollowUser);
      await http.post(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken",
        },
        body: {
          "user_id": userId,
        },
      ).catchError((err) {
        print(err);
      }).then((value) async {
        var response = json.decode(value.body);
        if (response["message"].toString().toLowerCase().contains("unfollow")) {
          BotToast.closeAllLoading();
          BotToast.showText(
            text: "User successfully unfollowed.",
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
            contentColor: Colors.white,
          );
          Provider.of<TimelineProvider>(context, listen: false)
              .changeTimelineData([]);
          Provider.of<WidgetProvider>(context, listen: false)
              .changeReaction(null);
          Provider.of<WidgetProvider>(context, listen: false).changePageNo(1);
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (_) => MainScreen(),
            ),
            (route) => false,
          );
        } else {
          BotToast.showText(
            text: "Something went wrong",
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
            contentColor: Colors.white,
          );
          BotToast.closeAllLoading();
        }
      });
    }
  }

  Future<Timeline> getPhotoPosts({
    @required String userId,
  }) async {
    Timeline _timeline;
    if (userAuthenticationToken != null) {
      Uri uri = Uri.parse(
          ApiNetwork.BASE_URL + ApiNetwork().getUserImagesPosts + userId);
      await http.get(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken",
        },
      ).catchError((err) {
        print(err);
      }).then((value) {
        var response = json.decode(value.body);
        _timeline = Timeline.fromJson(response);
      });
    }
    return _timeline;
  }

  Future<Timeline> getVideoPosts({
    @required String userId,
  }) async {
    Timeline _timeline;
    if (userAuthenticationToken != null) {
      Uri uri = Uri.parse(
          ApiNetwork.BASE_URL + ApiNetwork().getUserVideoPosts + userId);
      await http.get(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken",
        },
      ).catchError((err) {
        print(err);
      }).then((value) {
        var response = json.decode(value.body);
        _timeline = Timeline.fromJson(response);
      });
    }
    return _timeline;
  }

  Future<void> updateUserProfile({
    @required List<File> profilePicture,
    @required List<File> coverImage,
    @required String firstName,
    @required String lastName,
    @required String about,
    @required String location,
    @required String school,
    @required String working,
    @required String workLink,
    @required String website,
    @required String birthday,
    @required String gender,
    @required BuildContext context,
  }) async {
    var uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().updateUserProfile);

    var request = new http.MultipartRequest("POST", uri);

    BotToast.showLoading();
    if (profilePicture != null && profilePicture.length != 0) {
      for (var file in profilePicture) {
        String fileName = file.path.split("/").last;
        var stream =
            new http.ByteStream(DelegatingStream.typed(file.openRead()));
        var length = await file.length();
        var multipartFileSign = new http.MultipartFile('avatar', stream, length,
            filename: fileName);

        request.files.add(multipartFileSign);
      }
    }
    if (coverImage != null && coverImage.length != 0) {
      for (var file in coverImage) {
        String fileName = file.path.split("/").last;
        var stream =
            new http.ByteStream(DelegatingStream.typed(file.openRead()));
        var length = await file.length();
        var multipartFileSign =
            new http.MultipartFile('cover', stream, length, filename: fileName);

        request.files.add(multipartFileSign);
      }
    }

    if (firstName.isNotEmpty) request.fields['first_name'] = firstName;
    if (lastName.isNotEmpty) request.fields['last_name'] = lastName;
    if (about.isNotEmpty) request.fields['about'] = about;
    if (location.isNotEmpty) request.fields['address'] = location;
    if (school.isNotEmpty) request.fields['school'] = school;
    if (working.isNotEmpty) request.fields['working'] = working;
    if (workLink.isNotEmpty) request.fields['working_link'] = workLink;
    if (website.isNotEmpty) request.fields['website'] = website;
    if (gender.isNotEmpty) request.fields['gender'] = gender;

    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer $userAuthenticationToken"
    };
    request.headers.addAll(headers);

    var response = await request.send();

    print(response.statusCode);

    var res = await http.Response.fromStream(response);
    if (response.statusCode == 200 || response.statusCode == 201) {
      await getUserData(
        context: context,
        isUpdated: true,
      );
      BotToast.closeAllLoading();
      BotToast.showText(
        text: "Profile successfully updated!",
        textStyle: labelTextStyle.copyWith(
          fontSize: 12,
          color: Colors.black,
        ),
        contentColor: Colors.white,
      );
      Provider.of<WidgetProvider>(context, listen: false).changeReaction(null);
      Provider.of<WidgetProvider>(context, listen: false).changePageNo(1);
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (_) => MainScreen(),
        ),
        (route) => false,
      );
      var responseDecode = json.decode(res.body);

      if (responseDecode['status']) {
        BotToast.closeAllLoading();
        return res.body;
      } else {
        BotToast.closeAllLoading();
        return res.body;
      }
    } else {
      BotToast.closeAllLoading();
    }
  }

  Future unfollowPage(BuildContext context, {@required String pageId}) async {
    if (userAuthenticationToken != null) {
      BotToast.showLoading();
      Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().unfollowPage);
      await http.post(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken",
        },
        body: {
          "page_id": pageId,
        },
      ).catchError((err) {
        print(err);
      }).then((value) async {
        var response = json.decode(value.body);
        if (response['message'].toString().contains("unfollowed")) {
          await getUserPages();
          BotToast.closeAllLoading();
          BotToast.showText(
            text: "Page Unfollowed!!",
            contentColor: Colors.white,
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          );
        } else {
          BotToast.closeAllLoading();
          BotToast.showText(
            text: "Authorization required! Contact customer service center",
            contentColor: Colors.white,
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          );
        }
      });
    }
  }

  Future followPage(BuildContext context,
      {@required String pageId,
      @required String pageName,
      bool pageScreen = false}) async {
    if (userAuthenticationToken != null) {
      BotToast.showLoading();
      Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().followPage);
      await http.post(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken",
        },
        body: {
          "page_id": pageId,
        },
      ).catchError((err) {
        print(err);
      }).then((value) async {
        var response = json.decode(value.body);
        if (response['message'].toString().contains("follow")) {
          await getUserPages();
          BotToast.closeAllLoading();
          if (!pageScreen) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => SinglePageScreen(
                  pageId: pageId,
                  pageName: pageName,
                ),
              ),
            );
          }
        } else {
          BotToast.closeAllLoading();
          BotToast.showText(
            text: "Authorization required! Contact customer service center",
            contentColor: Colors.white,
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          );
        }
      });
    }
  }

  SearchModel searchModel;
  changeSearchModel(SearchModel _searchModel) {
    searchModel = _searchModel;
  }

  Future<void> search({@required String keyword}) async {
    if (userAuthenticationToken != null) {
      BotToast.showLoading();
      Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().searchURL);
      await http.post(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken",
        },
        body: {
          "q": keyword,
        },
      ).catchError((err) {
        print(err);
        BotToast.closeAllLoading();
      }).then((value) {
        var response = json.decode(value.body);
        try {
          searchModel = SearchModel.fromJson(response);
          changeSearchModel(searchModel);
          BotToast.closeAllLoading();
        } catch (ex) {
          BotToast.closeAllLoading();

          print(ex);
          throw ex;
        }
      });
    }
  }

  StoryModel storyModel;
  changeStoryModel(StoryModel _storyModel) {
    storyModel = _storyModel;
    notifyListeners();
  }

  Future<StoryModel> getAllUserStories() async {
    if (userAuthenticationToken != null) {
      Uri uri = Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().getAllStories);
      await http.get(
        uri,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken",
        },
      ).catchError((err) {
        print(err);
      }).then((value) {
        var response = json.decode(value.body);
        storyModel = StoryModel.fromJson(response);
        changeStoryModel(storyModel);
      });
    }
    return storyModel;
  }
}
