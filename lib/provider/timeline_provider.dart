import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youonline/helper/api_client.dart';
import 'package:youonline/model/postComments.dart';
import 'package:youonline/model/timeline_data.dart';

import 'package:youonline/provider/user_provider.dart';
import 'package:http/http.dart' as http;

class TimelineProvider with ChangeNotifier {
  List<TimelineData> timelineData = [];
  changeTimelineData(List<TimelineData> _timelineData) {
    timelineData = _timelineData;
    notifyListeners();
  }

  Future getTimeLinePosts({
    @required BuildContext context,
    @required int pageNo,
  }) async {
    bool _isError = false;
    String userAuthenticationToken =
        Provider.of<UserProvider>(context, listen: false)
            .userAuthenticationToken;

    if (userAuthenticationToken != null) {
      await http.get(
        ApiNetwork.BASE_URL + ApiNetwork().getTimeline + pageNo.toString(),
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken",
        },
      ).catchError((err) {
        _isError = true;
        print(err.toString());
      }).then((value) {
        if (!_isError) {
          var response = jsonDecode(value.body);
          if (response['success'] != null) {
            if (timelineData.length < response['posts']['count']) {
              response['posts']['data'].forEach((element) {
                try {
                  TimelineData post = TimelineData.fromJson(element);
                  if (!timelineData.contains(post)) {
                    timelineData.add(post);
                  }
                  changeTimelineData(timelineData);
                } catch (ex) {
                  print(ex);
                  throw ex;
                }
              });
            }
          }
        }
      });
      return timelineData;
    }
  }

  Future<AllComments> getPostComments({
    @required BuildContext context,
    @required String postID,
  }) async {
    bool isError = false;
    String userAuthenticationToken =
        Provider.of<UserProvider>(context, listen: false)
            .userAuthenticationToken;
    AllComments allComments;
    if (userAuthenticationToken != null) {
      await http.get(
        ApiNetwork.BASE_URL + ApiNetwork().getComments + postID,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken",
        },
      ).catchError((err) {
        isError = true;
      }).then(
        (value) {
          if (!isError) {
            var response = jsonDecode(value.body);
            allComments = AllComments.fromJson(response);
          }
        },
      );
    }

    return allComments;
  }

  Future addComment({
    @required BuildContext context,
    @required String comment,
    @required String postID,
    @required String userID,
  }) async {
    bool isError = false;
    String userAuthenticationToken =
        Provider.of<UserProvider>(context, listen: false)
            .userAuthenticationToken;
    var body = {
      "post_id": postID,
      "user_id": userID,
      "text": comment,
    };
    if (userAuthenticationToken != null) {
      await http
          .post(
        ApiNetwork.BASE_URL + ApiNetwork().addComment,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken",
        },
        body: body,
      )
          .catchError((err) {
        isError = true;
        print(err);
      }).then(
        (value) {
          if (!isError) {
            var response = jsonDecode(value.body);
            print(response);
          }
        },
      );
    }
  }

  Future addCommentReply(
    BuildContext context, {
    @required String commentID,
    @required String text,
  }) async {
    String userAuthenticationToken =
        Provider.of<UserProvider>(context, listen: false)
            .userAuthenticationToken;

    if (commentID != null && text != null) {
      await http.post(ApiNetwork.BASE_URL + ApiNetwork().addReplyComment,
          headers: <String, String>{
            "Accept": "application/json",
            "Authorization": "Bearer $userAuthenticationToken",
          },
          body: {
            "comment_id": commentID,
            "text": text,
          }).catchError(
        (err) {
          print(err.toString());
        },
      ).then((value) {
        var response = jsonDecode(value.body);
        print(response);
      });
    }
  }

  Future likeComment({
    @required BuildContext context,
    @required String postID,
    @required String commentID,
    @required String reaction,
  }) async {
    String userAuthenticationToken =
        Provider.of<UserProvider>(context, listen: false)
            .userAuthenticationToken;
    if (userAuthenticationToken != null) {
      await http.post(ApiNetwork.BASE_URL + ApiNetwork().commentLike,
          headers: <String, String>{
            "Accept": "application/json",
            "Authorization": "Bearer $userAuthenticationToken",
          },
          body: {
            "post_id": postID,
            "comment_id": commentID,
            "reaction": reaction,
          }).catchError((err) {
        print(err);
      }).then((value) {
        var response = jsonDecode(value.body);
        print(response);
      });
    }
  }

  Future sharePost(
    BuildContext context, {
    @required String type,
    @required String postID,
    @required String text,
    String typeID,
  }) async {
    Map body = {};
    if (type != null && type.isNotEmpty) {
      body = {
        "type": type,
        "type_id": typeID,
        "post_id": postID,
        "text": text,
      };
    } else {
      body = {
        "type": type,
        "post_id": postID,
        "text": text,
      };
    }
    if (body != null) {
      print(body);
      String userAuthenticationToken =
          Provider.of<UserProvider>(context, listen: false)
              .userAuthenticationToken;
      await http
          .post(
        ApiNetwork.BASE_URL + ApiNetwork().sharePost,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken",
        },
        body: body,
      )
          .catchError(
        (err) {
          print(err.toString());
        },
      ).then((value) {
        var response = jsonDecode(value.body);
        BotToast.closeAllLoading();
        print(response);
      });
    }
  }

  Future likePost(
    BuildContext context, {
    @required String postID,
    @required String reaction,
  }) async {
    String userAuthenticationToken =
        Provider.of<UserProvider>(context, listen: false)
            .userAuthenticationToken;

    await http.post(
      ApiNetwork.BASE_URL + ApiNetwork().likePost,
      headers: <String, String>{
        "Accept": "application/json",
        "Authorization": "Bearer $userAuthenticationToken",
      },
      body: {
        "post_id": postID,
        "reaction": reaction,
      },
    ).catchError((err) {
      print(err.toString());
    }).then((value) {
      var response = jsonDecode(value.body);
      print(response);
    });
  }

  
}
