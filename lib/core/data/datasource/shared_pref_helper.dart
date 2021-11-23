
import 'package:maru/core/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class SharedPrefHelper {
  Future<void> userLogin();
  Future<void> saveIdJwtToken(String jwtToken);
  Future<void> saveEmail(String email);
  Future<void> savePassword(String password);
  Future<void> savePayload(String payload);
  Future<void> saveExpiryTime(String expiryTime);
  Future<void> saveString(String key, String value);
  Future<void> saveBoolean(String key, bool value);
  Future<void> saveInt(String key, int value);
  Future<void> saveDouble(String key, double value);
  String gettoken();
  String getEmail();
  String getPassword();
  String getPayload();
  String getExpiryTime();
  double getDouble(String key, double defaultValue);
  String getStringByKey(String key, String defaultValue);
  bool isLoggedin();
  bool getBoolByKey(String key, bool defaultValue);
  int getIntByKey(String key, int defaultValue);
}

class SharedPrefHelperImpl implements SharedPrefHelper {
  SharedPreferences sharedPreferences;
  SharedPrefHelperImpl(this.sharedPreferences);
  @override
  String gettoken() {
    return sharedPreferences.getString(MaruConstant.token) ?? "";
  }

  @override
  Future<void> saveIdJwtToken(String jwtToken) {
    return sharedPreferences.setString(MaruConstant.token, jwtToken);
  }
  //
  // @override
  // Future<void> userLogin() {
  //   return sharedPreferences.setBool(MaruConstant.isloggedIn, true);
  // }

  @override
  String getEmail() {
    return sharedPreferences.getString(MaruConstant.email) ?? "";
  }

  @override
  String getPassword() {
    return sharedPreferences.getString(MaruConstant.password) ?? "";
  }

  @override
  Future<void> saveEmail(String email) {
    return sharedPreferences.setString(MaruConstant.email, email);
  }

  @override
  Future<void> savePassword(String password) {
    return sharedPreferences.setString(MaruConstant.password, password);
  }
  @override
  String getStringByKey(String key, String defaultValue) {
    return sharedPreferences.getString(key) ?? defaultValue;
  }

  @override
  Future<void> saveString(String key, String value) {
    return sharedPreferences.setString(key, value);
  }

  @override
  bool getBoolByKey(String key, bool defaultValue) {
    return sharedPreferences.getBool(key) ?? defaultValue;
  }

  @override
  Future<void> saveBoolean(String key, bool value) {
    return sharedPreferences.setBool(key, value);
  }

  @override
  int getIntByKey(String key, int defaultValue) {
    return sharedPreferences.getInt(key) ?? defaultValue;
  }

  @override
  Future<void> saveInt(String key, int value) {
    return sharedPreferences.setInt(key, value);
  }

  @override
  Future<void> saveDouble(String key, double value) {
    return sharedPreferences.setDouble(key, value);
  }

  @override
  double getDouble(String key, double defaultValue) {
    return sharedPreferences.getDouble(key) ?? defaultValue;
  }

  @override
  String getExpiryTime() {
    // TODO: implement getExpiryTime
    throw UnimplementedError();
  }

  @override
  String getPayload() {
    // TODO: implement getPayload
    throw UnimplementedError();
  }

  @override
  bool isLoggedin() {
    // TODO: implement isLoggedin
    throw UnimplementedError();
  }

  @override
  Future<void> saveExpiryTime(String expiryTime) {
    // TODO: implement saveExpiryTime
    throw UnimplementedError();
  }

  @override
  Future<void> savePayload(String payload) {
    // TODO: implement savePayload
    throw UnimplementedError();
  }

  @override
  Future<void> userLogin() {
    // TODO: implement userLogin
    throw UnimplementedError();
  }
}
