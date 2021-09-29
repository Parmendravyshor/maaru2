import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefHelper {
  Future<void> saveEmail(String email);
  Future<void> saveString(String key, String value);
}

class SharedPrefHelperImpl implements SharedPrefHelper {
  SharedPreferences sharedPreferences;
  SharedPrefHelperImpl(this.sharedPreferences);

  @override
  Future<void> saveString(String key, String value) {
    return sharedPreferences.setString(key, value);
  }

  @override
  Future<void> saveEmail(String email) {
    // TODO: implement saveEmail
    throw UnimplementedError();
  }
}
