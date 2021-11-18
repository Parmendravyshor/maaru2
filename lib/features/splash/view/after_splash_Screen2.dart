import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/features/provider_login/login_provider_screen.dart';
import 'package:maru/features/provider_register/presentation/provider_register.dart';


class AfterSplashScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          'assets/icons/Splash-Provider-or-User-screen-svg-new.png',
          height: 3000,
          width: 3000,
          fit: BoxFit.cover,
        ),
        Container(
            alignment: Alignment.center,
            child: BackgroundImage(
              assetImage: 'assets/images/logom (3).png',
              //  hight: 200,
              widt: 300,
            )),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
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
                          builder: (context) => LoginProviderScreen()));
                    },
                    child: RoundedButton(
                      buttonName: 'Login',
                      Color1: MaaruColors.primaryColorsuggesion1,
                      Color: MaaruColors.primaryColorsuggesion,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: size.height * 0.09,
                    width: size.width * 0.85,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        width: 2,
                        color: MaaruColors.primaryColorsuggesion1,
                        //    color: MaaruColors.buttonTextColor,
                      ),
                    ),
                    child: FlatButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => RegisterPoviderScreen()));
                      },
                      child: Text(
                        'Create account',
                        style: TextStyle(
                            color: Colors.green[900],
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
