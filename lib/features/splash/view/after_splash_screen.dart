

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
import 'package:maru/features/register/presentation/signup_screen.dart';
import 'package:maru/features/verify/domain/usecases/save_registration_id.dart';

class AfterSplashScreen extends StatefulWidget {
  @override
  State<AfterSplashScreen> createState() => _AfterSplashScreenState();
}

class _AfterSplashScreenState extends State<AfterSplashScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    // Future.delayed(Duration(seconds: 3), () async {
    //   SharedPrefHelper sharedPrefHelper =
    //   KiwiContainer().resolve<SharedPrefHelper>();
    //   bool isloggedin = sharedPrefHelper.isLoggedin();
    //   if (!isloggedin) {
    //     Navigator.pushReplacement(
    //       context,
    //       MaterialPageRoute(builder: (context) => LoginScreen()),
    //     );
    //   } else {
    //     DateTime expiryTime = DateTime.fromMillisecondsSinceEpoch(
    //         int.parse(sharedPrefHelper.getExpiryTime()) * 1000);
    //     if (expiryTime.isAfter(DateTime.now())) {
    //       await KiwiContainer().resolve<SaveRegistrationId>().call(NoParams());
    //       Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(builder: (context) => HomeScreen()),
    //       );
    //     } else {
    //       EmailSignin emailSignin = KiwiContainer().resolve<EmailSignin>();
    //       await emailSignin(EmailAuthParams(
    //           email: sharedPrefHelper.getEmail(),
    //         //  password: sharedPrefHelper.getPassword(),
    //           first_name: "",
    //           lName: ""));
    //       await KiwiContainer().resolve<SaveRegistrationId>().call(NoParams());
    //       Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(builder: (context) => HomeScreen()),
    //       );
    //     }
    //   }
    // });

    return
      Scaffold(
        backgroundColor: Colors.transparent,
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
                  height: size.height * 0.15,
                ),
                SizedBox(
                  height: size.height * 0.25,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LoginScreen()));
                  },
                  child: RoundedButton(
                    buttonName: 'LOGIN',
                    Color1: MaaruColors.whiteColor,
                    Color: MaaruColors.primaryColorsuggesion,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  height: size.height * 0.09,
                  width: size.width * 0.85,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    //  borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: MaaruColors.button2Color,
                    ),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (_) => RegisterScreen()));
                    },
                    child: Text(
                      'Create account',
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

    //
    //
    // Stack(
    //   children: [
    //     Image.asset(
    //       'assets/icons/Splash-Provider-or-User-screen-svg-new (3).png',
    //       height: 3000,
    //       width: 3000,
    //       fit: BoxFit.cover,
    //     ),
    //     Container(
    //         padding: EdgeInsets.fromLTRB(10, 0, 10, 100),
    //         alignment: Alignment.center,
    //         child: BackgroundImage(
    //           assetImage: 'assets/icons/MARU_Logo_B2_Horizontal_03 copy.png',
    //           //hight: 10,
    //           widt: 200,
    //         )),
    //     Scaffold(
    //       backgroundColor: Colors.transparent,
    //       body: Column(
    //         children: [
    //           Flexible(
    //             child: Center(),
    //           ),
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.end,
    //             children: [
    //               InkWell(
    //                 onTap: () {
    //                   Navigator.of(context).push(MaterialPageRoute(
    //                       builder: (context) => LoginScreen()));
    //                 },
    //                 child: RoundedButton(
    //                   buttonName: 'LOGIN',
    //                   Color1: MaaruColors.whiteColor,
    //                   Color: MaaruColors.primaryColorsuggesion,
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 15,
    //               ),
    //               Container(
    //                 height: size.height * 0.09,
    //                 width: size.width * 0.85,
    //                 decoration: BoxDecoration(
    //                   color: Colors.white,
    //                 //  borderRadius: BorderRadius.circular(10),
    //                   border: Border.all(
    //                     width: 2,
    //                     color: MaaruColors.button2Color,
    //                   ),
    //                 ),
    //                 child: FlatButton(
    //                   onPressed: () {
    //                     Navigator.of(context).push(MaterialPageRoute(
    //                         builder: (_) => RegisterScreen()));
    //                   },
    //                   child: Text(
    //                     'Create account',
    //                     style: TextStyle(
    //                         color: MaaruColors.buttonColor,
    //                         fontWeight: FontWeight.bold,
    //                         fontSize: 16),
    //                   ),
    //                 ),
    //               ),
    //               SizedBox(
    //                 height: 25,
    //               ),
    //             ],
    //           ),
    //           SizedBox(
    //             height: 60,
    //           ),
    //         ],
    //       ),
    //     )
    //   ],
    // );
  }
}
