import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'auth_source.dart';
import 'storage.dart';
import '../../domain/usecases/email_auth_params.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService extends AuthSource {
  final CognitoUserPool _userPool;
  final SharedPreferences prefs;
  final Storage storage;
  UserService(this._userPool, this.prefs, this.storage);
  @override
  Future<void> emailSignup(EmailAuthParams params) {
    // TODO: implement emailSignup
    throw UnimplementedError();
  }

  @override
  Future<CognitoUserSession> emailLogin(EmailAuthParams params) {
    // TODO: implement emailLogin
    throw UnimplementedError();
  }

  @override
  Future<CognitoUserSession> PetCreateProfile(EmailAuthParams params) {
    // TODO: implement emailLogin
    throw UnimplementedError();
  }
}
