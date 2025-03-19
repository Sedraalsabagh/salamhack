import 'package:shared_preferences/shared_preferences.dart';

class TokenManager {
  static Future<void> saveToken(String token) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool isSaved = await sharedPreferences.setString('token', token);
    if (isSaved) {
      print("Token saved successfully");
    } else {
      print("Failed to save token");
    }
  }

  static Future<String?> getAccessToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? token = sharedPreferences.getString('token');

    if (token == null) {
      print("Error: No access token found");
      return null;
    }

    return token;
  }

  static Future<void> clearToken() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove('token');
  }
}
