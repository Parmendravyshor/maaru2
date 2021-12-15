import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/features/splash/view/after_splash_Screen2.dart';
import 'package:maru/features/splash/view/after_splash_screen.dart';

class VerifyUser extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      Scaffold(body:
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


