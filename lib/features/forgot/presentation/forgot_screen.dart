
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/theme/style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/logo.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/forgot/presentation/bloc/reset_event.dart';
import 'package:maru/features/login/presentation/login_screen.dart';

import 'bloc/reset_bloc.dart';
import 'bloc/reset_state.dart';

class ResetPasswordScreen extends StatefulWidget {
  @override
  ResetWidget createState() => ResetWidget();
}

/// Main Widget that decides either to show Login Scree screen or Forgot password
class ResetWidget extends State<ResetPasswordScreen> {
  TextEditingController _passwordController;

  TextEditingController _emailController;
  TextEditingController _otpController;

  @override
  void initState() {
    _passwordController = TextEditingController();
    _emailController = TextEditingController();

    _otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();

    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KiwiContainer().resolve<ResetBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFffffff),
        body: SafeArea(
          child: Column(
            children: [
              Flexible(
                flex: 15,
                child:
                SingleChildScrollView(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: MaaruStyle.colors.cardbg,
                    child: BlocBuilder<ResetBloc, ResetState>(
                      builder: (context, state) {
                        int step = BlocProvider.of<ResetBloc>(context).step;

                        if (state is ResetPasswordMessageSent && step == 1) {
                          AlertManager.showSuccessMessage(
                              state.message, context);
                        }

                        if (state is PasswordResetSuccess && step == 2) {
                          SchedulerBinding.instance.addPostFrameCallback((_) {
                            Navigator.pushReplacement(context,
                                MaterialPageRoute(
                                    builder: (BuildContext context) {
                                      return LoginScreen();
                                    }));
                          });
                          return Container();
                        }
                        if (state is PasswordResetFailure && step == 2) {
                          AlertManager.showErrorMessage(state.message, context);
                        }
                        return step == 1
                            ?
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Container(
                                  margin:const EdgeInsets.only(top: 80),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Logo())),

                              const   SizedBox(
                                height: 10,
                              ),

                              const  SizedBox(
                                height: 20,
                              ),
                              ThemedTextField(
                                  "Email", TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  onChanged: (text) {
                                    BlocProvider.of<ResetBloc>(context)
                                        .add(EmailChanged(text));
                                  }, editingController: _emailController),
                              const SizedBox(
                                height: 20,
                              ),
                              ThemedButton(
                                  text: "Send Otp",
                                  onPressed: () {
                                    if (state
                                    is ResetFormValidationSuccess) {
                                      BlocProvider.of<ResetBloc>(context)
                                          .add(ResetButtonTapped());
                                    }
                                  },
                                  enabled: true),
                             const SizedBox(
                                height: 10,
                              ),
                              state is ResetInProgress
                                  ? Center(
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    width: 40,
                                    height: 40,
                                    child: CircularProgressIndicator(),
                                  ))
                                  : Container(),
                            ],
                          ),
                        )
                            : Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(top: 80),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child:Container(
                                        alignment: Alignment.center,
                                       // height: size.height * 0.4,
                                        // width: size.width * 0.9,

                                        child: Image.asset(
                                          "assets/icons/MARU_Logo_B2_Horizontal_03 copy.png",
                                          width: 200,
                                        ),
                                        //  fit: BoxFit.cover,
                                      ))),
                              Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Set New",
                                        style: MaaruStyle.text.medium,
                                      ))),
                              Container(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Password",
                                        style: MaaruStyle.text.medium,
                                      ))),
                              SizedBox(
                                height: 10,
                              ),

                              SizedBox(
                                height: 20,
                              ),
                              ThemedTextField(
                                  "Email", TextInputType.emailAddress,
                                  onChanged: (text) {
                                    BlocProvider.of<ResetBloc>(context)
                                        .add(EmailChanged(text));
                                  }, editingController: _emailController),
                              ThemedTextField("Otp", TextInputType.number,
                                  onChanged: (text) {},
                                  editingController: _otpController),
                              ThemedTextField("Enter new password",
                                  TextInputType.text,
                                  onChanged: (text) {},
                                  editingController: _passwordController),

                              SizedBox(
                                height: 10,
                              ),
                              ThemedButton(
                                  text: "Set New Password",
                                  onPressed: () {
                                    String otp = _otpController.text;
                                    String password =
                                        _passwordController.text;

                                    if (otp.length < 4) {
                                      AlertManager.showErrorMessage(
                                          "Invalid OTP", context);
                                    } else if (password.length < 8) {
                                      AlertManager.showErrorMessage(
                                          "Password should be of minimum 8 characters",
                                          context);
                                    }
                                    else {
                                      BlocProvider.of<ResetBloc>(context)
                                          .add(SetNewPasswordTapped(
                                          otp, password));
                                    }
                                  },
                                  enabled: true),
                              SizedBox(
                                height: 10,
                              ),
                              ThemedButton(
                                  text: "Resend Otp",
                                  onPressed: () {
                                    if (state
                                    is ResetFormValidationSuccess) {
                                      BlocProvider.of<ResetBloc>(context)
                                          .add(ResetButtonTapped());
                                    }
                                  },
                                  enabled: true),
                              SizedBox(
                                height: 10,
                              ),
                              state is ResetInProgress
                                  ? Center(
                                  child: Container(
                                    margin: EdgeInsets.only(bottom: 10),
                                    width: 40,
                                    height: 40,
                                    child: CircularProgressIndicator(),
                                  ))
                                  : Container(),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  decoration: new BoxDecoration(
                      border: Border.all(
                        color: MaaruStyle.colors.borderColor,
                        width: 1,
                      ),
                      color: MaaruStyle.colors.bottomBg),
                  child: Center(
                    child: GoToSignInText(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Text for showing at bottom of screen
/// Tapping on it should take user to reset password screen
class GoToSignInText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: FlatButton(
        height: ButtonMinHeight,
        onPressed: () => {Navigator.pop(context)},
        child: Text("Go to Log in", style: MaaruStyle.text.small),
      ),
    );
  }
}
