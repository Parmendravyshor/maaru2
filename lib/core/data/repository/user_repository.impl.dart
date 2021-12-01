import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
// import 'package:background_location/background_location.dart';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:maru/features/verify/domain/usecases/create_user_profile.dart';

import 'dart:convert';
import 'package:path/path.dart';
import 'package:async/async.dart';


//import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dio/dio.dart';
import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'package:kiwi/kiwi.dart';
import 'dart:convert' as convert;
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/notification.dart';
import 'package:maru/core/data/repository/user_repository.impl.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';

import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;


import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/auth_source.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/forgot/Domain/usecases/reset_password.dart';

import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/verify_code.dart';
import 'package:flutter/scheduler.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as https;
import 'package:shared_preferences/shared_preferences.dart';


class UserRepositoryImpl implements UserRepository {
  final AuthSource authSource;
  final SharedPrefHelper sharedPrefHelper;

  UserRepositoryImpl(this.sharedPrefHelper, this.authSource);

  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();


  @override
  Future<Either<Failure, void>> emailSignup(EmailAuthParams params) async {
    try {
      var map = new Map<String, String>();
      map [MaruConstant.first_name] = params.first_name;
      map[MaruConstant.last_name] = params.lName;
      map[ MaruConstant.email] = params.email;
      map [MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'user';
      final response = await http.post(MaruConstant.signup,
          body: map
      );
      Map res = json.decode(response.body);

      return
        Right('Otp sent your register email');
    }
    on CognitoClientException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> emailLogin(EmailAuthParams params,) async {
    try {
      var map = new Map<String, String>();

      map[ MaruConstant.email] = params.email;
      map [MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'user';
      final response = await http.post(MaruConstant.signin,
          body: map
      );

      Map res = json.decode(response.body);
      print(res);
      await sharedPrefHelper.savelname("accessToken", res['accessToken']);
      print(res['accessToken']);
      // await sharedPrefHelper.savePassword(res[MaruConstant.id]);
      //   print(res);
      await sharedPrefHelper.savePassword(MaruConstant.password,);

      await sharedPrefHelper.savelname(
          MaruConstant.last_name, res['last_name']);
      await sharedPrefHelper.saveEmail(res[MaruConstant.email]);
      print("Register Success  ${response.body}");
      return
        Right(Void);
    }
    on CognitoClientException catch (e) {
      if (e.code == 'UserNotConfirmedException') {
        return Left(UserNotConfirmedFailure(e.message));
      } else {
        return Left(CacheFailure(e.message));
      }
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> resendOtp(String email) async {
    try {
      var map = new Map<String, String>();
      map[ MaruConstant.email] = email;
      final response = await http.post(MaruConstant.resend,
          body: map
      );
      print("Register Success  ${response.body}");


      return
        Right(Void);
    }
    catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(String email) async {
    try {
      var map = new Map<String, String>();
      map[ MaruConstant.email] = email;
      final response = await http.post(MaruConstant.reset,
          body: map
      );
      print("Register Success  ${response.body}");


      return
        Right(Void);
    }
    catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> getProfile() {
    // TODO: implement getProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> petCreateProfile(params) {
    // TODO: implement petProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> createPetProfile(
      PetProfileParams params) async {
    try {
      final img = sharedPrefHelper.getImage();
      print(img);
      final token = _prefHelper.getStringByKey(MaruConstant.token, "",);
      print(token);

      var headers = {
        "access-token": token
      };
      var request;
      // var response1 = request.files.add(
      //     await http.MultipartFile.fromPath('profile_pic', img));
      var map = Map<String, String>();
      map [MaruConstant.age] = params.age;
      map[MaruConstant.pet_name] = params.petName;
      map[MaruConstant.birth_date] = '1/1/2021';
      map[MaruConstant.breed_type] = params.breadType;
      map[MaruConstant.weight] = params.weight;
      map[MaruConstant.height] = params.height;
      map[MaruConstant.sex] = 'djhd';
      map[MaruConstant.img] = img;

      final response = await http.post(
          MaruConstant.createpProfile,
          headers: headers,
          body: map

      );
      print("Register Success  ${response.body}");

      return
        Right(Void);
    }
    catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, void>> getPastAppointment() {
    // TODO: implement getPastAppointment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getPetProfile() {
    // TODO: implement getPetProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getUpcomingAppointment() {
    // TODO: implement getUpcomingAppointment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getUserProfile() {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> savePetProfile(PetProfileParams params) async {
    try {
      var map = new Map<String, String>();
      map [MaruConstant.age] = params.age;
      map[MaruConstant.birth_date] = params.birthDate;
      // map[ MaruConstant.img] = params.profileImage;
      // map [MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'User';
      final response = await http.post(MaruConstant.savepet1,
          body: map
      );

      print("Register Success  ${response.body}");
      // sharedPrefHelper.saveString(MaruConstant.first_name, params.first_name);
      // sharedPrefHelper.saveString(MaruConstant.last_name, params.lName);
      // sharedPrefHelper.saveString(MaruConstant.email, params.email);
      if (response.statusCode == 200) {
        //  await authSource.emailSignup(params);
        return
          Right(Void);
      }
      else {
        return Left(UnknownFailure("Already registered account"));
      }
    }

    catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> saveUserProfile(
      UserProfileParams params) async {
    try {
      var Email = sharedPrefHelper.getEmail();
      final token = _prefHelper.getStringByKey(MaruConstant.token, "",);
      final fname = sharedPrefHelper.getfname();
      print(fname);
      print(token);

      var headers = {
        "access-token": token
      };
      var map = Map<String, String>();
      map[MaruConstant.first_name] = params.fname;
      map[MaruConstant.last_name] = params.lname;
      map [MaruConstant.email] = Email;
      map[MaruConstant.city] = params.city;
      map[MaruConstant.zip] = params.zipCode;
      map[MaruConstant.phone_number] = params.phone;
      map[MaruConstant.state] = params.state;


      final response = await http.post(
          MaruConstant.createUserProfilr,
          headers: headers,
          body: map

      );
      print("Register Success  ${response.body}");

      return
        Right(Void);
    }
    catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }


  @override
  Future<Either<Failure, void>> setNewPassword(
      SetNewPasswordParams params) async {
    try {
      // print("verifyOTP TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
      var map = Map<String, String>();
      map[ MaruConstant.otp] = params.otp;
      map[ MaruConstant.email] = params.email;
      map[ MaruConstant.password] = params.password;
      final response = await http.post(MaruConstant.setNewPasword,

          body: map
      );
      print("Register Success  ${response.body}");


      if (response.statusCode == 200) {
        sharedPrefHelper.saveIdJwtToken(
          MaruConstant.token,);
        // String token ="";
        //await SharedPreferencesHelper().SetAuthToken(token);
// print(token);
        // Map<String,Strin
        return
          Right(Void);
      }
    }
    catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }


  @override
  Future<Either<Failure, void>> verifyCode(VerifyParams params) async {
    try {
      // print("verifyOTP TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
      var map = Map<String, String>();
      map[ MaruConstant.otp] = params.code;
      map[ MaruConstant.email] = params.email;
      // map[ MaruConstant.email] = params.email;
      final response = await http.post(MaruConstant.verify,

          body: map
      );
      print("Register Success  ${response.body}");


      if (response.statusCode == 200) {
        sharedPrefHelper.saveIdJwtToken(
          MaruConstant.token,);
        // String token ="";
        //await SharedPreferencesHelper().SetAuthToken(token);
// print(token);
        // Map<String,Strin
        return
          Right(Void);
      }
    }
    catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> getHomeSearchBarItems() {
    // TODO: implement getHomeSearchBarItems
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getResentMessages() {
    // TODO: implement getResentMessages
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getUserSaveAccountLocation() {
    // TODO: implement getUserSaveAccountLocation
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getUserPayment() {
    // TODO: implement getUserPayment
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> saveUserPayment(PaymentParams params)async {
    try {
      final token = _prefHelper.getStringByKey(MaruConstant.token, "",);

      var headers = {
        "access-token": token
      };
      var map = Map<String, String>();
      map[ MaruConstant.credit_card_no] = params.creditCardNumber;
      map[ MaruConstant.name_on_card] = params.nameOnCard;
      map[ MaruConstant.cvv] = params.cvv;
      map[ MaruConstant.exp_date] = params.expDate;
      final response = await http.post(MaruConstant.saveUserPayment,
headers: headers,
          body: map
      );
      print("Register Success  ${response.body}");


      if (response.statusCode == 200) {
        sharedPrefHelper.saveIdJwtToken(
          MaruConstant.token,);
        // String token ="";
        //await SharedPreferencesHelper().SetAuthToken(token);
// print(token);
        // Map<String,Strin
        return
          Right(Void);
      }
    }
    catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }


  @override
  Future<Either<Failure, void>> getDayCareSearchIcons() {
    // TODO: implement getDayCareSearchIcons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getGroomingSearchIcons() {
    // TODO: implement getGroomingSearchIcons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getHomeSearchIcons() {
    // TODO: implement getHomeSearchIcons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getHospitalSearchIcons() {
    // TODO: implement getHospitalSearchIcons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> getVetSearchIcons() {
    // TODO: implement getVetSearchIcons
    throw UnimplementedError();
  }
  @override
  Future<Either<Failure, void>> getWalkingSearchIcons() {
    // TODO: implement getWalkingSearchIcons
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> saveRegistrationId() {
    // TODO: implement saveRegistrationId
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> forgetPassword( email) async{
    try {

      // print("verifyOTP TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
      var map = Map<String, String>();

      map[ MaruConstant.email] = email;
      // map[ MaruConstant.email] = params.email;
      final response = await http.post(MaruConstant.forgetverify,

          body: map
      );
      print("Register Success  ${response.body}");


      if (response.statusCode == 200) {
        sharedPrefHelper.saveIdJwtToken(
          MaruConstant.token,);
        // String token ="";
        //await SharedPreferencesHelper().SetAuthToken(token);
// print(token);
        // Map<String,Strin
        return
          Right(Void);
      }
    }

    catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> createUserProfile(UserProfile params) {
    // TODO: implement createUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> saveChangePassword(UserProfileParams params)async {
    try {
      final token = _prefHelper.getStringByKey(MaruConstant.token, "",);
      var headers = {
        "access-token": token
      };
      // print("verifyOTP TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
      var map = Map<String, String>();

      map[ MaruConstant.current_password] = params.oldPassword;
      map[MaruConstant.change_password] = params.NewPassword;
      // map[ MaruConstant.email] = params.email;
      final response = await http.post(MaruConstant.changePassword,
headers: headers,
          body: map
      );
      print("Register Success  ${response.body}");


      if (response.statusCode == 200) {
        sharedPrefHelper.saveIdJwtToken(
          MaruConstant.token,);
        // String token ="";
        //await SharedPreferencesHelper().SetAuthToken(token);
// print(token);
        // Map<String,Strin
        return
          Right(Void);
      }
    }

    catch (e) {
      print("Thrown Exception While changeing  password:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> providerEmailSignin(EmailAuthParams params)async {
    try {
      var map = new Map<String, String>();

      map[ MaruConstant.email] = params.email;
      map [MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'provider';
      final response = await http.post(MaruConstant.signin,
          body: map
      );

      Map res = json.decode(response.body);
      print(res);
      await sharedPrefHelper.savelname("accessToken", res['accessToken']);
      print(res['accessToken']);
      // await sharedPrefHelper.savePassword(res[MaruConstant.id]);
      //   print(res);
      await sharedPrefHelper.savePassword(MaruConstant.password,);

      await sharedPrefHelper.savelname(MaruConstant.last_name, res['last_name']);
      await sharedPrefHelper.saveEmail(res[MaruConstant.email]);
      print("Register Success  ${response.body}");
      return
        Right(Void);
    }
    on CognitoClientException catch (e) {
      if (e.code == 'UserNotConfirmedException') {
        return Left(UserNotConfirmedFailure(e.message));
      } else {
        return Left(CacheFailure(e.message));
      }
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> providerEmailSignup(EmailAuthParams params)async {
    try {
      var map = new Map<String, String>();
      map [MaruConstant.first_name] = params.first_name;
      map[MaruConstant.last_name] = params.lName;
      map[ MaruConstant.email] = params.email;
      map [MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'provider';
      final response = await http.post(MaruConstant.signup,
          body: map
      );
      Map res = json.decode(response.body);
    print(res);
      return
        Right('Otp sent your register email');
    }
    on CognitoClientException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

}
