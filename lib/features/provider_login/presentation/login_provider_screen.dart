

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/icons.dart';
import 'package:maru/core/widget/logo.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'package:maru/features/forgot/presentation/bloc/reset_event.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_event.dart'as event;
import 'package:maru/features/login/presentation/bloc/bloc/login_state.dart';
import 'package:maru/features/login/presentation/login_screen.dart';
import 'package:maru/features/provider_home/presentation/create_provider_home.dart';
import 'package:maru/features/provider_home/presentation/provider_accept_decline_screen.dart';
import 'package:maru/features/provider_home/presentation/webview.dart';
import 'package:maru/features/provider_register/presentation/provider_register.dart';
import 'package:maru/features/register/presentation/signup_screen.dart';
import 'package:maru/features/verify/presentation/bloc/verify_bloc.dart';
import 'package:flutter/scheduler.dart';
import 'package:maru/features/verify/presentation/provider_verify.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:maru/features/forgot/presentation/forgot_screen.dart';


class LoginProviderScreen extends StatefulWidget {
  @override
  _LoginProviderScreenState createState() => _LoginProviderScreenState();
}

class _LoginProviderScreenState extends State<LoginProviderScreen> {
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
    return BlocProvider(
        create: (context) => KiwiContainer().resolve<LoginBloc>(),
        child: Scaffold(
            backgroundColor: Colors.white,
            body: Listener(
                onPointerUp: (_) {
                  FocusScopeNode currentFocus = FocusScope.of(context);
                  if (!currentFocus.hasPrimaryFocus &&
                      currentFocus.focusedChild != null) {
                    currentFocus.focusedChild.unfocus();
                  }
                },
                child: SingleChildScrollView(
                    child: SafeArea(
                        child:   BlocBuilder<LoginBloc, LoginState>(
                            builder: (context, state) {
                              if (state is LoginSuccess) {
                                SchedulerBinding.instance.addPostFrameCallback((_) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (BuildContext context) {
                                        return TestApp();
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
                                          child: ProviderOtp(_emailController.text,
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
                                      content: Text('please check your email or password',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontFamily: 'Quicksand',
                                              fontSize: 20,
                                              color: MaaruStyle.colors.textColorWhite)),
                                    ),
                                  );
                                });
                              }

                              return  Padding(
                                padding: const EdgeInsets.only(left: 15.0,right: 15),
                                child: Column(children: [
                                  Logo(),
                                  ScreenIcon(),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Center(
                                    child: Text(
                                      'or login with email',
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),


                                  Column(children: [
                                    Column(
                                        crossAxisAlignment: CrossAxisAlignment.end,
                                        children: [
                                          ThemedTextField("Email", TextInputType.emailAddress,
                                              textinputaction2: TextInputAction.next,
                                              onChanged: (text) {
                                                BlocProvider.of<LoginBloc>(context).add(event.EmailChanged(text));
                                              }, editingController: _emailController),
                                          const SizedBox(
                                            height: 5,
                                          ),
                                          ThemedTextField(
                                            "Password",
                                            TextInputType.text,
                                            textinputaction2: TextInputAction.done,
                                            password: true,
                                            onChanged: (text) {
                                              BlocProvider.of<LoginBloc>(context)
                                                  .add(event.PasswordChanged(text));
                                            },
                                            editingController: _passwordController,
                                          ),
                                          Container(
                                              alignment: Alignment.centerRight,
                                              padding: EdgeInsets.only(right: 20),
                                              child: InkWell(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (_) =>
                                                                ResetPasswordScreen()));
                                                  },
                                                  child: Text(
                                                    'Forgot Password',
                                                    style: MaaruStyle.text.greyDisable,
                                                  ))),
                                          SizedBox(
                                            height: 20,
                                          ),

                                          ThemedButton(
                                            text: 'Login',
                                            onPressed: () {
                                              String email = _emailController.text;
                                              String password = _passwordController.text;

                                              if (validateEmail(email) != null) {
                                                _showDialog(context,
                                                    "Please enter valid email", );
                                              } else if (password.length < 6) {
                                                _showDialog(context,
                                                    "Password must be 6 characters long"
                                                 );
                                              } else {
                                                if (state
                                                is LoginFormValidationSuccess ||
                                                    state
                                                    is LoginFormValidationFailure) {
                                                  BlocProvider.of<LoginBloc>(
                                                      context)
                                                      .add(event
                                                      .ProviderLoginButtonTapped());
                                                  //  AlertManager.showSuccessMessage( "Login Success", context);


                                                }
                                              }

                                            },
                                          ),
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
                                          Container(
                                            child: GoToSignInText(),
                                          ),

                                          SizedBox(
                                            height: 20,
                                          ),
                                        ])
                                  ])]),
                              );
                            })
                    )))));
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
                  .push(MaterialPageRoute(builder: (_) =>ProviderWebViewSignup()));
            },
            child: Text(
              'Signup ',
              style: MaaruStyle.text.mediumDisable,
            ))
      ],
    );
  }
}

