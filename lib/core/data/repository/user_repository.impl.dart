import 'dart:ffi';




import 'package:amazon_cognito_identity_dart_2/cognito.dart';
import 'package:dartz/dartz.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'dart:convert';

import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/repository/user_repository.impl.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/icons.dart';
import 'package:maru/core/widget/logo.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/login/presentation/login_screen.dart';

import 'dart:ffi';
import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import 'package:amazon_cognito_identity_dart_2/cognito.dart';

import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/auth_source.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/register/domain/usecases/email_signup.dart';
import 'package:maru/features/register/presentation/register_bloc.dart';
import 'package:maru/features/register/presentation/register_bloc.dart';

import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/verify_code.dart';
import 'package:flutter/scheduler.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as https;
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';

import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/auth_source.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/domain/repositories/user_repository.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/error/exception.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/error/registration_failure.dart';
import 'package:maru/features/Account_setting/domain/usecases/save_user_payment.dart';
import 'package:maru/features/register/presentation/register_bloc.dart';
import 'package:maru/features/verify/domain/usecases/save_pet_profile.dart';
import 'package:maru/features/verify/domain/usecases/save_user_profile.dart';
import 'package:maru/features/verify/domain/usecases/verify_code.dart';

class UserRepositoryImpl implements UserRepository {
  final AuthSource authSource;
  final SharedPrefHelper sharedPrefHelper;

  UserRepositoryImpl(this.authSource, this.sharedPrefHelper);

  @override
  Future<Either<Failure, void>> emailSignup(EmailAuthParams params) async {
    try {
      var url = Uri.parse("http://18.191.199.31/api/auth/signup");

      var response = await http.post(
          MaruConstant.signup, body: { MaruConstant.fName: params.fName,
        MaruConstant.lName: params.lName,
        MaruConstant.email: params.email,
        MaruConstant.password: params.password
        ,
        'jwttoken': sharedPrefHelper.getIdJwtToken(),
      });

      print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
      // var jsonResponse = convert.jsonDecode(response.body);
      // // saveRegistrationId();
      // print("emailSignup $jsonResponse ${response.request.url}");
      // if (response == 200) {
      //   print(response.body);


        return
          Right(UnknownFailure("Invalid OTP code"));;
    //  }
      // else {
      //   return Left(UnknownFailure("Invalid send code"));
      // }

    }
    on CognitoClientException catch (e) {
      if (e.code == 'UserNotConfirmedException') {
        return Left(UnknownFailure("Invalid OTP code"));
      } else {
        return Left(UnknownFailure("Invalid OTP code"));
      }
    } catch (e) {
      return Left(UnknownFailure("Invalid OTP code"));
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
