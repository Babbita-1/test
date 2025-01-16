import 'package:shared_preferences/shared_preferences.dart';

class TokenSharedPrefs {
  // Key to store token in SharedPreferences
  static const String _tokenKey = 'user_token';

  // Save token in SharedPreferences
  static Future<bool> saveToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return await prefs.setString(_tokenKey, token);
  }

  // Get token from SharedPreferences
  static Future<String?> getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  // Remove token from SharedPreferences
  static Future<bool> removeToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.remove(_tokenKey);
  }

  // Check if token exists in SharedPreferences
  static Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_tokenKey);
  }
}
