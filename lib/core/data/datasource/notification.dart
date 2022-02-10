import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalDataHelper {
  SharedPreferences prefs;

  saveValue({String key, bool value}) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  saveStringValue({@required String key, @required String value}) async {
    prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  Future<String> getStringValue({@required String key}) async {
    prefs = await SharedPreferences.getInstance();
    var getStringVal = prefs.getString(key);
    return getStringVal;
  }

  Future<bool> getValue({String key}) async {
    prefs = await SharedPreferences.getInstance();
    bool getVal = prefs.getBool(key);
    return getVal;
  }

  clearAll() async {
    prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}