// class LoginProviderScreen extends StatefulWidget {
//   @override
//   _LoginProviderScreenState createState() => _LoginProviderScreenState();
// }
//
// class _LoginProviderScreenState extends State<LoginProviderScreen> {
//   TextEditingController _passwordController;
//   TextEditingController _emailController;
//   int count = 0;
//
//   @override
//   void initState() {
//     _passwordController = TextEditingController();
//     _emailController = TextEditingController();
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     _passwordController.dispose();
//     _emailController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//         create: (context) => KiwiContainer().resolve<LoginBloc>(),
//         child: Scaffold(
//             backgroundColor: Colors.white,
//             body: Listener(onPointerUp: (_) {
//               FocusScopeNode currentFocus = FocusScope.of(context);
//               if (!currentFocus.hasPrimaryFocus &&
//                   currentFocus.focusedChild != null) {
//                 currentFocus.focusedChild.unfocus();
//               }
//             }, child: SingleChildScrollView(child: SafeArea(child:
//                 BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
//               if (state is LoginSuccess) {
//                 SchedulerBinding.instance.addPostFrameCallback((_) {
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (BuildContext context) {
//                     return HomeScreen();
//                   }));
//                 });
//                 return Container();
//               } else if (state is VerificationNeeded) {
//                 SchedulerBinding.instance.addPostFrameCallback((_) {
//                   Navigator.pushReplacement(context,
//                       MaterialPageRoute(builder: (BuildContext context) {
//                     return BlocProvider(
//                       create: (context) =>
//                           KiwiContainer().resolve<VerifyBloc>(),
//                       child: ProviderOtp(_emailController.text,
//                           _passwordController.text, "", "", false),
//                     );
//                   }));
//                 });
//                 return Container();
//               } else if (state is LoginFailure) {
//                 Future.delayed(Duration(seconds: 1), () {
//                   Scaffold.of(context).showSnackBar(
//                     SnackBar(
//                       backgroundColor: Colors.black,
//                       content: Text(state.errorMessage,
//                           style: TextStyle(
//                               fontWeight: FontWeight.w400,
//                               fontFamily: 'Quicksand',
//                               fontSize: 20,
//                               color: MaaruStyle.colors.textColorWhite)),
//                     ),
//                   );
//                 });
//               }
//
//               return Column(children: [
//                 Logo(),
//                 ScreenIcon(),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Center(
//                   child: Text(
//                     'or login with email',
//                     style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 20,
//                         fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 20,
//                 ),
//                 Container(
//                     child: Column(children: [
//                   Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
//                     ThemedTextField("Email", TextInputType.emailAddress,
//                         textInputAction: TextInputAction.next,
//                         onChanged: (text) {
//                       BlocProvider.of<LoginBloc>(context).add(event.EmailChanged);
//                     }, editingController: _emailController),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     ThemedTextField(
//                       "Password",
//                       TextInputType.text,
//                       textInputAction: TextInputAction.done,
//                       password: true,
//                       onChanged: (text) {
//                          BlocProvider.of<LoginBloc>(context)
//                         .add(event.PasswordChanged(text));
//                       },
//                       editingController: _passwordController,
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     ThemedButton(
//                         text: 'Login',
//                         onPressed: () {
//                           String email = _emailController.text;
//                           String password = _passwordController.text;
//
//                           if (validateEmail(email) != null) {
//                             AlertManager.showErrorMessage(
//                                 "Please enter valid email", context);
//                           } else if (password.length < 6) {
//                             AlertManager.showErrorMessage(
//                                 "Password must be 6 characters long", context);
//                           } else {
//                             //  AlertManager.showSuccessMessage( "Success", context);
//                             Navigator.of(context).push(
//                                 MaterialPageRoute(builder: (_) => TestApp()));
//                           }
//                         }),
//                     SizedBox(
//                       height: 20,
//                     ),
//                     Container(
//                       child: GoToSignInText(),
//                     ),
//                     SizedBox(
//                       height: 20,
//                     ),
//                   ])
//                 ]))
//               ]);
//             }))))));
//   }
// }
//
// /// Text for showing at bottom of screen
// /// Tapping on it should take user to reset password screen
// class GoToSignInText extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           'Not a member? ',
//           style: MaaruStyle.text.medium,
//         ),
//         InkWell(
//             onTap: () {
//               Navigator.of(context)
//                   .push(MaterialPageRoute(builder: (_) => RegisterScreen()));
//             },
//             child: Text(
//               'Signup ',
//               style: MaaruStyle.text.mediumDisable,
//             ))
//       ],
//     );
//   }
// }
