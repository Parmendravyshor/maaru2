import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:maru/core/data/datasource/firebase_auth.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_bookings.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_decline_appointment_request.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/get_upcoming_past_appointments.dart';
import 'package:maru/features/Book_Appointment/domain/usecases/post_review.dart';
import 'package:maru/features/provider_home/domain/use_cases/get_provider_request.dart';
import 'package:maru/features/provider_home/domain/use_cases/get_user.dart';
import 'package:maru/features/verify/domain/usecases/book_a_provider.dart';
import 'package:maru/features/verify/domain/usecases/create_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/get_provider_by_id.dart';
import 'package:maru/features/verify/domain/usecases/get_providers.dart';
import 'package:maru/features/verify/domain/usecases/get_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/upload_vaccine_record.dart';
import 'package:path/path.dart';
import 'package:async/async.dart';
import 'package:dartz/dartz.dart';
import 'package:kiwi/kiwi.dart';
import 'dart:convert' as convert;
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'dart:async';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/forgot/Domain/usecases/reset_password.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/verify_code.dart';

class UserRepositoryImpl implements UserRepository {
  final IAuthFacade iAuthFacade;
  final SharedPrefHelper sharedPrefHelper;
 // final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
final FacebookLogin _facebookLogin;
  UserRepositoryImpl(this.sharedPrefHelper, this.iAuthFacade,this._facebookLogin,
     this._googleSignIn,);

  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();

