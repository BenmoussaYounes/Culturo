import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  SharedPrefHelper._();

  static Future<SharedPreferences> get _prefs => SharedPreferences.getInstance();
  static const FlutterSecureStorage _secureStorage = FlutterSecureStorage();

  /// Removes a value from SharedPreferences with given [key].
  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    await (await _prefs).remove(key);
  }

  /// Removes all keys and values in the SharedPreferences.
  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    await (await _prefs).clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static Future<void> setData(String key, dynamic value) async {
    debugPrint('SharedPrefHelper : setData with key : $key and value : $value');
    final sharedPreferences = await _prefs;
    switch (value) {
      case final String v:
        await sharedPreferences.setString(key, v);
      case final int v:
        await sharedPreferences.setInt(key, v);
      case final bool v:
        await sharedPreferences.setBool(key, v);
      case final double v:
        await sharedPreferences.setDouble(key, v);
      default:
        debugPrint('SharedPrefHelper : unsupported type ${value.runtimeType}');
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static Future<bool> getBool(String key) async {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    return (await _prefs).getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    return (await _prefs).getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    return (await _prefs).getInt(key) ?? 0;
  }

  /// Gets a String value from SharedPreferences with given [key].
  static Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper : getString with key : $key');
    return (await _prefs).getString(key) ?? '';
  }

  /// Saves a [value] with a [key] in FlutterSecureStorage.
  static Future<void> setSecuredString(String key, String value) async {
    debugPrint('FlutterSecureStorage : setSecuredString with key : $key');
    await _secureStorage.write(key: key, value: value);
  }

  /// Gets a String value from FlutterSecureStorage with given [key].
  static Future<String> getSecuredString(String key) async {
    debugPrint('FlutterSecureStorage : getSecuredString with key : $key');
    return await _secureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values in FlutterSecureStorage.
  static Future<void> clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    await _secureStorage.deleteAll();
  }
}
