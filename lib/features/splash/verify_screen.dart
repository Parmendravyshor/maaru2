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
        Stack(
      children: [
        Image.asset(
          'assets/icons/Splash-Provider-or-User-screen-svg-new (3).png',
          height: 3000,
          width: 3000,
          fit: BoxFit.cover,
        ),
        Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 100),
            alignment: Alignment.center,
            child: BackgroundImage(
              assetImage: 'assets/icons/MARU_Logo_B2_Horizontal_03 copy.png',
              //hight: 10,
              widt: 200,
            )),
        // BackgroundImage(
        //   assetImage: 'assets/images/splashscreen.png',
        // ),
        Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                children: [
                  Flexible(
                    child: Center(),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [

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
                        height: 15,
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
                      SizedBox(
                        height: 170,
                      ),
                      //  Navigator.of(context).push(MaterialPageRoute(
                      //  builder: (context) => AfterSplashScreen2()));
                    ],
                  )
                ],
              ),
            ))
      ],
    );
  }
}