  @override
  Future<Either<Failure, void>> emailSignup(EmailAuthParams params) async {
    try {
      var map = new Map<String, String>();
      map[MaruConstant.firstName] = params.first_name;
      map[MaruConstant.lastName] = params.lName;
      map[MaruConstant.email] = params.email;
      map[MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'user';
      final response = await http.post(MaruConstant.signup, body: map);
      Map res = json.decode(response.body);
      print(res);
      print(response.statusCode);
      if (response.statusCode == 200) {
        return Right('Otp sent your register email');
      } else {
        return Left(CacheFailure('sss'));
      }
    } on ServerFailure catch (e) {
      return Left(CacheFailure(e.message));
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> emailLogin(EmailAuthParams params,) async {
    try {
      var map = Map<String, String>();

      map[MaruConstant.email] = params.email;
      map[MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'user';
      final response = await http.post(MaruConstant.signin, body: map);

      Map res = json.decode(response.body);
      print(res);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print('dddd');
        await sharedPrefHelper.saveString("accessToken", res['accessToken']);

        print(res['accessToken']);
        //  await sharedPrefHelper.saveIdJwtToken('accessToken');
        // await sharedPrefHelper.savePassword(res[MaruConstant.id]);
        //   print(res);
        await sharedPrefHelper.savePassword(
          MaruConstant.password,
        );

        //  await sharedPrefHelper.savelname(MaruConstant.lastName, res['last_name']);
        await sharedPrefHelper.saveEmail(res[MaruConstant.email]);
        print("Register Success  ${response.body}");
        //  await sharedPrefHelper.saveString( "first_name",res['first_name']);
        await sharedPrefHelper.saveString("first_name", res['first_name']);
        var profile2 = res['id'];
        print(profile2);
        await sharedPrefHelper.saveInt("id", profile2);

        //  print(res['last_name']);
        return Right(Void);
      } else {
        return Left(ApiFailure('aa'));
      }
    } catch (e) {
      print(e);
      return Left(ApiFailure('aa'));
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
      print(response.statusCode);
      if (response.statusCode == 200) {
        return Right(Void);
      } else {
        return Left(ApiFailure('Please enter valid otp'));
      }
    } catch (e) {
      print("Thrown Exception While signing IN:$e");
      return Left(ApiFailure('Please enter valid otp'));
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
  Future<Either<Failure, void>> createPetProfile(PetProfile1 params) async {
    try {
      final img1 = sharedPrefHelper.getStringByKey(MaruConstant.img, '');
      print(img1);
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      print(token);
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
        ..fields[MaruConstant.petName] = params.petName
        ..fields[MaruConstant.breedType] = params.breedType
        ..fields['age'] = params.age
        ..fields[MaruConstant.height] = params.height
        ..fields[MaruConstant.weight] = params.weight
        ..fields[MaruConstant.knownAllergies] = params.knownAllergies
        ..fields[MaruConstant.name] = ''
        ..fields[MaruConstant.note] = params.notes
        ..fields[MaruConstant.petNeeds] = ''
        ..fields[MaruConstant.timesADay] = ''
        ..fields[MaruConstant.sex] = params.sex
        ..fields[MaruConstant.gender] = params.gender
      // ..fields['breed_type'] = 'dff'
        ..fields['birth_date'] = params.birthDate
        ..headers.addAll(headers);
      print('request params ${request.fields.toString()}');
      var response = await request.send();
      final respStr = await response.stream.bytesToString();
      print("respStr respStr respStr:$respStr");
      Map res = json.decode(respStr);
      print(res);
      var profile = res['pet_profile'];
      var profile2 = profile['id'];
      print('sssss$profile2');
      await _prefHelper.saveInt('id', profile2);
      await _prefHelper.saveString(MaruConstant.height, profile['height']);
      await _prefHelper.saveString(MaruConstant.age, profile['age']);
      await _prefHelper.saveString(MaruConstant.petName, profile['pet_name']);
<<<<<<< HEAD
=======

>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
      await _prefHelper.saveString(
          MaruConstant.breedType, profile['breed_type']);
      await _prefHelper.saveString(MaruConstant.weight, profile['weight']);
      await _prefHelper.saveString(MaruConstant.sex, profile['sex']);
      await _prefHelper.saveString(MaruConstant.gender, profile['gender']);
      await _prefHelper.saveString(MaruConstant.img, profile['img']);
      await _prefHelper.saveString(
          MaruConstant.birthdate, profile['birth_date']);

      return Right(Void);
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
  Future<Either<Failure, Welcome>> getPetProfile(String text) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      print(token);
      var headers = {"access-token": token};

      final response = await http.get(
          Uri.parse('http://18.191.199.31/api/pets?pet_name=$text'),
          headers: headers);

      var data = convert.jsonDecode(response.body);
      var data3 = data['pet_profiles'];
      print(data3);
      var data2 = data3[0]['pet_name'];

      print(data2);
      await _prefHelper.saveString('pet_name', data2);
      print('dj sir');
      print(response);
      return Right(Welcome.fromJson(data));
    } catch (e) {
      print('Harinder sir $e');
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> getUpcomingAppointmentUserSide(
      String date) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      final response = await http.get(
          Uri.parse('http://18.191.199.31/api/bookings?type=upcoming$date'),
          headers: headers);
      var data = convert.jsonDecode(response.body);

      print(data);

      print('kjhdjkhdjkhjkdhjkdhjkdhjdh$date');

      return Right(Void);
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetUserProfileMOdel>> getUserProfile() async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      final response = await http.get(
          Uri.parse('http://18.191.199.31/api/user/get-user'),
          headers: headers);
      var data = convert.jsonDecode(response.body);

      print(data);

      return Right(GetUserProfileMOdel.fromJson(data));
    } catch (e) {
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> savePetProfile(PetProfile1 params) async {
    try {
      int abc;
      final token = _prefHelper.gettoken();
      var ss2 = await _prefHelper.getStringByKey(MaruConstant.petName, '');
      print(ss2);
      var age2 = _prefHelper.getStringByKey(MaruConstant.breedType, '');
      print('juikodjhfhjfhjfhfjhfjhfjfhjfhfhfhfjh${age2}');
      var headers = {
        "access-token": token,
      };
      var requetBodyPArams = {
        MaruConstant.petName:
        _prefHelper.getStringByKey(MaruConstant.petName, ''),
        'age': _prefHelper.getStringByKey(MaruConstant.age, ''),
        MaruConstant.height:
        _prefHelper.getStringByKey(MaruConstant.height, ''),
        MaruConstant.weight:
        _prefHelper.getStringByKey(MaruConstant.weight, ""),
        MaruConstant.sex: _prefHelper.getStringByKey(MaruConstant.sex, ''),
        MaruConstant.gender:
        _prefHelper.getStringByKey(MaruConstant.gender, ''),
        MaruConstant.breedType:
        _prefHelper.getStringByKey(MaruConstant.breedType, ''),
<<<<<<< HEAD
        'birth_date': _prefHelper.getStringByKey('birth_date', ''),
        MaruConstant.knownAllergies.toString():
        params.knownAllergies.toString(),
        MaruConstant.petNeeds.toString(): (params.petNeeds.toString() ==null ? '':''),
        MaruConstant.walkingSchedule.toString():
        params.walkingSchedule.toString() ==null?'':'',
        MaruConstant.feedingSchedule.toString():
        params.feedingSchedule.toString()==null?'':'',
        MaruConstant.temperament.toString(): params.temperament.toString()==null?'':'',
        MaruConstant.medication.toString(): params.medication.toString() ==null?'':'',
        MaruConstant.name.toString(): params.name.toString()==null?'':'',
        MaruConstant.name.toString(): params.name.toString()==null?'':'',
        MaruConstant.timesADay.toString(): params.times_a_day.toString()==null?'':'',
        MaruConstant.note.toString(): params.notes.toString()==null?'':'',
=======
        'birth_date': _prefHelper.getStringByKey(MaruConstant.birthdate, ''),
        MaruConstant.knownAllergies.toString():
        params.knownAllergies.toString(),
        MaruConstant.petNeeds.toString(): params.petNeeds.toString(),
        MaruConstant.walkingSchedule.toString():
        params.walkingSchedule.toString(),
        MaruConstant.feedingSchedule.toString():
        params.feedingSchedule.toString(),
        MaruConstant.temperament.toString(): params.temperament.toString(),
        MaruConstant.medication.toString(): params.medication.toString(),
        MaruConstant.name.toString(): params.name.toString(),
        MaruConstant.name.toString(): params.name.toString(),
        MaruConstant.timesADay.toString(): params.times_a_day.toString(),
        MaruConstant.note.toString(): params.notes.toString(),
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
      };
      var petid3 = _prefHelper.getIntByKey('id', abc);
      print('dhjddd$petid3');
      print('ddddd$petid3');
      var request = http.MultipartRequest(
          'PUT', Uri.parse('http://18.191.199.31/api/pets/$petid3'));
      request.fields.addAll(requetBodyPArams);
      print('request params ${requetBodyPArams.toString()}');
      request.headers.addAll(headers);
      http.StreamedResponse response = await request.send();
      print('request params ${request.fields.toString()}');
      final respStr = await response.stream.bytesToString();
      print("respStr respStr respStr:$respStr");

      return const Right(Void);
    } catch (e) {
      print('exception$e');
      return Left(CacheFailure(e.toString()));
      print('exception$e');
    }
  }

  @override
  Future<Either<Failure, void>> saveUserProfile(
      UserProfileParams params) async {
    try {
      final image = _prefHelper.getStringByKey(MaruConstant.img, '');
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      final File imageFile = File(image);
      var stream =
      http.ByteStream(DelegatingStream.typed(imageFile.openRead()));
      var length = await imageFile.length();
      var request = http.MultipartRequest(
        "Put",
        MaruConstant.createUserProfile,
      );
      var multipartFile = http.MultipartFile('img', stream, length,
          filename: basename(imageFile.path));
      request.files.add(multipartFile);
      request
        ..fields[MaruConstant.firstName] = params.fname
        ..fields[MaruConstant.lastName] = params.lname
        ..fields[MaruConstant.phoneNO] = params.phone
        ..fields[MaruConstant.city] = params.city
        ..fields[MaruConstant.state] = params.state
        ..fields[MaruConstant.zipcode] = params.zipCode
        ..headers.addAll(headers);
      print('request params ${request.fields.toString()}');
      var response = await request.send();
      print(response);
      final respStr = await response.stream.bytesToString();
      print("respStr respStr respStr:$respStr");
      Map res = json.decode(respStr);
      var res2 = res['user_profile'];
      _prefHelper.saveString(MaruConstant.img, res2['img']);
      _prefHelper.saveString('first_name', res2['first_name']);
      _prefHelper.saveString('last_name', res2['last_name']);
      _prefHelper.saveString('phone_no', res2['phone_no']);
      _prefHelper.saveString('city', res2['city']);
      print(res);

      return const Right(Void);
    } catch (e) {
      print('exception2$e');
      return Left(CacheFailure(e.toString()));
      print('exception$e');
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
      var map = Map<String, String>();
      map[MaruConstant.otp] = params.code;
      map[MaruConstant.email] = params.email;
      // map[ MaruConstant.email] = params.email;
      final response = await http.post(MaruConstant.verify, body: map);
      print("Register Success  ${response.body}");
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
  Future<Either<Failure, FetchCardDetailsModel>> getUserPayment() async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};

      final response = await http.get(
        MaruConstant.saveUserPayment,
        headers: headers,
      );

      var data = convert.jsonDecode(response.body);

      print(data);

      return Right(FetchCardDetailsModel.fromJson(data));
    } catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> saveUserPayment(PaymentParams params) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );

      var headers = {"access-token": token};
      var map = Map<String, dynamic>();
      map['bank_name'] = '';
      map['card_holder_name'] = params.cardHolderName;
      map['card_number'] = params.cardNumber.replaceAll(' ', '');
      map['expiration_date'] = params.expirationDate;

      final response = await http.post(MaruConstant.saveUserPayment,
          headers: headers, body: map);
      print("Register Success  ${response.body}");
      print(map);

      return Right(Void);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
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
      var map = Map<String, String>();
      map[MaruConstant.email] = email;
      final response = await http.post(MaruConstant.forgetverify, body: map);
      print("Register Success  ${response.body}");

      if (response.statusCode == 200) {
        sharedPrefHelper.saveIdJwtToken(
          MaruConstant.token,
        );
        return Right(Void);
      }
    } catch (e) {
      print("Thrown Exception While signing IN:$e");
      throw e;
    }
  }

  @override
  Future<Either<Failure, void>> createUserProfile(UserProfile1 params) {
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
      var map = Map<String, dynamic>();

      map[MaruConstant.current_password] = params.oldPassword;
      map[MaruConstant.change_password] = params.NewPassword;
      final response = await http.put(MaruConstant.changePassword,
          headers: headers, body: map);
      print("Register Success  ${response.body}");

      if (response.statusCode == 200) {
        sharedPrefHelper.saveIdJwtToken(
          MaruConstant.token,
        );
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
      var data2 = res['last_name'];
      print('sssss$data2');
      print(res);
      await sharedPrefHelper.saveString("accessToken", res['accessToken']);
      print('tokenForChecking${res['accessToken']}');
      await sharedPrefHelper.savePassword(
        MaruConstant.password,
      );
      await sharedPrefHelper.saveString('is_verified', res['is_verified']);
      await sharedPrefHelper.saveString('last_name', res['last_name']);
      await sharedPrefHelper.saveEmail(res[MaruConstant.email]);
      var profile2 = res['id'];
      print(profile2);
      await sharedPrefHelper.saveInt("id", profile2);
      print("Register Success  ${response.body}");
      return Right(Void);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> providerEmailSignup(
      EmailAuthParams params) async {
    try {
      var map = new Map<String, String>();
      map[MaruConstant.firstName] = params.first_name;
      map[MaruConstant.lastName] = params.lName;
      map[MaruConstant.email] = params.email;
      map[MaruConstant.password] = params.password;
      map[MaruConstant.user_type] = 'provider';
      final response = await http.post(MaruConstant.signup, body: map);
      Map res = json.decode(response.body);
      print(res);
      return Right('Otp sent your register email');
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
      final response = await http.get(Uri.parse(
        'http://18.191.199.31/api/public/providers?page=1&limit=100&service=$text&rating=',
      ));
      print(text);
      print(response.body);
      var data = convert.jsonDecode(response.body);
      var profile = data['provider_profiles'];

      //  print(profile);

      return Right(GetProvidersModel.fromJson(data));
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
  Future<Either<Failure, GetProviderRequestModel>> getProviderRequest(
      SearchRequestProviderParams params) async {
    try {
      print('alfa${params.service}');
      print('beata${params.name}');
      print('gama${params.provider}');
      print('alfa${params.date}');

      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      final response = await http.get(
          Uri.parse(
              'http://18.191.199.31/api/bookings/appointment-requests?name=${params
                  .name}&service=${params.service}&provider=${params
                  .provider}&date=${params.date}&page=1&limit=100'),
          headers: headers);
      print(response.body);
      var data = convert.jsonDecode(response.body);
      print(data);
      return Right(GetProviderRequestModel.fromJson(data));
    } catch (e) {
      print('get requet error $e');
      return Left(ApiFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Welcome2>> getSinglePetProfile(int id1) async {
    try {
<<<<<<< HEAD
      print('sssssr$id1');
=======
      print('sssssr$id');
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );

      var headers = {"access-token": token};

      final response = await http.get(
          Uri.parse('http://18.191.199.31/api/pets/$id1'),
          headers: headers);
//print(response.body);
      var data = convert.jsonDecode(response.body);
<<<<<<< HEAD
      var data2 = data['pet_profile'];
      var data3 = data2['id'];
      print('naka${data2}');
    //  print(response.body);
      var height;
      await _prefHelper.saveString(MaruConstant.height, data2[height].toString().isEmpty?'':'');
      await _prefHelper.saveInt('id', data3);
      await _prefHelper.saveInt(MaruConstant.age, data2['age']);
      await _prefHelper.saveString(
         'breed_type', data2['breed_type']);
      await _prefHelper.saveInt('weight', data2['weight']);
      await _prefHelper.saveString('sex', data2['sex']);
      await _prefHelper.saveString('gender', data2['gender']);
      await _prefHelper.saveString('birth_date', data2['birth_date']);
      await _prefHelper.saveString(MaruConstant.img, data2['img'].toString().isEmpty?'':'');
      await _prefHelper.saveString(MaruConstant.knownAllergies, data2['known_allergies'].toString().isEmpty?'':'');
      await _prefHelper.saveString('pet_needs', data2['pet_needs'].toString().isEmpty?'':'');
      await _prefHelper.saveString('walking_schedule', data2['walking_schedule'].toString().isEmpty?'':'');
      await _prefHelper.saveString('feeding_schedule', data2['feeding_schedule'].toString().isEmpty?'':'');
      await _prefHelper.saveString('temperament', data2['temperament'].toString().isEmpty?'':'');
      await _prefHelper.saveString('medication', data2['medication'].toString().isEmpty?'':'');
    //  await _prefHelper.save('walking_schedule', data2['walking_schedule'].toString());
   //   await _prefHelper.saveString('feeding_schedule', data2['feeding_schedule'].toString());
      await _prefHelper.saveString(
          'birth_date', data2['birth_date']);
      ///
   //    var a;
   //    var b;
   //    var c;
   // print('ddddd ${ _prefHelper.getIntByKey(MaruConstant.height, a)}');
   //    print('ddddd${ _prefHelper.getIntByKey(MaruConstant.age, b)}');
   //  print('ddddd${   _prefHelper.getStringByKey(MaruConstant.petName,'')}');
   //  print('ssss${   _prefHelper.getStringByKey(
   //        MaruConstant.breedType,'')}');
   //  print('gudigdjhff${   _prefHelper.getIntByKey(MaruConstant.weight, c)}');
   //    print('dfjhfjf${ _prefHelper.getStringByKey(MaruConstant.sex, '')}');
   // print('dddd${   _prefHelper.getStringByKey(MaruConstant.gender, '')}');
   //    print(_prefHelper.getStringByKey(MaruConstant.img, ''));
   //     _prefHelper.getStringByKey(
   //        MaruConstant.birthdate, '');
      print(data);
      return Right(Welcome2.fromJson(data));
    } catch (e) {
      print('djdlkdkdjkdjkdjkdbdjk$e');
=======
      print(response.body);
      print(data);
      return Right(Welcome2.fromJson(data));
    } catch (e) {
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
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
  Future<Either<Failure, Welcome4>> getProviderById(int id1) async {
    try {
      final response = await http
<<<<<<< HEAD
          .get(Uri.parse('http://18.191.199.31/api/public/provider/$id1'));
=======
          .get(Uri.parse('http://18.191.199.31/api/public/provider/4'));
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
//print(response.body);
      Map data = convert.jsonDecode(response.body);
      print(data);
//print('dhjkdhjdjkdhjkdhjkdhjkdjbjbbjhjhfjjfhjfhjfhjfhfjhfjhfjfhjfhjfhjfhjfh$data');
      return Right(Welcome4.fromJson(data));
    } catch (e) {
      print(e);
      return Left(CacheFailure(e.toString()));
      print(e);
    }
  }

  @override
  Future<Either<Failure, void>> bookProvider(BookProviderParams params) async {
    try {
      var map = new Map<String, dynamic>();
      map['pet_id'] = params.pet_id.toString();
      map['provider_id'] = params.provider_id.toString();
      map['booking_date'] = params.booking_date.toString();
      map['service_id'] = params.service_id.toString();
<<<<<<< HEAD
      map['card_number'] = params.cardno ==null?'': params.cardno.replaceAll(' ', '');
      map['exp_date'] = params.expdate.toString();
      map['booking_time'] = params.bookingTime.toString();
      map['card_id'] = params.cardid2.toString();
=======
      map['card_number'] = params.cardno.replaceAll(' ', '');
      map['exp_date'] = params.expdate.toString();
      map['booking_time'] = params.bookingTime.toString();
      map['card_id'] = params.cardId.toString();
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
      map['cvv'] = params.cvv.toString();
      map['card_holder_name'] = params.cardHolderName.toString();
      print('singh${map}');
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      final response = await http.post(MaruConstant.providerbookingappointment,
          body: map, headers: headers);
<<<<<<< HEAD
      print(map);
      Map data1 = jsonDecode(response.body);
      print('singh${response.body}');
=======
      Map data1 = jsonDecode(response.body);
      print('singh${response.body}');
      print('tomer${data1}');
      var date2 = data1['data'];
      print(date2);
      print(response.statusCode);
      var user_id;
      var date3 = date2[0];
      print('singham${date3}');
      if (response.statusCode == 200) {
        await _prefHelper.saveString(
            'booking_id', date3['booking_id'].toString());
        await _prefHelper.saveString(
            'booking_id', date3['booking_id'].toString());
        await _prefHelper.saveString(
            'booking_date', date3['booking_date'].toString());
        await _prefHelper.saveString(
            'booking_time', date3['booking_time'].toString());
        await _prefHelper.saveString(
            'service_name', date3['service_name'].toString());
        await _prefHelper.saveString(
            'total_amount', date3['total_amount'].toString());
        await _prefHelper.saveString(
            'pet_image', date3['pet_image'].toString());
        await _prefHelper.saveString(
            'company_name', date3['company_name'].toString());
        await _prefHelper.saveString(
            'company_city', date3['company_city'].toString());
        await _prefHelper.saveString(
            'company_state', date3['company_state'].toString());
        await _prefHelper.saveString(
            'company_zip_code', date3['company_zip_code'].toString());
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
        if (response.statusCode == 200) {
          print(data1);
          print(response.statusCode);
          return Right(Void);
<<<<<<< HEAD

      } else {
        print(response.statusCode);
=======
        }
      } else {
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
        return Left(CacheFailure('Slot are Book Please Change date Or time'));
      }
    } catch (e) {
      print(e);
      return Left(CacheFailure(e.toString()));
      print(e);
    }
  }

  @override
  Future<Either<Failure, UpcomingPastAppointmentModel>>
  getUpcomingAndPastAppointment(UpcomingBooking params) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      final response = await http.get(
          Uri.parse(
            'http://18.191.199.31/api/bookings/filter?service=${params
                .serviceName}&date=${params.bookingDate}',
          ),
          headers: headers);
      print(response.body);
      var data = convert.jsonDecode(response.body);
      print(data);
      return Right(UpcomingPastAppointmentModel.fromJson(data));
    } catch (e) {
      print('singh $e');
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> postReview(UserReviewParamsMOdel params) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};

      final response = await http.post(
          Uri.parse('http://18.191.199.31/api/bookings/review'),
          headers: headers,
          body: {
            'provider_id': params.Comment,
            'booking_id': params.bookingId,
            'commment': params.Comment,
            'rating': params.rating,
          });
      print(response.body);
      var data = convert.jsonDecode(response.body);
      return Right(UpcomingPastAppointmentModel.fromJson(data));
    } catch (e) {
      print(e);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> doPayment(PaymentParams params) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};

      final response = await http.post(
          Uri.parse(
            'http://18.191.199.31/api/user/payment',
          ),
          headers: headers,
          body: {
            'account_no': params.cardNumber,
            'exp_month': params.exp_month,
            'exp_year': params.exp_year,
            'cvc': params.cvc,
            'amount': params.amount,
            'description': params.description
          });

      print(response.body);
      return Right(Void);
    } catch (e) {
      print(e);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> acceptRquest(int value) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};

      final response = await http.get(
        Uri.parse(
          'http://18.191.199.31/api/bookings/provider/accept/$value',
        ),
        headers: headers,
      );
      var data = jsonDecode(response.body);
      print(data);
      print(response.body);
      return Right(Void);
    } catch (e) {}
  }

  @override
  Future<Either<Failure, void>> declineRequest(int value) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};

      final response = await http.get(
        Uri.parse(
          'http://18.191.199.31/api/bookings/provider/decline/$value',
        ),
        headers: headers,
      );
      var data = jsonDecode(response.body);
      print(data);
      print(response.body);
      return Right(Void);
    } catch (e) {}
  }

  @override
  Future<Either<Failure, GetAllAppointmentProvider>>
  getUpcomingPastAndDeclineAppointment(SearchParams params) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      final response = await http.get(
          Uri.parse(
            'http://18.191.199.31/api/bookings/appointment-filter?name=${params
                .text1}&service=${params.text1}&date=${params
                .date}&page=1&limit=8',
          ),
          headers: headers);
      print(response.body);
      var data = convert.jsonDecode(response.body);
      print(data);
      return Right(GetAllAppointmentProvider.fromJson(data));
    } catch (e) {
      print(e);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> bookProviderCancel(String id1) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      final response = await http.get(
          Uri.parse(
            'http://18.191.199.31/api/bookings/cancel-booking/$id1',
          ),
          headers: headers);
      print(response.body);
      var data = convert.jsonDecode(response.body);
      print(data);
      return Right(Void);
    } catch (e) {
      print(e);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, GetUserModel>> getUsers() async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      final response = await http.get(
          Uri.parse(
            'http://18.191.199.31/api/company/customers?page=1&limit=100',
          ),
          headers: headers);
      print(response.body);
      var data = convert.jsonDecode(response.body);
      print(data);
      return Right(GetUserModel.fromJson(data));
    } catch (e) {
      print(e);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, Bookingsss>> getBookingss(id1) async {
    try {
      final token = _prefHelper.getStringByKey(
        MaruConstant.token,
        "",
      );
      var headers = {"access-token": token};
      final response = await http.get(
          Uri.parse(
            'http://18.191.199.31/api/public/booking/3',
          ),
          headers: headers);
      print(response.body);
      var data = convert.jsonDecode(response.body);
      print(data);
      return Right(Bookingsss.fromJson(data));
    } catch (e) {
      print(e);
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> googleSignup() async{
    try {
      final googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return left( ServerFailure('ss'));
      }
<<<<<<< HEAD
      GoogleSignIn _google;
      _google = googleUser as GoogleSignIn;
=======
>>>>>>> b97480d9783e56d23a544ec0d168ea94f68a671a
      final googleAuthentication = await googleUser.authentication;
      final authCredential = GoogleAuthProvider.credential(
        idToken: googleAuthentication.idToken,
        accessToken: googleAuthentication.accessToken,
      );

      await FirebaseAuth.instance.signInWithCredential(authCredential);
      print(authCredential.accessToken);
      print(authCredential.providerId);
      return right(Void);
    } on FirebaseAuthException catch (_) {

      return left(ServerFailure('ss'));
    } catch(e){
      print(e);
    }
  }

  @override
  Future<Either<Failure, void>> fbSignIn()async {
    try {

      final fbUser = await _facebookLogin.logIn([]);
      if (fbUser == null) {
        return left( ServerFailure('ss'));
      }
      final fbAuthenticate = await _facebookLogin.logIn([]);
      final authCredential = FacebookAuthProvider.credential('');
      //  final fbAuthenticate = await fbUser.accessToken;
   //   final authCredential = FacebookAuthProvider.PROVIDER_ID

      await FirebaseAuth.instance.signInWithCredential(authCredential);
      print(authCredential.accessToken);
      print(authCredential.providerId);
      return right(Void);
    } on FirebaseAuthException catch (_) {

      return left(ServerFailure('ss'));
    } catch(e){
      print(e);
    }
  }
}