import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:youonline/helper/api_client.dart';
import 'package:youonline/model/automotive_options.dart';
import 'package:youonline/utils/prefs.dart';
import 'package:http/http.dart' as http;

class AutomotiveProvider with ChangeNotifier {
  AutomotiveOptions automotiveOptions;

  Future getAutomotiveOptions({
    @required BuildContext context,
  }) async {
    String userAuthenticationToken = await getUserToken();
    if (userAuthenticationToken != null) {
      Uri uri =
          Uri.parse(ApiNetwork.BASE_URL + ApiNetwork().addAutomotiveOptions);
      await http.get(
        uri,
        headers: <String, String>{
          "Accept": "application/json",
          "Authorization": "Bearer $userAuthenticationToken"
        },
      ).catchError((err) {
        print(err);
        throw err;
      }).then((value) {
        var response = json.decode(value.body);
        automotiveOptions = AutomotiveOptions.fromMap(response);
        notifyListeners();
        print(automotiveOptions);
      });
    }
  }
}
