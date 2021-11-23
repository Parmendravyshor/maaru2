import 'package:maru/core/constant/constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

 class SharedPreferencesHelper {
 // Future<void> saveEmail(String email);
 // Future<void> saveString(String key, String value);
 //String getString(String key,);
  Future<bool> SetAuthToken(String token) async {
    final pref =await SharedPreferences.getInstance();
    return pref.setString('acccess-token'.toString(), token);
  }
  Future<String> GetAuthToken() async {
    final pref =await SharedPreferences.getInstance();
    return pref.getString('acccess-token'.toString(), );
  }
 // saveRegistrationId();
  //Future<void> userLogin();
  //Future<void> savePassword(String password);
  //Future<void> saveIdJwtToken(String jwtToken);

}

//
// class SharedPrefHelperImpl implements SharedPrefHelper {
//   SharedPreferences sharedPreferences;
//   SharedPrefHelperImpl(this.sharedPreferences);
//
//   @override
//   Future<void> saveString(String key, String value)async {
//     return  await sharedPreferences.setString(key, value);
//   }
//
//   @override
//   Future<void> saveEmail(String email) {
//     return sharedPreferences.setString(MaruConstant.email, email);
//   }
//
//   @override
//   String getIdJwtToken() {
//     return sharedPreferences.getString(MaruConstant.idjwtToken) ?? "";
//   }
//
//   @override
//   saveRegistrationId() {
//     // TODO: implement saveRegistrationId
//     throw UnimplementedError();
//   }
//
//   @override
//   Future<void> userLogin() {
//     return sharedPreferences.setBool(MaruConstant.email, true);
//   }
//
//   @override
//   Future<void> savePassword(String password) {
//     // TODO: implement savePassword
//     return sharedPreferences.setString(MaruConstant.password, password);
//   }
//
//   @override
//   Future<void> saveIdJwtToken(String jwtToken) async{
// final
//     return await sharedPreferences.setString("Access-token" ,"Access-token");
//   }
//
//   @override
//   String getString(String key) {
//   return sharedPreferences.getString(key);
//   }
//
//
//   }
//



