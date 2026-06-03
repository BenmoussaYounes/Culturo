import 'constants.dart';
import 'shared_pref_helper.dart';

class AuthHelpers {
  static Future<void> saveTokenToLocalStorage(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefKeys.userToken, token);
  }

  static Future<String> getTokenFromLocalStorage() async {
    return await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken);
  }
}
