import 'dart:convert';

import 'package:bot_toast/bot_toast.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:youonline/helper/api_client.dart';
import 'package:youonline/model/colors.dart';
import 'package:youonline/model/gifs.dart';
import 'package:youonline/model/timeline_data.dart';
import 'package:youonline/provider/timeline_provider.dart';
import 'package:youonline/provider/user_provider.dart';
import 'package:http/http.dart' as http;
import 'package:youonline/route/main_screen.dart';
import 'package:youonline/utils/styles.dart';

class PostProvider with ChangeNotifier {
  PostColors postColors;
  String feelings;
  String gifURL;
  changeFeelings(String _feelings) {
    feelings = _feelings;
    notifyListeners();
  }

  changeGIFurl(String _url) {
    gifURL = _url;
    notifyListeners();
  }

  Future getPostColors({
    @required BuildContext context,
  }) async {
    var _userProvider = Provider.of<UserProvider>(context, listen: false);
    if (_userProvider.userAuthenticationToken != null) {
      await http.get(
        ApiNetwork.BASE_URL + ApiNetwork().getColors,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer ${_userProvider.userAuthenticationToken}",
        },
      ).then((value) {
        var response = jsonDecode(value.body);
        postColors = PostColors.fromJson(response);
        notifyListeners();
      });
    }
  }

  Future createPost({
    @required String postText,
    @required String postColorID,
    @required BuildContext context,
    @required String feeling,
  }) async {
    var _userAuthToken = Provider.of<UserProvider>(context, listen: false)
        .userAuthenticationToken;
    var _timelineProvider =
        Provider.of<TimelineProvider>(context, listen: false);
    Map body;
    if (postColorID != null && !postColorID.contains("null")) {
      if (feeling != null)
        body = {
          "postText": postText,
          "post_color": postColorID,
          "feeling_type": "feelings",
          "feeling": feelings,
        };
      else {
        body = {
          "postText": postText,
          "post_color": postColorID,
        };
      }
    } else {
      if (feeling != null) {
        body = {
          "feeling_type": "feelings",
          "feeling": feelings,
          "postText": postText,
        };
      } else {
        body = {
          "postText": postText,
        };
      }
    }
    print(body);
    if (_userAuthToken != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => MainScreen(
              isMainScreen: false,
            ),
          ),
          (route) => false);
      await http
          .post(
        ApiNetwork.BASE_URL + ApiNetwork().createPost,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $_userAuthToken",
        },
        body: body,
      )
          .then((value) {
        var response = jsonDecode(value.body);
        print(response);

        if (response['success'] != null && response['success']) {
          TimelineData post = TimelineData.fromJson(response['post']);
          _timelineProvider.timelineData.insert(0, post);
          _timelineProvider.changeTimelineData(_timelineProvider.timelineData);
          print(_timelineProvider.timelineData);

          BotToast.showText(
            text: "Post successfully created.",
            contentColor: Colors.white,
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          );
        } else {
          BotToast.showText(
            text: "Server Error.",
            contentColor: Colors.red,
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.white,
            ),
          );
        }
      });
    }
  }

  Future createFeelingsWithPosts({
    @required String postText,
    @required String postColorID,
    @required BuildContext context,
    @required String feelings,
  }) async {
    var _userAuthToken = Provider.of<UserProvider>(context, listen: false)
        .userAuthenticationToken;
    var _timelineProvider =
        Provider.of<TimelineProvider>(context, listen: false);
    Map body;
    if (postColorID != null) {
      body = {
        "postText": postText,
        "post_color": postColorID,
        "feeling_type": "feelings",
        "feeling": feelings,
      };
    } else {
      body = {
        "postText": postText,
        "feeling_type": "feelings",
        "feeling": feelings,
      };
    }
    if (_userAuthToken != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => MainScreen(
              isMainScreen: false,
            ),
          ),
          (route) => false);
      await http
          .post(
        ApiNetwork.BASE_URL + ApiNetwork().createPost,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $_userAuthToken",
        },
        body: body,
      )
          .then((value) {
        var response = jsonDecode(value.body);
        print(response);
        if (response['success'] != null && response['success']) {
          TimelineData post = TimelineData.fromJson(response['post']);
          _timelineProvider.timelineData.insert(0, post);
          _timelineProvider.changeTimelineData(_timelineProvider.timelineData);

          BotToast.showText(
            text: "Post successfully created.",
            contentColor: Colors.white,
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          );
        } else {
          BotToast.showText(
            text: "Server Error.",
            contentColor: Colors.red,
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.white,
            ),
          );
        }
      });
    }
  }

  Future createGIFPost({
    @required String postText,
    @required BuildContext context,
    @required String gifURL,
  }) async {
    var _userAuthToken = Provider.of<UserProvider>(context, listen: false)
        .userAuthenticationToken;
    var _timelineProvider =
        Provider.of<TimelineProvider>(context, listen: false);
    if (_userAuthToken != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => MainScreen(
              isMainScreen: false,
            ),
          ),
          (route) => false);
      await http.post(
        ApiNetwork.BASE_URL + ApiNetwork().createPost,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $_userAuthToken",
        },
        body: {
          "postText": postText,
          "postSticker": gifURL,
        },
      ).catchError((err) {
        print(err);
      }).then((value) {
        var response = jsonDecode(value.body);
        print(response);
        if (response['success'] != null && response['success']) {
          TimelineData post = TimelineData.fromJson(response['post']);
          _timelineProvider.timelineData.insert(0, post);
          _timelineProvider.changeTimelineData(_timelineProvider.timelineData);

          BotToast.showText(
            text: "Post successfully created.",
            contentColor: Colors.white,
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          );
        } else {
          BotToast.showText(
            text: "Server Error.",
            contentColor: Colors.red,
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.white,
            ),
          );
        }
      });
    }
  }

  Future createGIFPostwithFeelings(
      {@required String postText,
      @required BuildContext context,
      @required String gifURL,
      @required String feeling}) async {
    var _userAuthToken = Provider.of<UserProvider>(context, listen: false)
        .userAuthenticationToken;

    if (_userAuthToken != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => MainScreen(
              isMainScreen: false,
            ),
          ),
          (route) => false);
      await http.post(
        ApiNetwork.BASE_URL + ApiNetwork().createPost,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $_userAuthToken",
        },
        body: {
          "postText": postText,
          "postSticker": gifURL,
          "feeling_type": "feelings",
          "feeling": feeling,
        },
      ).then((value) {
        var response = jsonDecode(value.body);
        var _timelineProvider =
            Provider.of<TimelineProvider>(context, listen: false);
        if (response['success'] != null && response['success']) {
          TimelineData post = TimelineData.fromJson(response['post']);
          _timelineProvider.timelineData.insert(0, post);
          _timelineProvider.changeTimelineData(_timelineProvider.timelineData);

          BotToast.showText(
            text: "Post successfully created.",
            contentColor: Colors.white,
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          );
        } else {
          BotToast.showText(
            text: "Server Error.",
            contentColor: Colors.red,
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.white,
            ),
          );
        }
      });
    }
  }

  Future createPoll({
    @required BuildContext context,
    @required String pollQuestion,
    @required List<String> answers,
    @required String feeling,
  }) async {
    var _userProvider = Provider.of<UserProvider>(context, listen: false);
    Map body;
    if (feelings != null) {
      body = {
        "postText": pollQuestion,
        "feeling_type": "feelings",
        "feeling": feeling,
      };
    } else {
      body = {
        "postText": pollQuestion,
      };
    }
    for (int i = 0; i < answers.length; i++) {
      body.addEntries({MapEntry("answer[$i]", answers[i])});
    }

    if (_userProvider.userAuthenticationToken != null) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (_) => MainScreen(
              isMainScreen: false,
            ),
          ),
          (route) => false);
      await http
          .post(
        ApiNetwork.BASE_URL + ApiNetwork().createPost,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer ${_userProvider.userAuthenticationToken}",
        },
        body: body,
      )
          .catchError((err) {
        print(err.toString());
      }).then((value) {
        var response = json.decode(value.body);
        var _timelineProvider =
            Provider.of<TimelineProvider>(context, listen: false);
        if (response['success'] != null && response['success']) {
          TimelineData post = TimelineData.fromJson(response['post']);
          _timelineProvider.timelineData.insert(0, post);
          _timelineProvider.changeTimelineData(_timelineProvider.timelineData);

          BotToast.showText(
            text: "Post successfully created.",
            contentColor: Colors.white,
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.black,
            ),
          );
        } else {
          BotToast.showText(
            text: "Server Error.",
            contentColor: Colors.red,
            textStyle: labelTextStyle.copyWith(
              fontSize: 12,
              color: Colors.white,
            ),
          );
        }
      });
    }
  }

  Future<int> createVote({
    @required BuildContext context,
    @required String postId,
    @required String optionId,
  }) async {
    int percentage;
    BotToast.showLoading();
    var _userProvider = Provider.of<UserProvider>(context, listen: false);
    if (_userProvider.userAuthenticationToken != null) {
      await http.post(
        ApiNetwork.BASE_URL + ApiNetwork().voteForPoll,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer ${_userProvider.userAuthenticationToken}",
        },
        body: {
          "post_id": postId,
          "option_id": optionId,
        },
      ).catchError((err) {
        print(err);
      }).then((value) {
        var response = json.decode(value.body);

        response['options'].forEach((element) {
          if (element['id'] == int.tryParse(optionId) &&
              element['post_id'] == int.tryParse(postId) &&
              element['percentage'] != null) {
            percentage = element['percentage'];
          }
        });
      });
      BotToast.closeAllLoading();
    }
    return percentage ?? 0;
  }

  GIFs gifs;
  Future getTrendingGIFs({
    @required BuildContext context,
  }) async {
    var _userAuthenticationToken =
        Provider.of<UserProvider>(context, listen: false)
            .userAuthenticationToken;
    if (_userAuthenticationToken != null) {
      await http.get(
        ApiNetwork.BASE_URL + ApiNetwork().getTrendingGIFs,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $_userAuthenticationToken",
        },
      ).catchError((err) {
        print(err);
      }).then((value) {
        var response = json.decode(value.body);
        gifs = GIFs.fromJson(response);
        print(gifs);
        notifyListeners();
      });
    }
  }

  Future savePost({
    @required String postID,
    @required BuildContext context,
  }) async {
    var _userAuthenticationToken =
        Provider.of<UserProvider>(context, listen: false)
            .userAuthenticationToken;
    if (_userAuthenticationToken != null) {
      await http.post(ApiNetwork.BASE_URL + ApiNetwork().savePost,
          headers: <String, String>{
            "Accept": "application/json",
            "Authorization": "Bearer $_userAuthenticationToken",
          },
          body: {
            "post_id": postID,
          }).catchError((err) {
        print(err.toString());
        throw err;
      }).then((value) {
        try {
          var response = json.decode(value.body);
          print(response);
        } catch (ex) {
          throw ex;
        }
      });
    }
  }

  Future reportPost({
    @required String postID,
    @required BuildContext context,
  }) async {
    var _userAuthenticationToken =
        Provider.of<UserProvider>(context, listen: false)
            .userAuthenticationToken;
    if (_userAuthenticationToken != null) {
      await http.post(ApiNetwork.BASE_URL + ApiNetwork().reportPost,
          headers: <String, String>{
            "Accept": "application/json",
            "Authorization": "Bearer $_userAuthenticationToken",
          },
          body: {
            "post_id": postID,
            "text": "Spam",
          }).catchError((err) {
        print(err.toString());
        throw err;
      }).then((value) {
        try {
          var response = json.decode(value.body);
          print(response);
        } catch (ex) {
          throw ex;
        }
      });
    }
  }

  Future hidePost({
    @required String postID,
    @required BuildContext context,
    @required TimelineData timelineData,
  }) async {
    var _timelineData =
        Provider.of<TimelineProvider>(context, listen: false).timelineData;
    var _userAuthenticationToken =
        Provider.of<UserProvider>(context, listen: false)
            .userAuthenticationToken;
    if (_userAuthenticationToken != null) {
      BotToast.showLoading();

      await http.post(ApiNetwork.BASE_URL + ApiNetwork().hidePost,
          headers: <String, String>{
            "Accept": "application/json",
            "Authorization": "Bearer $_userAuthenticationToken",
          },
          body: {
            "post_id": postID,
          }).catchError((err) {
        print(err.toString());
        BotToast.closeAllLoading();
        throw err;
      }).then((value) {
        try {
          var response = json.decode(value.body);
          print(response);
          if (_timelineData != null && _timelineData.length > 0) {
            if (_timelineData.contains(timelineData)) {
              _timelineData.remove(timelineData);
              Provider.of<TimelineProvider>(context, listen: false)
                  .changeTimelineData(_timelineData);
            }
          }
          BotToast.closeAllLoading();
        } catch (ex) {
          BotToast.closeAllLoading();

          throw ex;
        }
      });
    }
  }
}
