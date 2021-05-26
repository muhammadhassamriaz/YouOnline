import 'package:shared_preferences/shared_preferences.dart';

Future setUserToken(String setToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("userToken", setToken);
}

Future<String> getUserToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("userToken");
}

Future clearPrefs() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.clear();
}
