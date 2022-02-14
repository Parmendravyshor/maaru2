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
    final size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => KiwiContainer().resolve<ResetBloc>(),
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
                    margin: EdgeInsets.only(left: 10, right: 10),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    color: Colors.white,
                    child: BlocBuilder<ResetBloc, ResetState>(
                      builder: (context, state) {
                        int step = BlocProvider.of<ResetBloc>(context).step;

                        if (state is ResetPasswordMessageSent && step == 1) {
                          _showDialog(context, 'enter valid email');
                          return Container();
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
                            ? Container(
                                width: MediaQuery.of(context).size.width,
                                height: MediaQuery.of(context).size.height,
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: size.height * 0.10,
                                    ),

                                    SizedBox(
                                      height: size.height * 0.02,
                                    ),

                                    Align(
                                        alignment: Alignment.center,
                                        child: Logo()),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Padding(
                                      padding:EdgeInsets.only(left: 20,bottom: 10),
                                      child: Align(
                                        alignment: Alignment.topLeft,

                                        child: Text(
                                          'Forgot Your Password?',
                                          style: MaaruStyle.text.large,
                                        ),
                                      ),
                                    ),
                                    ThemedTextField(
                                        "EMAIL", TextInputType.emailAddress,
                                        textInputAction: TextInputAction.next,
                                        onChanged: (text) {
                                      BlocProvider.of<ResetBloc>(context)
                                          .add(EmailChanged(text));
                                    }, editingController: _emailController),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      child: ThemedButton(
                                          text: "SEND",
                                          onPressed: () {
                                            String email = _emailController.text;
                                            if(validateEmail(email) != null){
                                              _showDialog(context, 'Please enter valid email');
                                            }
                                            else {
                                              if (state
                                              is ResetFormValidationSuccess ||
                                                  state
                                                  is ResetFormValidationFailure) {
                                                BlocProvider.of<ResetBloc>(
                                                    context)
                                                    .add(ResetButtonTapped());
                                              }
                                            }
                                          },
                                          enabled: true),
                                    ),
                                    SizedBox(
                                      height: size.height * 0.03,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          'Remember Password? '.toUpperCase(),
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        LoginScreen()));
                                          },
                                          child: Text(
                                            'LOGIN',
                                            style:
                                                MaaruStyle.text.mediumDisable,
                                          ),
                                        ),
                                      ],
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
                                            child: Container(
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
                                    ThemedTextField("Otp", TextInputType.text,
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
                                        text: "Set New Password".toUpperCase(),
                                        onPressed: () {
                                          String otp = _otpController.text;
                                          String password =
                                              _passwordController.text;

                                          if (otp.length < 4) {
                                            _showDialog(
                                              context,
                                              "Invalid OTP",
                                            );
                                          } else if (password.length < 8) {
                                            _showDialog(
                                              context,
                                              "Password should be of minimum 8 characters",
                                            );
                                          } else {
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
            ],
          ),
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
