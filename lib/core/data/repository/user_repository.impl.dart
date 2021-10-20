

import 'dart:ffi';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dartz/dartz.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/auth_source.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/verify_code.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthSource authSource;
  final SharedPrefHelper sharedPrefHelper;

  UserRepositoryImpl(this.authSource, this.sharedPrefHelper);

  // @override
  // Future<Either<Failure, Void>> emailLogin(EmailAuthParams params) {
  //   // TODO: implement emailLogin
  //   throw UnimplementedError();
  // }

   Future<Either<Failure, void>> emailSignup(EmailAuthParams params) async {
    // try {
    //   final result = await http.post(
    //     Uri.https(MaruConstant.BaseUrl, "emailSignup"),
    //     headers: <String, String>{
    //       'Content-Type': 'application/json; charset=UTF-8',
    //     },
    //     body: jsonEncode(<String, String>{
    //       'jwttoken': sharedPrefHelper.getIdJwtToken(),
    //     }),
    //   );
    //   var jsonResponse = convert.jsonDecode(result.body);
    // // saveRegistrationId();
    //   print("emailSignup $jsonResponse ${result.request.url}");
    //   if (result.statusCode == 200) {
    //
    //   }
    //   return Right(Void);
    // } catch (e) {
    //   return Left(ApiFailure(e.toString()));
    // }
     try {
       var url = Uri.parse("$BASE_URL/signup");
       var response = await http.post(url, body: {'jwttoken': sharedPrefHelper.getIdJwtToken(),});
       print('Response status: ${response.statusCode}');
       print('Response body: ${response.body}');
       Map Void = json.decode(response.body);


       return Right(Void);
     } catch (e) {
       print("Thrown Exception While signing Up:$e");
       throw e;
     }
  }



  @override
  Future<Either<Failure, void>> resendOtp(String email) {
    // TODO: implement resendOtp
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> sendPasswordResetEmail(String email) {
    // TODO: implement sendPasswordResetEmail
    throw UnimplementedError();
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
  Future<Either<Failure, void>> createPetProfile() {
    // TODO: implement createPetProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> createUserProfile() {
    // TODO: implement createUserProfile
    throw UnimplementedError();
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
  Future<Either<Failure, void>> savePetProfile(PetProfileParams params) {
    // TODO: implement savePetProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> saveUserProfile(UserProfileParams params) {
    // TODO: implement saveUserProfile
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> setNewPassword(
      {String email, String otp, String password}) {
    // TODO: implement setNewPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, void>> verifyCode(VerifyParams params) {
    // TODO: implement verifyCode
    throw UnimplementedError();
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
  Future<Either<Failure, void>> saveUserPayment(PaymentParams params) {
    // TODO: implement saveUserPayment
    throw UnimplementedError();
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
  Future<Either<Failure, void>> emailLogin(EmailAuthParams params) {
    // TODO: implement emailLogin
    throw UnimplementedError();
  }
}
