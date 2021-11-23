

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/icons.dart';
import 'package:maru/core/widget/logo.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/login/presentation/login_screen.dart';
import 'package:maru/features/provider_home/presentation/create_provider_home.dart';
import 'package:maru/features/provider_home/presentation/provider_accept_decline_screen.dart';
import 'package:maru/features/register/presentation/register_bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:maru/features/verify/presentation/bloc/verify_bloc.dart';
import 'package:maru/features/verify/presentation/provider_verify.dart';
import 'package:maru/features/verify/presentation/verify.dart';

class RegisterPoviderScreen extends StatefulWidget {
  @override
  _RegisterPoviderScreenState createState() => _RegisterPoviderScreenState();
}

class _RegisterPoviderScreenState extends State<RegisterPoviderScreen> {
  bool enabled = false;

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
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: SafeArea(
                child: BlocProvider(
                    create: (context) =>
                        KiwiContainer().resolve<RegisterBloc>(),
                    child: BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                      if (state is RegisterSuccess) {
                        AlertManager.showErrorMessage(
                            "otp send your register email", context);
                        SchedulerBinding.instance.addPostFrameCallback((_) {
                          Navigator.pushReplacement(context, MaterialPageRoute(
                              builder: (BuildContext context) {
                            return BlocProvider(
                              create: (context) =>
                                  KiwiContainer().resolve<VerifyBloc>(),
                              child: ProviderOtp(
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
                                        color:
                                            MaaruStyle.colors.textColorWhite)),
                              ),
                            );
                          });
                        });
                      }

                      return Column(
                        children: [
                          Logo(),
                          ScreenIcon(),
                          SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              'or sign up with email',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            // padding: const EdgeInsets.symmetric(horizontal: 40),
                            child: Column(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    ThemedTextField(
                                        "First Name", TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        onChanged: (text) {
                                       BlocProvider.of<RegisterBloc>(context)
                                        .add(FNameChanged(text));
                                    },
                                        editingController:
                                            _first_nameController),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ThemedTextField(
                                        "Last Name", TextInputType.text,
                                        textInputAction: TextInputAction.next,
                                        onChanged: (text) {
                                         BlocProvider.of<RegisterBloc>(context)
                                       .add(LNameChanged(text));
                                    }, editingController: _lnameController),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    ThemedTextField(
                                        "Email", TextInputType.emailAddress,
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
                                      TextInputType.visiblePassword,
                                      textInputAction: TextInputAction.next,
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
                                    ThemedButton(
                                      text: "Register",
                                      onPressed: () {
                                        String fname =
                                            _first_nameController.text;
                                        String lname = _lnameController.text;
                                        String email = _emailController.text;
                                        String password =
                                            _passwordController.text;

                                        if (fname.isEmpty) {
                                          AlertManager.showErrorMessage(
                                              "Please enter first name",
                                              context);
                                        } else if (lname.isEmpty) {
                                          AlertManager.showErrorMessage(
                                              "Please enter last name",
                                              context);
                                        } else if (validateEmail(email) !=
                                            null) {
                                          AlertManager.showErrorMessage(
                                              "Please enter valid email",
                                              context);
                                        } else if (password.length < 6) {
                                          AlertManager.showErrorMessage(
                                              "Password must be 6 characters long",
                                              context);

                                          enabled = true;
                                        }

                                        // else if (password != cnfpassword) {
                                        //   AlertManager.showErrorMessage(
                                        //       "Password do not match", context);

                                        else {
                                          BlocProvider.of<RegisterBloc>(context)
                                              .add(RegisterButtonTapped());

                                        }
                                        enabled = false;
                                      },
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
                            ),
                          )
                        ],
                      );
                    })))));
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
              'Log in',
              style: MaaruStyle.text.mediumDisable,
            ))
      ],
    );
  }
}