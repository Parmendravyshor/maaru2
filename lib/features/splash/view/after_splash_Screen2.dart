import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/features/provider_login/presentation/login_provider_screen.dart';
import 'package:maru/features/provider_register/presentation/provider_register.dart';


class AfterSplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return
      Scaffold(
        body:Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,

                  image: AssetImage('assets/icons/Splash-Provider-or-User-screen-svg-new (3).png'))),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Image.asset(
                  'assets/icons/MARU_Logo_B2_Horizontal_03 copy.png',
                  height: size.height * 0.14,
                ),
                SizedBox(
                  height: size.height * 0.25,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginProviderScreen()));
                  },
                  child: RoundedButton(
                    buttonName: 'LOGIN',
                    Color1: MaaruColors.whiteColor,
                    Color: MaaruColors.blueColor,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  height: size.height * 0.09,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    color: MaaruColors.button2Color,
//  borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: MaaruColors.whiteColor,
//    color: MaaruColors.buttonTextColor,
                    ),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => RegisterPoviderScreen()));
                    },
                    child: Text(
                      'CREATE ACCOUNT',
                      style: TextStyle(
                          color: MaaruColors.buttonColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.15,
                ),
              ],
            ),
          ),
        ) ,
      );

  }
}

