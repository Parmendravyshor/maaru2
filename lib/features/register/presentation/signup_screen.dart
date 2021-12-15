


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
import 'package:maru/features/Home/presentation/home_sceen.dart';

import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/login/presentation/login_screen.dart';

import 'dart:convert';
import 'dart:ffi';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

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
import 'package:maru/features/verify/presentation/bloc/verify_bloc.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'package:maru/features/verify/presentation/verify.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController _first_nameController;
  TextEditingController _lnameController;
  TextEditingController _passwordController;
  TextEditingController _cnfpasswordController;
  TextEditingController _emailController;

  @override
  void initState() {
    _passwordController = TextEditingController();
    _first_nameController = TextEditingController();
    _lnameController = TextEditingController();
    _emailController = TextEditingController();
    _lnameController = TextEditingController();
    _cnfpasswordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _first_nameController.dispose();
    _lnameController.dispose();
    _cnfpasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor:Colors.white,
        body: SingleChildScrollView(
            child: BlocProvider(
                create: (context) => KiwiContainer().resolve<RegisterBloc>(),
                child: BlocBuilder<RegisterBloc, RegisterState>(
                    builder: (context, state) {
                  if (state is RegisterSuccess) {
                    AlertManager.showErrorMessage(
                        "otp send your register email", context);
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return BlocProvider(
                          create: (context) =>
                              KiwiContainer().resolve<VerifyBloc>(),
                          child: Otp(
                            _emailController.text,
                            _passwordController.text,
                            _first_nameController.text,
                            _lnameController.text,
                            true,
                          ),
                        );
                      }));
                    });

                    return Container();
                  } else if (state is RegisterFailure) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Future.delayed(Duration(seconds: 1), () {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.black,
                            content: Text(state.errorMessage,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'poppins',
                                    fontSize: 20,
                                    color: MaaruStyle.colors.textColorWhite)),
                          ),
                        );
                      });
                    });
                  }

                  return Container(
                      child: SafeArea(
                          child: Column(children: [
                    //

                    Logo(),
                    ScreenIcon(),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: Text(
                        'or sign up with email',
                        style: GoogleFonts.poppins(
                            textStyle: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                                fontWeight: FontWeight.w500)),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Column(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            ThemedTextField("First Name", TextInputType.name,
                                textinputaction2: TextInputAction.next,
                                onChanged: (text) {
                             BlocProvider.of<RegisterBloc>(context)
                                  .add(FNameChanged(text));
                            }, editingController: _first_nameController),
                            SizedBox(
                              height: 5,
                            ),
                            ThemedTextField("Last Name", TextInputType.name,
                                textInputAction: TextInputAction.next,
                                onChanged: (text) {
                              BlocProvider.of<RegisterBloc>(context)
                                  .add(LNameChanged(text));
                            }, editingController: _lnameController),
                            SizedBox(
                              height: 5,
                            ),
                            ThemedTextField("Email", TextInputType.emailAddress,
                                textInputAction: TextInputAction.next,
                                onChanged: (text) {
                              BlocProvider.of<RegisterBloc>(context)
                                  .add(EmailChanged(text));
                            }, editingController: _emailController),
                            SizedBox(
                              height: 5,
                            ),
                            ThemedTextField(
                              "Password",
                              TextInputType.text,
                              textInputAction: TextInputAction.done,
                              password: true,
                              onChanged: (text) {
                                BlocProvider.of<RegisterBloc>(context)
                                    .add(PasswordChanged(text));
                              },
                              editingController: _passwordController,
                            ),
                          ],
                        ),

                        Column(
                          children: [
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 15,right: 15),
                              child: ThemedButton(
                                  text: "JOIN",
                                  onPressed: () {
                                    String first_name =
                                        _first_nameController.text;
                                    String lname = _lnameController.text;
                                    String email = _emailController.text;
                                    String password = _passwordController.text;

                                    if (first_name.isEmpty) {
                                      AlertManager.showErrorMessage(
                                          "Please enter first name", context);
                                    } else if (lname.isEmpty) {
                                      AlertManager.showErrorMessage(
                                          "Please enter last name", context);
                                    } else if (validateEmail(email) != null) {
                                      AlertManager.showErrorMessage(
                                          "Please enter valid email", context);
                                    } else if (password.length < 8) {
                                      AlertManager.showErrorMessage(
                                          "Password must be 6 characters long",
                                          context);

                                      //  enabled = true;
                                    } else {
                                      BlocProvider.of<RegisterBloc>(context)
                                          .add(RegisterButtonTapped());
                                      // Navigator.of(context).push(
                                      //     MaterialPageRoute(
                                      //         builder: (_) =>
                                      //             CreateregisterPetProfile1()));
                                    }
                                    // else {
                                    //   AlertManager.disclaimerPopup(context,
                                    //       onSuccess: () {
                                    //
                                    //       });
                                    // }
                                  }),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            state is RegisterInProgress
                                ? Center(
                                    child: Container(
                                    width: 5,
                                    height: 5,
                                    child: CircularProgressIndicator(),
                                  ))
                                : Container(),
                            GoToSignInText(),
                            SizedBox(
                              height: 30,
                            ),
                          ],
                        )
                      ],
                    )
                  ])));
                }))));
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

