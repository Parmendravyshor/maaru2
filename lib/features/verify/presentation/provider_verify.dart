

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/theme/style.dart';
import 'package:maru/core/widget/logo.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'package:maru/features/login/presentation/login_screen.dart';
import 'package:maru/features/provider_home/presentation/create_provider_home.dart';
import 'package:maru/features/provider_home/presentation/provider_accept_decline_screen.dart';
import 'package:maru/features/provider_login/presentation/login_provider_screen.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';

import 'bloc/verify_bloc.dart';
import 'bloc/verify_event.dart';
import 'bloc/verify_state.dart';

class ProviderOtp extends StatefulWidget {
  final String email;
  final String password;
  final String fname;
  final String lname;
  final bool isRegister;
  ProviderOtp(this.email, this.password, this.fname, this.lname, this.isRegister);
  @override
  ProviderOtpWidget createState() =>
      ProviderOtpWidget(email, password, fname, lname, isRegister);
}

/// Main Widget that decides either to show Login Scree screen or Forgot password
class ProviderOtpWidget extends State<ProviderOtp> {
  TextEditingController _otpController;
  final String email;
  final String password;
  final String fname;
  final String lname;
  final bool isRegister;
  ProviderOtpWidget(this.email, this.password, this.fname, this.lname, this.isRegister);

  @override
  void initState() {
    _otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KiwiContainer().resolve<VerifyBloc>(),
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            Flexible(
              flex: 15,
              child: SingleChildScrollView(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: BlocBuilder<VerifyBloc, VerifyState>(
                    builder: (context, state) {
                      if (state is VerifyOtpSuccess) {
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Navigator.pushReplacement(context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return LoginProviderScreen();
                                  }));
                        });
                        return Container();
                      }
                      if (state is ResendOtpSuccess) {
                        Future.delayed(Duration(seconds: 1), () {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.black,
                              content: Text("Otp recent successfully",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Quicksand',
                                      fontSize: 20,
                                      color:
                                      MaaruStyle.colors.textColorWhite)),
                            ),
                          );
                        });
                      }
                      if (state is ResendOtpFailure) {
                        Future.delayed(Duration(seconds: 1), () {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.black,
                              content: Text(state.message,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Quicksand',
                                      fontSize: 20,
                                      color:
                                      MaaruStyle.colors.textColorWhite)),
                            ),
                          );
                        });
                      }
                      if (state is VerifyOtpFailure) {
                        Future.delayed(Duration(seconds: 1), () {
                          Scaffold.of(context).showSnackBar(
                            SnackBar(
                              backgroundColor: Colors.black,
                              content: Text(state.message,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontFamily: 'Quicksand',
                                      fontSize: 20,
                                      color:
                                      MaaruStyle.colors.textColorWhite)),
                            ),
                          );
                        });
                      }
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(top: 80),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Logo(),
                                )),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      "Please enter the OTP sent on your registered Email ID",
                                      style: MaaruStyle.text.medium,
                                      textAlign: TextAlign.center,
                                    ))),
                            SizedBox(
                              height: 30,
                            ),
                            ThemedTextField(
                                "Enter 5 digit otp code", TextInputType.text,
                                onChanged: (text) {},
                                editingController: _otpController),
                            SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              child: Container(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "Resend verification code",
                                        style: MaaruStyle.text.medium,
                                        textAlign: TextAlign.center,
                                      ))),
                              onTap: () {
                                BlocProvider.of<VerifyBloc>(context)
                                    .add(ResendButtonTapped(email));
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ThemedButton(
                                text: "Verify",
                                onPressed: () {

                                  if (_otpController.text.length < 5) return;
                                  BlocProvider.of<VerifyBloc>(context).add(
                                      CodeEnteredProvider(
                                          _otpController.text,
                                          email,
                                          password,
                                          fname,
                                          lname,
                                          isRegister));

                                  //TODO:need to change
                                },
                                enabled: true),
                            SizedBox(
                              height: 20,
                            ),
                            state is VerifyOtpInProgress ||
                                state is ResendOtpInProgress
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
    );
  }
  void _showDialog(BuildContext context, String text) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Padding(
            padding: EdgeInsets.all(20.0),
            child: AlertDialog(actions: <Widget>[
              Align(
                  alignment: Alignment.center,
                  child: Container(
                      decoration: BoxDecoration(
                        color: MaaruStyle.colors.textColorWhite,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.only(left: 20.0, right: 20),
                            child: Text(text),
                          ),
                          Divider(
                            color: Colors.grey[360],
                          ),
                          InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Text(
                                'ok',
                                style:
                                TextStyle(color: MaaruColors.buttonColor),
                              ))
                        ],
                      )))
            ]));
      },
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
        onPressed: () => {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          )
        },
        child: Text("Already have an account? Log in",
            style: MaaruStyle.text.small),
      ),
    );
  }
}
