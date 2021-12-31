import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/icons.dart';
import 'package:maru/core/widget/logo.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:flutter/scheduler.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'package:maru/features/forgot/presentation/forgot_screen.dart';
import 'package:maru/features/register/presentation/signup_screen.dart';
import 'package:maru/features/verify/presentation/bloc/verify_bloc.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'package:maru/features/verify/presentation/verify.dart';

import 'bloc/bloc/login_bloc.dart';
import 'bloc/bloc/login_event.dart';
import 'bloc/bloc/login_state.dart';
import 'bloc/bloc/login_event.dart' as event;

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _passwordController;
  TextEditingController _emailController;
  int count = 0;

  @override
  void initState() {
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return BlocProvider(
        create: (context) => KiwiContainer().resolve<LoginBloc>(),
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.white,
            body:Listener(
                onPointerUp: (_) {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    currentFocus.focusedChild.unfocus();
                  }
                },
                child:
                SingleChildScrollView(
                    child: SafeArea(
                        child:   BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {

                              if (state is LoginSuccess) {

                                SchedulerBinding.instance.addPostFrameCallback((_) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (BuildContext context) {
                                        return CreateregisterPetProfile1();
                                      }));
                                });
                                return Container();
                              } else if (state is VerificationNeeded) {

                                SchedulerBinding.instance.addPostFrameCallback((_) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (BuildContext context) {
                                        return BlocProvider(
                                          create: (context) =>
                                              KiwiContainer().resolve<VerifyBloc>(),
                                          child: Otp(_emailController.text,
                                              _passwordController.text, "", "", false),
                                        );
                                      }));
                                });
                                return Container();
                              } else if (state is LoginFailure) {
                                Future.delayed(Duration(seconds: 1), () {
                                  Scaffold.of(context).showSnackBar(
                                    SnackBar(
                                      backgroundColor: Colors.black,
                                      content: Text(state.errorMessage,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Quicksand',
                                              fontSize: 20,
                                              color: MaaruStyle.colors.textColorWhite)),
                                    ),
                                  );
                                });
                              }

                              return  Column(children: [
                                Logo(),
                                ScreenIcon(),
                                SizedBox(
                                  height: size.height*0.02,
                                ),
                                Center(
                                  child: Text(
                                    'or login with email',
                                    style: MaaruStyle.text.tiny
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),


                                Column(children: [
                                  Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        ThemedTextField("EMAIL", TextInputType.emailAddress,
                                            textStyle: TextStyle(
                                              fontWeight: FontWeight.w700,
                                              fontFamily: 'Quicksand',
                                              fontSize: 34,
                                              color:
                                              Colors.black,
                                            ),
                                            textinputaction2: TextInputAction.next,
                                            onChanged: (text) {
                                              BlocProvider.of<LoginBloc>(context).add(event.EmailChanged(text));
                                            }, editingController: _emailController),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        ThemedTextField(
                                          "PASSWORD",
                                          TextInputType.text,
                                          textinputaction2: TextInputAction.done,
                                          password: true,
                                          onChanged: (text) {
                                            BlocProvider.of<LoginBloc>(context)
                                                .add(event.PasswordChanged(text));
                                          },
                                          editingController: _passwordController,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          ResetPasswordScreen()));
                                            },
                                            child: Container(
                                              margin: EdgeInsets.only(right: 20),
                                              child: Align(
                                                alignment: Alignment.centerRight,
                                                child: Text(
                                                  'Forgot Password?',
                                                  style: MaaruStyle.text.greyDisable,
                                                ),
                                              ),
                                            )),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        ThemedButton(
                                            text: "LOGIN",
                                            onPressed: () {
                                              if (state
                                              is LoginFormValidationSuccess ||
                                                  state
                                                  is LoginFormValidationFailure) {
                                                BlocProvider.of<LoginBloc>(context)
                                                    .add(event.LoginButtonTapped());
                                              }

                                            },
                                            enabled: true),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        state is LoginInProgress
                                            ? Center(
                                            child: Container(
                                              margin: EdgeInsets.only(bottom: 10),
                                              width: 40,
                                              height: 40,
                                              child: CircularProgressIndicator(),
                                            ))
                                            : Container(),
                                        GoToSignInText(),

                                        SizedBox(
                                          height: 20,
                                        ),
                                      ])
                                ])]);
                            })
                    )))));
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
          'Not a member? ',
          style: MaaruStyle.text.medium,
        ),
        InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => RegisterScreen()));
            },
            child: Text(
              'SIGNUP ',
              style: MaaruStyle.text.mediumDisable,
            ))
      ],
    );
  }
}
