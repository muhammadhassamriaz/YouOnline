import 'package:youonline/helper/api_client.dart';

class Constants {
  static Map<String, String> loginBody(String username, String password) => {
        "username": username,
        "password": password,
        "server_key": ApiNetwork().serverKey,
      };
  static Map<String, String> createAccountBody(
    String username,
    String email,
    String password,
  ) =>
      {
        "server_key": ApiNetwork().serverKey,
        "username": username,
        "password": password,
        "confirm_password": password,
        "email": email,
      };
}


