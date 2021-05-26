
class LoginModel {
  int apiStatus;
  String timezone;
  String accessToken;
  String userID;
  LoginModel({
    this.apiStatus,
    this.timezone,
    this.accessToken,
    this.userID,
  });

  Map<String, dynamic> toMap() {
    return {
      'api_status': apiStatus,
      'timezone': timezone,
      'access_token': accessToken,
      'user_id': userID,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return LoginModel(
      apiStatus: map['api_status'],
      timezone: map['timezone'],
      accessToken: map['timezone'],
      userID: map['user_id'],
    );
  }
}
