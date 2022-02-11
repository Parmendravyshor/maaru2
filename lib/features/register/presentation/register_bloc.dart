import 'dart:async';
import 'dart:core';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/provider_register/domain/usecases/provider_email_register.dart';
import 'package:maru/features/register/domain/usecases/email_signup.dart';
import 'package:maru/features/register/domain/usecases/google_signup.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final EmailSignup _emailSignup;
  final GoogleSignups googleSignup;
  final ProviderEmailSignUp _providerEmailSignUp;
  String first_name = "";
  String lname = "";
  String email = "";
  String password = "";


  @override
  RegisterBloc(this._emailSignup, this._providerEmailSignUp, this.googleSignup)
      : super();

  @override
  RegisterState get initialState => RegisterInitial();

  @override
  Stream<RegisterState> mapEventToState(RegisterEvent event) async* {
    if (event is FNameChanged) {
      if (event.name.isNotEmpty) {
        first_name = event.name;
      } else {
        first_name = "";
      }
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    } else if (event is LNameChanged) {
      if (event.name.isNotEmpty) {
        lname = event.name;
      } else {
        lname = "";
      }
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    } else if (event is EmailChanged) {
      if (event.email.isNotEmpty && validateEmail(email) != null) {
        email = event.email;
      } else {
        email = "";
      }
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    } else if (event is PasswordChanged) {
      if (event.password.isNotEmpty && event.password.length > 8) {
        password = event.password;
      } else {
        password = "";
      }
      bool isValidated = _isFormValid();
      if (isValidated) {
        yield RegisterFormValidationSuccess();
      } else {
        yield RegisterFormValidationFailure();
      }
    } else if (event is RegisterButtonTapped) {
      yield RegisterInProgress();
      final result = await _emailSignup.call(EmailAuthParams(
          email: email,
          password: password,
          first_name: first_name,
          lName: lname));
      yield* result.fold((l) async* {
        if (l is ServerFailure) {
          yield RegisterFailure("Signup failed..please try again.. $l");
        } else {
          yield RegisterFailure("Signup failed..please try again.. $l");
        }
      }, (r) async* {
        yield RegisterSuccess();
      });
    } else if (event is ProviderRegisterButtonTapped) {
      yield RegisterInProgress();
      final result = await _providerEmailSignUp(EmailAuthParams(
          email: email,
          password: password,
          first_name: first_name,
          lName: lname));
      yield* result.fold((l) async* {
        yield RegisterFailure("Signup failed..please try again.. $l");
      }, (r) async* {
        yield RegisterSuccess();
      });
    }
    else if (event is GoogleSignupButtonTapped) {
      yield GoogleRegisterInProgress();
      final result = googleSignup(NoParams());
      yield GoogleRegisterSuccess();
      yield GoogleRegisterFailure('something went wrong');
    }

  else if( event is FacebookSignupButtonTapped){
  yield fbRegisterInProgress();
  final result = googleSignup(NoParams());
  yield fbRegisterSuccess();
  yield fbRegisterFailure('something went wrong');
  }
}

  bool _isFormValid() {
    return first_name.isNotEmpty &&
        lname.isNotEmpty &&
        email.isNotEmpty &&
        password.isNotEmpty;
  }
}
