import 'dart:convert';
import 'dart:developer';
import 'dart:ffi';
import 'dart:io';
// import 'package:background_location/background_location.dart';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:maru/features/Book_Appointment/domain/usecases/get_upcoming_past_appointments.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen1.dart';
import 'package:maru/features/verify/domain/usecases/book_a_provider.dart';
import 'package:maru/features/verify/domain/usecases/create_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_provider_by_id.dart';
import 'package:maru/features/verify/domain/usecases/get_providers.dart';
import 'package:maru/features/verify/domain/usecases/upload_vaccine_record.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';

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
      map[MaruConstant.first_name] = params.first_name;
      map[MaruConstant.last_name] = params.lName;
      map[MaruConstant.email] = params.email;
      map[MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'user';
      final response = await http.post(MaruConstant.signup, body: map);
      Map res = json.decode(response.body);

      return Right('Otp sent your register email');
    } on CognitoClientException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> emailLogin(
    EmailAuthParams params,
  ) async {
    try {
      var map = new Map<String, String>();

      map[MaruConstant.email] = params.email;
      map[MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'user';
      final response = await http.post(MaruConstant.signin, body: map);

      Map res = json.decode(response.body);
      print(res);

      await sharedPrefHelper.saveString("accessToken", res['accessToken']);
      print(res['accessToken']);
      // await sharedPrefHelper.savePassword(res[MaruConstant.id]);
      //   print(res);
      await sharedPrefHelper.savePassword(
        MaruConstant.password,
      );

      await sharedPrefHelper.savelname(
          MaruConstant.last_name, res['last_name']);
      await sharedPrefHelper.saveEmail(res[MaruConstant.email]);
      print("Register Success  ${response.body}");
      //  await sharedPrefHelper.saveString( "first_name",res['first_name']);
      var fname = '';
      if (res.containsKey("first_name")) fname = res['first_name'] ?? "";
      sharedPrefHelper.saveString(MaruConstant.first_name, fname ?? "");
      print(res['first_name']);
      await sharedPrefHelper.saveString("last_name", res['last_name']);
      print(res['last_name']);
      return Right(Void);
    } on CognitoClientException catch (e) {
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
      map[MaruConstant.email] = email;
      final response = await http.post(MaruConstant.resend, body: map);
      print("Register Success  ${response.body}");

      return Right(Void);
    } catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(String email) async {
    try {
      var map = new Map<String, String>();
      map[MaruConstant.email] = email;
      final response = await http.post(MaruConstant.reset, body: map);
      print("Register Success  ${response.body}");

      return Right(Void);
    } catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  Future<Either<Failure, void>> getProfile() async {
    // try {
    //   final token = _prefHelper.getStringByKey(
    //     MaruConstant.token,
    //     "",
    //   );
    //   var headers = {"access-token": token};
    //
    //   final response =
    //       await http.get(MaruConstant.createpProfile, headers: headers);
    //
    //   var data = convert.jsonDecode(response.body);
    // //  print(data);
    //   var profile = data['pet_profiles'];
    //  // print("getprofile $data");
    //   var
    //       img = "",
    //       breed_type = "",
    //       age = "",
    //       weight = "",
    //       height = "",
    //       known_allergies = "",
    //       pet_needs = "",
    //       birthdate = '',
    //       sex = '',
    //       gender = '',
    //       lastseen = "",
    //       lastpoked = "",
    //       walkingchedule = "",
    //       feeding = "",
    //       temperament ="",
    //       isadmin = false,
    //       debug = false,
    //       contextrand = false,
    //       contextoff = false;
    // //  if (profile.containsKey("pet_name")) petname = profile['pet_name'] ?? "";
    //   if (profile.containsKey('breed_type'))   breed_type = profile['breed_type'] ?? "";
    //   if (profile.containsKey('height')) height = profile['height'] ?? "";
    //   if (profile.containsKey('known_allergies'))  weight = profile['weight'] ?? "";
    //   if (profile.containsKey('pet_needs'))  pet_needs = profile['pet_needs'] ?? "";
    //   if (profile.containsKey('birth_date'))   birthdate = profile['birth_date'] ?? "";
    //   if (profile.containsKey('sex')) sex = profile['sex'] ?? "";
    //   if (profile.containsKey('gender')) gender = profile['gender'] ?? "";
    //   if (profile.containsKey('walking_schedule'))  walkingchedule = profile['walking_schedule'] ?? "";
    //   if (profile.containsKey('feeding_schedule')) feeding = profile['feeding_schedule'] ?? "";
    //   if (profile.containsKey("img")) img = profile['img'] ?? "";
    //   if (profile.containsKey("age")) age = profile['age'] ?? "";
    //   if (profile.containsKey('temperament'))  temperament = profile['temperament'] ?? "";
    //   if (profile.containsKey("weight")) weight = profile['weight'] ?? "";
    //   sharedPrefHelper.saveString(MaruConstant.pet_name, profile['pet_name']);
    //   sharedPrefHelper.saveString(MaruConstant.img, img ?? "");
    //   sharedPrefHelper.saveString(MaruConstant.age, age ?? "");
    //   sharedPrefHelper.saveString(MaruConstant.weight, weight?? "");
    //   sharedPrefHelper.saveString(MaruConstant.breed_type, breed_type?? "");
    //   sharedPrefHelper.saveString(MaruConstant.height, height ?? "");
    //   sharedPrefHelper.saveString(MaruConstant.pet_needs, pet_needs ?? "");
    //   sharedPrefHelper.saveString(MaruConstant.birth_date, birthdate ?? "");
    //   sharedPrefHelper.saveString(MaruConstant.sex,sex?? "");
    //   sharedPrefHelper.saveString(MaruConstant.gender, gender ?? "");
    //   sharedPrefHelper.saveString(MaruConstant.walking_schedule, walkingchedule?? "");
    //   sharedPrefHelper.saveString(MaruConstant.feeding_schedule, feeding?? "");
    //   sharedPrefHelper.saveString(MaruConstant.temperament, temperament ??"");
    //   print(profile['age']);
    //   return Right('Otp sent your register email');
    // } on CognitoClientException catch (e) {
    //   return Left(CacheFailure(e.message));
    // } catch (e) {
    //   return Left(CacheFailure(e.toString()));
    // }
  }

  @override
  Future<Either<Failure, void>> petCreateProfile(params) {
    // TODO: implement petProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> createPetProfile(PetProfile params) async {
    try {
      final img1 = sharedPrefHelper.getStringByKey(MaruConstant.img, '');
      print(img1);
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token, 'Content-Type': 'json/application'};
      final File imageFile = File(img1);
      var stream =
          http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();
      var request = http.MultipartRequest(
        "POST",
        MaruConstant.createpProfile,
      );
      var multipartFile = http.MultipartFile('img', stream, length,
          filename: basename(imageFile.path));
      request.files.add(multipartFile);
      request
        ..fields[MaruConstant.pet_name] = params.petName
        ..fields[MaruConstant.breed_type] = params.breedType
        ..fields['age'] = params.age
        ..fields[MaruConstant.height] = params.height
        ..fields[MaruConstant.weight] = params.weight
        ..fields[MaruConstant.known_allergies] = 'params.knownAllergies'
        ..fields[MaruConstant.name] = ''
        ..fields[MaruConstant.note] = params.notes
        ..fields[MaruConstant.pet_needs] = ''
        ..fields[MaruConstant.times_a_day] = ''
        ..fields[MaruConstant.sex] = 'spade'
        ..fields[MaruConstant.gender] = 'male'
        // ..fields['breed_type'] = 'dff'
        ..fields['birth_date'] = '2021-09-07'
        ..headers.addAll(headers);
      print('request params ${request.fields.toString()}');
      var response = await request.send();
      final respStr = await response.stream.bytesToString();
      print("respStr respStr respStr:$respStr");
      Map res = json.decode(respStr);
      print(res);
      var kucchu = '', kucchu2 = '';
      var profile = res['pet_profile'];
      var profile2 = profile['age'];

      await _prefHelper.saveString(MaruConstant.pet_name, profile['pet_name']);
      await _prefHelper.saveString(
          MaruConstant.breed_type, profile['breed_type']);
      print(res['accessToken']);
      await _prefHelper.saveString('age', kucchu ?? "");
      await _prefHelper.saveString(MaruConstant.height, profile['height']);
      await Utility.saveImageToPreferences(profile['img']);
      await _prefHelper.saveString(MaruConstant.img, '');
      print(res['pet_profile']['height']);
      // sharedPrefHelper.saveString(ChadbotConstants.fname, fname ?? "");
      await _prefHelper.saveString(MaruConstant.weight, profile['weight']);
      await _prefHelper.saveString(MaruConstant.sex, profile['sex']);
      await _prefHelper.saveString(MaruConstant.gender, profile['gender']);
      await _prefHelper.saveString(
          MaruConstant.birth_date, profile['birth_date']);
      await _prefHelper.saveString(MaruConstant.id, profile['id']);
      return Right(Void);
    } on CognitoClientException catch (e) {
      print('exception print  + $e');
      return Left(CacheFailure(e.toString()));
    } catch (e) {
      print('exception print etrhtjryjhytrytjrnytjjhy5jyjy + $e');
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> getPastAppointment() {
    // TODO: implement getPastAppointment
    throw UnimplementedError();
  }

//TODO: Ricky
  @override
  Future<Either<Failure, Welcome>> getPetProfile() async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      print(token);
      var headers = {"access-token": token};

      final response =
          await http.get(MaruConstant.createpProfile, headers: headers);

      var data = convert.jsonDecode(response.body);
      print(data);
      // var profile = data['pet_profiles'];
      // print('fklfjeklfjklfj$profile');
      // List<PetProfileParams> user = [];

      print('dj sir');
      print(response);
      return Right(Welcome.fromJson(data));
    } on CognitoClientException catch (e) {
      print('Ricky sir ');
      return Left(CacheFailure(e.toString()));
    } catch (e) {
      print('Harinder sir $e');
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> getUpcomingAppointment() async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      final response =
          await http.get(MaruConstant.getupcominapointment, headers: headers);
//print(response.body);
      var data = convert.jsonDecode(response.body);

      var profile = data['Upcoming_bookings'];
      // print('fklfjeklfjklfj$profile');
      var index;
      var date = profile[index]['booking_date'];
      print('kjhdjkhdjkhjkdhjkdhjkdhjdh$date');

      return Right(Void);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> getUserProfile() {
    // TODO: implement getUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> savePetProfile(PetProfile params) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var ss2 = await _prefHelper.getStringByKey(MaruConstant.pet_name, '');
      print(ss2);
      var age2 = _prefHelper.getStringByKey(MaruConstant.breed_type, '');
      print('juikodjhfhjfhjfhfjhfjhfjfhjfhfhfhfjh${age2}');
      var headers = {"access-token": token};
      //   final response = await http.post(MaruConstant.savepet1, body: {
      var request =
          await http.put(MaruConstant.savepet1, headers: headers, body: {
        MaruConstant.pet_name:
            _prefHelper.getStringByKey(MaruConstant.pet_name, ''),
        'age': _prefHelper.getStringByKey('age', ''),
        MaruConstant.height:
            _prefHelper.getStringByKey(MaruConstant.height, ''),
        MaruConstant.weight:
            _prefHelper.getStringByKey(MaruConstant.weight, ""),
        MaruConstant.sex: _prefHelper.getStringByKey(MaruConstant.sex, ''),
        MaruConstant.gender:
            _prefHelper.getStringByKey(MaruConstant.gender, ''),
        MaruConstant.breed_type:
            _prefHelper.getStringByKey(MaruConstant.breed_type, ''),
        MaruConstant.birth_date:
            _prefHelper.getStringByKey(MaruConstant.birth_date, ''),
        //MaruConstant.vaccine: params.vaccine,
      });

      var res = json.decode(request.body);
      print(res);

      return Right(Void);
    } on CognitoClientException catch (e) {
      return Left(CacheFailure(e.toString()));
    } catch (e) {
      print('exception$e');
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> saveUserProfile(
      UserProfileParams params) async {
    try {
      var Email = sharedPrefHelper.getEmail();
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      final fname = sharedPrefHelper.getfname();
      print(fname);
      print(token);

      var headers = {"access-token": token};
      var map = Map<String, String>();
      map[MaruConstant.first_name] = params.fname;
      map[MaruConstant.last_name] = params.lname;
      map[MaruConstant.email] = Email;
      map[MaruConstant.city] = params.city;
      map[MaruConstant.zip] = params.zipCode;
      map[MaruConstant.phone_number] = params.phone;
      map[MaruConstant.state] = params.state;

      final response = await http.post(MaruConstant.createUserProfilr,
          headers: headers, body: map);
      print("Register Success  ${response.body}");

      return Right(Void);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> setNewPassword(
      SetNewPasswordParams params) async {
    try {
      // print("verifyOTP TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
      var map = Map<String, String>();
      map[MaruConstant.otp] = params.otp;
      map[MaruConstant.email] = params.email;
      map[MaruConstant.password] = params.password;
      final response = await http.post(MaruConstant.setNewPasword, body: map);
      print("Register Success  ${response.body}");

      if (response.statusCode == 200) {
        sharedPrefHelper.saveIdJwtToken(
          MaruConstant.token,
        );
        // String token ="";
        //await SharedPreferencesHelper().SetAuthToken(token);
// print(token);
        // Map<String,Strin
        return Right(Void);
      }
    } catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> verifyCode(VerifyParams params) async {
    try {
      // print("verifyOTP TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
      var map = Map<String, String>();
      map[MaruConstant.otp] = params.code;
      map[MaruConstant.email] = params.email;
      // map[ MaruConstant.email] = params.email;
      final response = await http.post(MaruConstant.verify, body: map);
      print("Register Success  ${response.body}");
      //
      // if (response.statusCode == 200) {
      //   sharedPrefHelper.saveIdJwtToken(
      //     MaruConstant.token,
      //   );
      // String token ="";
      //await SharedPreferencesHelper().SetAuthToken(token);
// print(token);
      // Map<String,Strin
      return Right(Void);
      // }
    } catch (e) {
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
  Future<Either<Failure, void>> saveUserPayment(PaymentParams params) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );

      var headers = {"access-token": token};
      var map = Map<String, String>();
      map[MaruConstant.credit_card_no] = params.creditCardNumber;
      map[MaruConstant.name_on_card] = params.nameOnCard;
      map[MaruConstant.cvv] = params.cvv;
      map[MaruConstant.exp_date] = params.expDate;
      final response = await http.post(MaruConstant.saveUserPayment,
          headers: headers, body: map);
      print("Register Success  ${response.body}");

      if (response.statusCode == 200) {
        sharedPrefHelper.saveIdJwtToken(
          MaruConstant.token,
        );
        // String token ="";
        //await SharedPreferencesHelper().SetAuthToken(token);
// print(token);
        // Map<String,Strin
        return Right(Void);
      }
    } catch (e) {
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
  Future<Either<Failure, void>> forgetPassword(email) async {
    try {
      // print("verifyOTP TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
      var map = Map<String, String>();

      map[MaruConstant.email] = email;

      // map[ MaruConstant.email] = params.email;
      final response = await http.post(MaruConstant.forgetverify, body: map);
      print("Register Success  ${response.body}");

      if (response.statusCode == 200) {
        sharedPrefHelper.saveIdJwtToken(
          MaruConstant.token,
        );
        // String token ="";
        //await SharedPreferencesHelper().SetAuthToken(token);
// print(token);
        // Map<String,Strin
        return Right(Void);
      }
    } catch (e) {
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
  Future<Either<Failure, void>> saveChangePassword(
      UserProfileParams params) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      // print("verifyOTP TOKEEEEEEEEEEEEEEnnnnnnnnnnnnnnnn:$token");
      var map = Map<String, String>();

      map[MaruConstant.current_password] = params.oldPassword;
      map[MaruConstant.change_password] = params.NewPassword;
      // map[ MaruConstant.email] = params.email;
      final response = await http.post(MaruConstant.changePassword,
          headers: headers, body: map);
      print("Register Success  ${response.body}");

      if (response.statusCode == 200) {
        sharedPrefHelper.saveIdJwtToken(
          MaruConstant.token,
        );
        // String token ="";
        //await SharedPreferencesHelper().SetAuthToken(token);
// print(token);
        // Map<String,Strin
        return Right(Void);
      }
    } catch (e) {
      print("Thrown Exception While changeing  password:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> providerEmailSignin(
      EmailAuthParams params) async {
    try {
      var map = new Map<String, String>();

      map[MaruConstant.email] = params.email;
      map[MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'provider';
      final response = await http.post(MaruConstant.signin, body: map);

      Map res = json.decode(response.body);
      print(res);
      await sharedPrefHelper.savelname("accessToken", res['accessToken']);
      print(res['accessToken']);
      // await sharedPrefHelper.savePassword(res[MaruConstant.id]);
      //   print(res);
      await sharedPrefHelper.savePassword(
        MaruConstant.password,
      );

      await sharedPrefHelper.savelname(
          MaruConstant.last_name, res['last_name']);
      await sharedPrefHelper.saveEmail(res[MaruConstant.email]);
      print("Register Success  ${response.body}");
      return Right(Void);
    } on CognitoClientException catch (e) {
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
  Future<Either<Failure, void>> providerEmailSignup(
      EmailAuthParams params) async {
    try {
      var map = new Map<String, String>();
      map[MaruConstant.first_name] = params.first_name;
      map[MaruConstant.last_name] = params.lName;
      map[MaruConstant.email] = params.email;
      map[MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'provider';
      final response = await http.post(MaruConstant.signup, body: map);
      Map res = json.decode(response.body);
      print(res);
      return Right('Otp sent your register email');
    } on CognitoClientException catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> getTextFile(params) {
    // TODO: implement getTextFile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, GetProvidersModel>> getProviders(text) async {
    try {
      print('api response text $text');
      final response = await http.get(
          Uri.parse ('http://18.191.199.31/api/public/providers?page=1&limit=100&service=$text&rating=',
          ));
      print(text);
print(response.body);
      var data = convert.jsonDecode(response.body);
      var profile = data['provider_profiles'];

    //  print(profile);

      return Right(GetProvidersModel.fromJson(data));
    } on CognitoClientException catch (e) {
      print(e);
      if (e.code == 'UserNotConfirmedException') {
        print(e);
        return Left(UserNotConfirmedFailure(e.message));
        print(e);
      } else {
        print(e);
        return Left(CacheFailure(e.message));
      }
    } catch (e) {
      print(e);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> getReview() async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {
        "access-token":
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0LCJmaXJzdF9uYW1lIjoiTmF2ZGVlcCIsImxhc3RfbmFtZSI6Ikt1bWFyIiwidXNlcl90eXBlIjoicHJvdmlkZXIiLCJlbWFpbCI6Im5hdmRlZXBAeW9wbWFpbC5jb20iLCJ0b2tlbiI6IkdDUUVzIiwicGFzc3dvcmQiOiIkMmEkMDgkZFp3WUE2eEVZdHlHSDhDd3F0dUtrZVp5NnllWnVNNXRTd2Y3dEtwdEsvMFRSWWVVV3AwMWkiLCJvdHAiOiJpdFJiciIsImlzX3ZlcmlmaWVkIjoiMSIsImNyZWF0ZWRBdCI6IjIwMjEtMDgtMTFUMTA6MDA6MjAuMDAwWiIsInVwZGF0ZWRBdCI6IjIwMjEtMTEtMzBUMTA6MzQ6MTUuMDAwWiJ9LCJpYXQiOjE2MzkxMTAxMDYsImV4cCI6MTYzOTE5NjUwNn0.SELp-HJE7GUu27Q3_yPm98niJcPp_iXKI5QPZXjFPHc'
      };
      final response = await http.get(MaruConstant.getReview, headers: headers);
//print(response.body);
      var data = convert.jsonDecode(response.body);

      return Right(Void);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> getProviderRequest() async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {
        "access-token":
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjp7ImlkIjo0LCJmaXJzdF9uYW1lIjoiTmF2ZGVlcCIsImxhc3RfbmFtZSI6Ikt1bWFyIiwidXNlcl90eXBlIjoicHJvdmlkZXIiLCJlbWFpbCI6Im5hdmRlZXBAeW9wbWFpbC5jb20iLCJ0b2tlbiI6IkdDUUVzIiwicGFzc3dvcmQiOiIkMmEkMDgkZFp3WUE2eEVZdHlHSDhDd3F0dUtrZVp5NnllWnVNNXRTd2Y3dEtwdEsvMFRSWWVVV3AwMWkiLCJvdHAiOiJpdFJiciIsImlzX3ZlcmlmaWVkIjoiMSIsImNyZWF0ZWRBdCI6IjIwMjEtMDgtMTFUMTA6MDA6MjAuMDAwWiIsInVwZGF0ZWRBdCI6IjIwMjEtMTEtMzBUMTA6MzQ6MTUuMDAwWiJ9LCJpYXQiOjE2MzkxMTAxMDYsImV4cCI6MTYzOTE5NjUwNn0.SELp-HJE7GUu27Q3_yPm98niJcPp_iXKI5QPZXjFPHc'
      };
      final response =
          await http.get(MaruConstant.getProviderRequest, headers: headers);
//print(response.body);
      var data = convert.jsonDecode(response.body);
      var profile = data['provider_profiles'];
      await _prefHelper.saveStringList('id', profile['id']);
      return Right(Void);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Welcome2>> getSinglePetProfile() async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      final response =
          await http.get(MaruConstant.getProviderRequest, headers: headers);
//print(response.body);
      var data = convert.jsonDecode(response.body);
      print(response.body);
      print(data);
      return Right(Welcome2.fromJson(data));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> uploadVaccineREcord(vacineParams params) async {
    final token = _prefHelper.getStringByKey(
      MaruConstant.token,
      "",
    );
    final image = _prefHelper.getStringByKey(MaruConstant.img, '');
    var headers = {"access-token": token};
    final File imageFile = File(image);
    var stream = http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
    var length = await imageFile.length();
    var request = http.MultipartRequest(
      "POST",
      MaruConstant.vaccineRecordUploaded,
    );
    var multipartFile = http.MultipartFile('doc_url', stream, length,
        filename: basename(imageFile.path));
    request.files.add(multipartFile);
    request
      ..fields['pet_id'] = params.pet_id
      ..fields['doc_url'] = params.doc_url
      ..headers.addAll(headers);
    print('request params ${request.fields.toString()}');
    var response = await request.send();
    final respStr = await response.stream.bytesToString();
    print("respStr respStr respStr:$respStr");
    Map res = json.decode(respStr);
    print(res);
  }

  @override
  Future<Either<Failure, Welcome4>> getProviderById() async {
    try {
      int abc;
      final response = await http.get(Uri.parse(
          'http://18.191.199.31/api/public/provider/${_prefHelper.getIntByKey('id', abc)}'));
//print(response.body);
      var data = convert.jsonDecode(response.body);
//print(data);
//print('dhjkdhjdjkdhjkdhjkdhjkdjbjbbjhjhfjjfhjfhjfhjfhfjhfjhfjfhjfhjfhjfhjfh$data');
      return Right(Welcome4.fromJson(data));
    } on CognitoClientException catch (e) {
      if (e.code == 'UserNotConfirmedException') {
        print(e);
        return Left(UserNotConfirmedFailure(e.message));
        print(e);
      } else {
        print(e);
        return Left(CacheFailure(e.message));
        print(e);
      }
      print(e);
    } catch (e) {
      print(e);
      return Left(CacheFailure(e.toString()));
      print(e);
    }
  }

  @override
  Future<Either<Failure, void>> bookProvider(BookProviderParams params) async {
    try {
      final response =
          await http.post(MaruConstant.providerbookingappointment, body: {
        'pet_id':2,
        'provider_id': 2,
        'booking_date_time':['29 December 2021 20:45'],
        'service_id': 2,
      });

      var data = convert.jsonDecode(response.body);
      print(data);
      return Right(Void);
    } on CognitoClientException catch (e) {
      if (e.code == 'UserNotConfirmedException') {
        print(e);
        return Left(UserNotConfirmedFailure(e.message));
        print(e);
      } else {
        print(e);
        return Left(CacheFailure(e.message));
        print(e);
      }
      print(e);
    } catch (e) {
      print(e);
      return Left(CacheFailure(e.toString()));
      print(e);
    }
  }

  @override
  Future<Either<Failure, UpcomingPastAppointmentModel>> getUpcomingAndPastAppointments(text) async{
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      print('api response text $text');
      final response = await http.get(
          Uri.parse ('http://18.191.199.31/api/bookings/filter?service=$text&date=',
          ),
        headers: headers
      );
      print(text);
      print(response.body);
      var data = convert.jsonDecode(response.body);
      return Right(UpcomingPastAppointmentModel.fromJson(data));
    } on CognitoClientException catch (e) {
      print(e);
      if (e.code == 'UserNotConfirmedException') {
        print(e);
        return Left(UserNotConfirmedFailure(e.message));
        print(e);
      } else {
        print(e);
        return Left(CacheFailure(e.message));
      }
    } catch (e) {
      print(e);
      return Left(CacheFailure(e.toString()));
    }
  }


// print(data);
// var profile = data['reviews'];
// // // print('fklfjeklfjklfj$profile');
// // var index;
// var review_comment = profile[0]['review_comment'];
// var ratings = profile[0]['ratings'];
// // var comapny1 = profile[1]['company_name'];
// // var service2 = profile[1]['rating_reviews'];
// // var image1 = profile[1] [MaruConstant.img];
// // var image = profile[0] [MaruConstant.img];
// // var discription = profile[0] [MaruConstant.description];
// // var operations = profile[0][MaruConstant.operation_hours];
// await sharedPrefHelper.saveString(
// MaruConstant.review_comment, '$review_comment');
// await sharedPrefHelper.saveString(
// MaruConstant.ratings, '$ratings');
// //   await sharedPrefHelper.saveString(MaruConstant.company_name, '$comapny1');
// // await sharedPrefHelper.saveString(
// //     MaruConstant.rating_reviews, '$service2');
// // await sharedPrefHelper.saveString(MaruConstant.img, '$image1');
// // await sharedPrefHelper.saveString(MaruConstant.img, '$image');
// // await sharedPrefHelper.saveString(MaruConstant.company_name, '$comapny');
// // await sharedPrefHelper.saveString(
// //     MaruConstant.rating_reviews, 's$service');
// print('kjhdjkhdjkhjkdhjkdhjkdhjddffffffffffffffh$date');

//    final request =
//          await http.post( MaruConstant.createpProfile,
//   headers: headers,
//   body:{
//      MaruConstant.pet_name: params.petName,
//      MaruConstant.breed_type: params.breedType,
//      MaruConstant.age: params.age,
//      MaruConstant.height: params.height,
//      MaruConstant.weight: params.weight,
//      MaruConstant.birth_date: params.birthDate,
//      MaruConstant.known_allergies: params.knownAllergies,
//      MaruConstant.name:params.name,
//      MaruConstant.note:params.notes,
//    //  MaruConstant.medication: params.medication,
//      MaruConstant.pet_needs: params.petName,
//     // MaruConstant.walking_schedule: params.walkingSchedule,
//      MaruConstant.times_a_day:params.times_a_day,
//      'sex': 'spade',
//      'gender': 'male',
//      'breed_type':'ff',
//    }
//      // map
//    );
//    print('kuch bhi ${request.body.toString()}');
//
//   // request.files.add(await http.MultipartFile.fromPath('img', img));
//    request.headers.addAll(headers);
//    //for completeing the request
// //   var response =await request.send();
//
//    //for getting and decoding the response into json format
//    // var responsed = await http.Response.fromStream(response);
//    // final responseData = json.decode(responsed.body);
//    // print(responseData);
//
//   // // if (response.statusCode==200) {
//   //    print("SUCCESS");
//   //    print(responseData);
//   //  }
//   //  else {
//   //    print("ERROR");
//   //  }
//
//   // http.StreamedResponse response = await request.send();
//
//   // print('ho jayega ${res.statusCode}');
//   //  if (res.statusCode == 200) {
//   //    print(await res.stream.bytesToString());
//   //  } else {
//   //    print(res.reasonPhrase);
//   //  }
//   var profile = data['provider_profiles'];
//   for (int i = 0; i < data['provider_profiles'].length; i++) {
//
//   }
//   var comapny = profile[0]['company_name'];
//   var service = profile[0]['provider'] ['company_name'];
// //print($services)
//   var service2 = profile[1]['rating_reviews'];
//   var image1 = profile[1] ['provider'];
//   var comapny1 = image1[1]['company_name'];
//
//   // [MaruConstant.img];
//   var image = profile[0] [MaruConstant.img];
//   var discription = profile[0] [MaruConstant.description];
//   var operations = profile[0][MaruConstant.operation_hours];
//   await sharedPrefHelper.saveString(
//   MaruConstant.operation_hours, '$operations');
//   await sharedPrefHelper.saveString(
//   MaruConstant.company_name, '$discription');
//   await sharedPrefHelper.saveString(MaruConstant.company_name, '$comapny1');
//   await sharedPrefHelper.saveString(
//   MaruConstant.rating_reviews, '$service2');
//   await sharedPrefHelper.saveString(MaruConstant.img, '$image1');
//   await sharedPrefHelper.saveString(MaruConstant.img, '$image');
//   await sharedPrefHelper.saveString(MaruConstant.company_name, '$comapny');
//   await sharedPrefHelper.saveString(
//   MaruConstant.rating_reviews, 's$service');
// print('kjhdjkhdjkhjkdhjkdhjkdhjddffffffffffffffh$date');

}
