

import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'package:maru/features/login/domain/usecases/emailsignin.dart';
import 'package:maru/features/login/presentation/login_screen.dart';
import 'package:maru/features/splash/view/after_splash_Screen2.dart';
import 'package:maru/features/splash/view/after_splash_screen.dart';
import 'package:maru/features/verify/domain/usecases/save_registration_id.dart';

class VerifyUser extends StatefulWidget {

  @override
  State<VerifyUser> createState() => _VerifyUserState();
}

class _VerifyUserState extends State<VerifyUser> {


  @override
  Widget build(BuildContext context) {
final size = MediaQuery.of(context).size;
     return Scaffold(body:
      Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                colorFilter: new ColorFilter.mode(
                    Colors.black.withOpacity(0.2), BlendMode.dstATop),
                image: AssetImage('assets/icons/Splash-Provider-or-User-screen-svg-new (3).png'))),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icons/MARU_Logo_B2_Horizontal_03 copy.png',
                height: size.height * 0.08,
              ),
              SizedBox(
                height: size.height * 0.06,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AfterSplashScreen()));
                },
                child: RoundedButton(
                  buttonName: 'I am a Customer',
                  Color: MaaruColors.blueColor,
                  Color1: MaaruColors.button2Color,
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AfterSplashScreen2()));
                },
                child: RoundedButton(
                  buttonName: 'I am a Provider',
                  Color1: MaaruColors.blueColor,
                  Color: MaaruColors.button2Color,
                ),
              ),
            ],
          ),

        ),
      ));

  }
}


