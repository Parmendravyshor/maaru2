
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:maru/core/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:typed_data';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';

abstract class SharedPrefHelper {
  Future<void> userLogin();
  Future<void> saveIdJwtToken(String accessToken);
  Future<void> saveEmail(String email);
  Future<void> savefname(String key,String value);
  Future<void> savelname(String key,String value);
  Future<void> savePassword(String password);
  Future<void> savePayload(String payload);
  Future<void> saveExpiryTime(String expiryTime);
  Future<void> saveString(String key, String value);
  Future <bool> saveStringList(var key, List<int> value);
  Future<void> saveBoolean(String key, bool value);
  Future<void> saveInt(String key, int value);
  Future <void>saveImage(List<int> imageBytes);
  Future<void> saveDouble(String key, double value);
  List<String> getStringList(String key);
  String gettoken();
  String getfname();
  String getlname();
  String getEmail();
  String getImage();
  int getPassword();
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
  Future<void> saveIdJwtToken(String accessToken) {
    return sharedPreferences.setString(MaruConstant.token, accessToken);
  }


  @override
  Future<void> userLogin() {
    return sharedPreferences.setBool('is_verified', true);
  }

  @override
  String getEmail() {
    return sharedPreferences.getString(MaruConstant.email) ?? "";
  }

  @override
  int getPassword() {
    return sharedPreferences.getInt(MaruConstant.id);
  }

  @override
  Future<void> saveEmail(String email) {
    return sharedPreferences.setString(MaruConstant.email, email);
  }

  @override
  Future<void> savePassword(String password) {
    return sharedPreferences.setString(MaruConstant.id, password);
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

  // @override
  // Future<void> userLogin() {
  //   // TODO: implement userLogin
  //   throw UnimplementedError();
  // }

  @override
  Future<bool> saveImage(List<int> imageBytes) {
    String base64Image = base64Encode(imageBytes);
    return sharedPreferences.setString(MaruConstant.img, base64Image);
  }

  @override
  String getImage() {
    return sharedPreferences.getString(MaruConstant.img) ?? "";
  }

  @override
  Future<void> savefname(String key, String value) {
    return sharedPreferences.setString(MaruConstant.first_name, '');
  }

  @override
  String getfname() {
    // TODO: implement getfname
    return sharedPreferences.getString(MaruConstant.first_name,);
  }

  @override
  String getlname() {
    sharedPreferences.getString(MaruConstant.last_name,);
  }

  @override
  Future<void> savelname(String key, String value) {
    return sharedPreferences.setString(MaruConstant.last_name, '');
  }

  @override
  List<String> getStringList(String key) {
    sharedPreferences.getString(key);
  }


  @override
  Future<bool> saveStringList(var key, List<int> value) {
 sharedPreferences.setString(key, value.toString());
  }


}
class Utility {
  //
  static const String KEY = "img";

  static Future<String> getImageFromPreferences() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(KEY) ?? null;
  }

  static Future<bool> saveImageToPreferences(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(KEY, value);
  }

  static Image imageFromBase64String(String base64String) {
    return Image.memory(
      base64Decode(base64String),
      fit: BoxFit.fill,
    );
  }

  static Uint8List dataFromBase64String(String base64String) {
    return base64Decode(base64String);
  }

  static String base64String(Uint8List data) {
    return base64Encode(data);
  }

}
