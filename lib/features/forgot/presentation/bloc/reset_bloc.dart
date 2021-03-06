
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/forgot/Domain/usecases/forget_password.dart';
import 'package:maru/features/forgot/Domain/usecases/reset_password.dart';
import 'package:maru/features/forgot/Domain/usecases/send_reset_otp.dart';
import 'package:maru/features/verify/presentation/bloc/verify_state.dart';

import 'reset_event.dart';
import 'reset_state.dart';
//import 'package:fluttertoast/fluttertoast.dart';

/// Bloc for Register page
///
class ResetBloc extends Bloc<ResetEvent, ResetState> {
  final ForgetPassword _forgetPassword;
  final SendResetPasswordOtp _sendResetPwdOtp;
  final ResetPassword _resetpwd;
  ResetBloc(this._sendResetPwdOtp, this._resetpwd,this._forgetPassword) : super();
  String name = "";
  String email = "";
  String password = "";
  int step = 1;
  @override
  // TODO: implement initialState
  ResetState get initialState => ResetInitial();

  @override
  Stream<ResetState> mapEventToState(ResetEvent event) async* {
    if (event is EmailChanged) {
      if (event.email.isNotEmpty && validateEmail(email) != null) {
        email = event.email;
        yield ResetFormValidationSuccess();
      } else {
        email = "";
        yield ResetFormValidationFailure();
      }
    } else if (event is ResetButtonTapped) {
      yield ResetInProgress();
      final result = await _sendResetPwdOtp.call(email);
      yield* result.fold((l) async* {
        yield ResetFailure(
            "Enter Register email");
      },

              (r) async* {

                step = 2;
                yield ResetPasswordMessageSent(
                    "Password reset link sent to your email");
              });


    } else if (event is SetNewPasswordTapped) {
      yield ResetInProgress();
      final result = await _resetpwd.call(SetNewPasswordParams(
          email: email, otp: event.otp, password: event.password));
      yield* result.fold((l) async* {
        yield ResetFailure(
            "Failed to send reset password link..please try again.");
      }, (r) async* {
        step = 2;
        yield PasswordResetSuccess(
            "Password reset link sent to your email");
      });
    }
    else if (event is ForgetVerify) {
      yield VerifyInProgress();
      final res = await _forgetPassword(event.email);
      if (res.isRight()) {
        yield ResendOtpSuccesss();
      } else {
        yield ResetFailure("Resend OTP failed.. please try again later");
      }
    }
  }
  }



