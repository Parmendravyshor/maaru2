import 'package:maru/core/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefHelper {
  Future<void> saveEmail(String email);
  Future<void> saveString(String key, String value);
  String getIdJwtToken();
  saveRegistrationId();
  Future<void> userLogin();
  Future<void> savePassword(String password);
  Future<void> saveIdJwtToken(String jwtToken);

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
    return sharedPreferences.setString(MaruConstant.email, email);
  }

  @override
  String getIdJwtToken() {
    return sharedPreferences.getString(MaruConstant.idjwtToken) ?? "";
  }

  @override
  saveRegistrationId() {
    // TODO: implement saveRegistrationId
    throw UnimplementedError();
  }

  @override
  Future<void> userLogin() {
    return sharedPreferences.setBool(MaruConstant.email, true);
  }

  @override
  Future<void> savePassword(String password) {
    // TODO: implement savePassword
    return sharedPreferences.setString(MaruConstant.password, password);
  }

  @override
  Future<void> saveIdJwtToken(String jwtToken) {
    // TODO: implement saveIdJwtToken
    return sharedPreferences.setString(MaruConstant.idjwtToken, jwtToken);
  }
  }




