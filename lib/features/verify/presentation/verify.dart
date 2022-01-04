import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/theme/style.dart';
import 'package:maru/core/widget/logo.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'package:maru/features/login/presentation/login_screen.dart';
import 'package:maru/features/provider_login/presentation/login_provider_screen.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';

import 'bloc/verify_bloc.dart';
import 'bloc/verify_event.dart';
import 'bloc/verify_state.dart';

class Otp extends StatefulWidget {
  final String email;
  final String password;
  final String fname;
  final String lname;
  final bool isRegister;
  Otp(this.email, this.password, this.fname, this.lname, this.isRegister);
  @override
  OtpWidget createState() =>
      OtpWidget(email, password, fname, lname, isRegister);
}

/// Main Widget that decides either to show Login Scree screen or Forgot password
class OtpWidget extends State<Otp> {
  TextEditingController _otpController;
  final String email;
  final String password;
  final String fname;
  final String lname;
  final bool isRegister;
  OtpWidget(this.email, this.password, this.fname, this.lname, this.isRegister);

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
    final size=MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => KiwiContainer().resolve<VerifyBloc>(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
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
                              return LoginScreen();
                            }));
                          });
                          return Container();
                        }
                        if (state is ResendOtpSuccess) {
                          Future.delayed(Duration(seconds: 1), () {
                            Scaffold.of(context).showSnackBar(
                              SnackBar(
                                backgroundColor: Colors.black,
                                content: Container(
                                  margin: EdgeInsets.only(left: 45),

                                  child: Text("Otp Resend Successfully",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontFamily: 'Quicksand',
                                          fontSize: 20,
                                          color:
                                              MaaruStyle.colors.textColorWhite)),
                                ),
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
                          margin: EdgeInsets.only(left: 10, right: 10),
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
                                        "One Time Password (OTP) Has Been Sent To Your Registered EMAIL ID",
                                        style: MaaruStyle.text.medium,
                                        textAlign: TextAlign.center,
                                      )),),
                              SizedBox(
                                height: 30,
                              ),
                              ThemedTextField(
                                  "ENTER 5 DIGIT OTP CODE", TextInputType.text,
                                  onChanged: (text) {},
                                  editingController: _otpController),
                              SizedBox(
                                height:  size.height*0.03  ,
                              ),


                              InkWell(
                                  onTap: () {
                                    BlocProvider.of<VerifyBloc>(context)
                                        .add(ResendButtonTapped(email));
                                  },
                                  child: Text(
                                    'Resend Verification Code',
                                    style: MaaruStyle.text.mediumDisable,
                                  )),

                              SizedBox(
                                height: 20,
                              ),


                              Container(
                                child: ThemedButton(
                                    text: "Verify",
                                    onPressed: () {
                                      if (_otpController.text.length < 5)
                                        return;
                                      BlocProvider.of<VerifyBloc>(context).add(
                                          CodeEntered(
                                              _otpController.text,
                                              email,
                                              password,
                                              fname,
                                              lname,
                                              isRegister));
                                    },
                                    enabled: true),
                                margin: EdgeInsets.only(left: 15, right: 15),
                              ),




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
                  height: MediaQuery.of(context).size.height * 0.08,
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Already a member? ',
          style: MaaruStyle.text.medium,
        ),
        InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => LoginScreen()));
            },
            child: Text(
              'LOG IN',
              style: MaaruStyle.text.mediumDisable,
            ))
      ],
    );
  }
}
