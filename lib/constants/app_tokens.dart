class AppTokens {
  // Private constructor
  AppTokens._privateConstructor();

  // The single instance of AppTokens
  static final AppTokens _instance = AppTokens._privateConstructor();

  // Factory constructor to return the same instance
  factory AppTokens() {
    return _instance;
  }

  String accessToken = "";
  String fcmToken = "";
  String userId = "";

  // Method to set the access token
  setAccessToken(String token) {
    accessToken = token;
    print("accessToken----->$accessToken");
  }

  // Method to set the user id
  setuserId(String userid) {
    userId = userid;
    print("userId----->$userId");
  }

  // Method to set the fcm token
  void setFcmToken(String token) {
    fcmToken = token;
    print("fcmToken----->$fcmToken");
  }
}
