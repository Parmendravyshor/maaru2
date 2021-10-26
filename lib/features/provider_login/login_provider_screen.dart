import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/icons.dart';
import 'package:maru/core/widget/logo.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/provider_home/presentation/create_provider_home.dart';
import 'package:maru/features/register/presentation/signup_screen.dart';

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
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: SafeArea(
                child: Column(children: [
          Logo(),
          ScreenIcon(),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              'or login with email',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
              child: Column(children: [
            Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
              ThemedTextField("Email", TextInputType.emailAddress,
                  textInputAction: TextInputAction.next, onChanged: (text) {
                //BlocProvider.of<RegisterBloc>(context).add(EmailChanged(text));
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
                  // BlocProvider.of<RegisterBloc>(context)
                  //.add(PasswordChanged(text));
                },
                editingController: _passwordController,
              ),
              SizedBox(
                height: 20,
              ),
              ThemedButton(
                text: 'Login',
                onPressed: () {
    String email = _emailController.text;
    String password = _passwordController.text;

    if (validateEmail(email) != null) {
    AlertManager.showErrorMessage(
    "Please enter valid email", context);
    } else if (password.length < 6) {
    AlertManager.showErrorMessage(
    "Password must be 6 characters long", context);
    }
    else{
    AlertManager.showSuccessMessage( "Success", context);
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => CreateProviderHome()));
                }}
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: GoToSignInText(),
              ),
              SizedBox(
                height: 20,
              ),
            ])
          ]))
        ]))));
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
              'Signup ',
              style: MaaruStyle.text.mediumDisable,
            ))
      ],
    );
  }
}
