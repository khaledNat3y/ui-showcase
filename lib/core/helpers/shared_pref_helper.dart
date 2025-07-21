import 'package:shared_preferences/shared_preferences.dart';
import 'package:ui_showcase/core/helpers/constants.dart';

class SharedPrefHelper {
  static SharedPreferences? _prefs;



  /// Call this method in `main()` before runApp()
  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }



  static Future<void> setRememberMe(bool value) async {
    await _prefs?.setBool(SharedPreferencesKeys.rememberMe, value);
  }


  static Future<void> setUserEmail(String email) async {
    await _prefs?.setString(SharedPreferencesKeys.userEmailKey, email);
  }
  static Future<void> setUserPassword(String password) async {
    await _prefs?.setString(SharedPreferencesKeys.userPasswordKey, password);
  }

  static Future<void> clearUserCredentials() async {
    await _prefs?.remove(SharedPreferencesKeys.userEmailKey);
    await _prefs?.remove(SharedPreferencesKeys.userPasswordKey);
  }

  static bool getRememberMe() {
    return _prefs?.getBool(SharedPreferencesKeys.rememberMe) ?? false;
  }


  static String? getUserEmail() {
    return _prefs?.getString(SharedPreferencesKeys.userEmailKey);
  }

  static String? getUserPassword() {
    return _prefs?.getString(SharedPreferencesKeys.userPasswordKey);
  }

  // Clear all saved data
  static Future<void> clearAll() async {
    await _prefs?.clear();
  }
}
