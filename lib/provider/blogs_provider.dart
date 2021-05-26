// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:youonline/helper/api_client.dart';
// import 'package:youonline/model/blogs.dart';
// import 'package:youonline/utils/prefs.dart';

// class BlogProvider with ChangeNotifier {
//   Blogs blogs;
//   changeBlogsData(var _blogs) {
//     blogs = Blogs.fromJson(_blogs);
//     notifyListeners();
//   }

//   Future getAllBlogs() async {
//     String userID = await getUserToken();
//     bool _isError = false;
//     if (userID != null) {
//       await http.post(
//         ApiNetwork.BASE_URL + ApiNetwork().getAllBlogs,
//         headers: <String, String>{
//           "Accept": "application/json",
//           "Authorization": "Bearer $userID",
//         },
//       ).catchError((err) {
//         _isError = true;
//         print(err);
//       }).then((value) {
//         if (!_isError) {
//           try {
//             var response = jsonDecode(value.body);
//             if (response != null) {
//               changeBlogsData(response);
//             }
//           } catch (e) {
//             print(e.toString());
//             throw e;
//           }
//         }
//       });
//     }
//   }
// }
