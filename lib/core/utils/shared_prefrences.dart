import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsHelper {
  SharedPrefsHelper._();


  static const String _keyLoggedIn = 'is_logged_in';
  static const String _keyToken = 'auth_token';
  static late SharedPreferences _prefs;


  static Future<void> init(SharedPreferences prefs) async {
    _prefs = prefs;
  }

  static SharedPreferences get prefsInstance => _prefs;

  static bool get isLoggedIn => _prefs.getBool(_keyLoggedIn) ?? false;

    static String? get token => _prefs.getString(_keyToken);

  static Future<void> setLoggedIn(bool value) async {
    await _prefs.setBool(_keyLoggedIn, value);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_keyToken);
  }

  

   static Future<void> setToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_keyToken, token);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_keyToken);
  }


  static Future<void> clearAll() async {
    await _prefs.clear();
  }
}
