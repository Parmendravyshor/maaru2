import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/disclaimer.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/features/Account_setting/presentation/payment/payment_screen.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/splash/verify_screen.dart';
import 'package:maru/features/splash/view/after_splash_screen.dart';
import 'package:maru/features/splash/view/view.dart';

import 'change_password_screen.dart';
import 'edit_profile_screen.dart';


class AccountSettingScreen extends StatefulWidget {
  @override
  _AccountSettingScreenState createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  bool priceupdate_value = true;
  String value = '1';
  bool update = true;
  @override
  Widget build(BuildContext context) {
    SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
    final size=MediaQuery.of(context).size;
    var selectedIndex;

    return WillPopScope(


        onWillPop: () async => false,
        child: Scaffold(
            backgroundColor: Colors.white,
            bottomNavigationBar: CreateHomeScreen(
                selectedIndex: 4,
                Color3: selectedIndex == 4
                    ? Colors.red
                    : MaaruColors.textButtonColor
                //   Color:MaaruColors.textButtonColor
                ),
            body: SafeArea(
                child: SingleChildScrollView(

                    //  child
                    //   Padding(
                    padding: EdgeInsets.only(
                      left: 20,
                    ),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            height: 40,
                            width: 40,
                            decoration:  BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                image: _prefHelper.getStringByKey('img', '').isEmpty
                                    ? const ExactAssetImage(
                                    'assets/icons/Oval.png')
                                    : FileImage(File(_prefHelper.getStringByKey('img', ''))),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerLeft,
                              child: Column(children: [
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Account Setting'.toUpperCase(),
                                    style: MaaruStyle.text.tiny,
                                  ),
                                ),
                                SizedBox(
                                  height: size.height*0.02,
                                ),
                                Test3(
                                  image: 'assets/icons/icone-setting-2.png',
                                  hite: 40,
                                  text: 'Edit Profile'.toUpperCase(),
                                  size: 115,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                CreateUserProfile()));
                                  },
                                ),
                                SizedBox(
                                  height: size.height*0.02,
                                ),
                                Test3(
                                  image: 'assets/icons/icone-setting-2.png',
                                  hite: 40,
                                  text: 'Change Password',
                                  size: 35,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                ChangePasswordScreen()));
                                  },
                                ),
                                SizedBox(
                                  height: size.height*0.02,
                                ),
                                Test3(
                                  image: 'assets/icons/icone-setting-3.png',
                                  hite: 40,
                                  text: 'Payment',
                                  size: 130,
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => PaymentScreen1()));
                                  },
                                ),
                                SizedBox(
                                  height: size.height*0.02,
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                              padding:
                                                  EdgeInsets.only(right: 30),
                                              child: Container(
                                                  height: 60,
                                                  width: 400,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xfff7f7f7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10.0),
                                                  ),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Image.asset(
                                                          'assets/icons/icone-setting-4.png',
                                                          height: 40,
                                                        ),
                                                        Text(
                                                          'Push Notification'.toUpperCase(),
                                                          style: MaaruStyle
                                                              .text.tiny,
                                                        ),
                                                        SizedBox(
                                                          width: 35,
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          // child: Transform.scale(
                                                          //   scale: 1.2,
                                                          child: Switch(
                                                            activeColor:
                                                                MaaruColors
                                                                    .buttonColor,
                                                            inactiveThumbColor:
                                                                MaaruColors
                                                                    .buttonColor,
                                                            // title: Text("Do you want to update your price?"),
                                                            // controlAffinity: ListTileControlAffinity.leading,
                                                            value:
                                                            update,
                                                            onChanged: (bool
                                                                priceupdateValue) {
                                                              setState(() {
                                                                update =
                                                                    priceupdateValue;
                                                                print(priceupdateValue);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ]))))
                                    ]),
                                SizedBox(
                                  height: size.height*0.02,
                                ),
                                Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                          child: Padding(
                                              padding:
                                              EdgeInsets.only(right: 30),
                                              child: Container(
                                                  height: 60,
                                                  width: 400,
                                                  decoration: BoxDecoration(
                                                    color:
                                                    const Color(0xfff7f7f7),
                                                    borderRadius:
                                                    BorderRadius.circular(
                                                        10.0),
                                                  ),
                                                  alignment:
                                                  Alignment.centerLeft,
                                                  child: Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                      children: [
                                                        Image.asset(
                                                          'assets/icons/icone-setting-5.png',
                                                          height: 40,
                                                        ),
                                                        Text(
                                                          'Email Notification'.toUpperCase(),
                                                          style: MaaruStyle
                                                              .text.tiny,
                                                        ),
                                                        SizedBox(
                                                          width: 35,
                                                        ),
                                                        Align(
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          // child: Transform.scale(
                                                          //   scale: 1.2,
                                                          child: Switch(
                                                            activeColor:
                                                            MaaruColors
                                                                .buttonColor,
                                                            inactiveThumbColor:
                                                            MaaruColors
                                                                .buttonColor,
                                                            // title: Text("Do you want to update your price?"),
                                                            // controlAffinity: ListTileControlAffinity.leading,
                                                            value:
                                                            priceupdate_value,
                                                            onChanged: (bool
                                                            priceupdateValue) {
                                                              setState(() {
                                                                priceupdate_value =
                                                                    priceupdateValue;
                                                                print(priceupdateValue);
                                                              });
                                                            },
                                                          ),
                                                        ),
                                                      ]))))
                                    ]),
                                SizedBox(
                                  height: size.height*0.02,
                                ),
                                Test3(
                                  image: 'assets/icons/icone-setting-6.png',
                                  hite: 40,
                                  text: 'Privacy Policy',
                                  size: 90,
                                  onPressed: () {},
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Test3(
                                  image: 'assets/icons/icone-setting-7.png',
                                  hite: 40,
                                  text: 'Terms and  Conditions',
                                  size: 0,
                                  onPressed: () {},
                                ),
                                SizedBox(
                                  height: size.height*0.02,
                                ),
                                Test3(

                                  image: 'assets/images/126-1264365_grey-logout-icon-png-transparent-png (2).png',
                                  hite: 30,
                                  size: 120,


                                  text: 'Log Out',
                                  onPressed: () async{
                                    await _prefHelper.clear('pet_name');
                                    await _prefHelper.clear('last_name');
                                    await _prefHelper.clear('first_name');
                                    Navigator.of(context).pushAndRemoveUntil(
                                        MaterialPageRoute(
                                            builder: (context) => VerifyUser()),
                                        (route) => false);
                                  },
                                ),
                                const SizedBox(
                                  height: 40,
                                )
                              ]))
                        ])))));
  }
}

class Test3 extends StatelessWidget {
  final String text;
  final String image;
  final double size;
  final double hite;
  final Function() onPressed;
  const Test3({
    Key key,
    this.text,
    this.image,
    this.size,
    this.hite,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onPressed,

        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(right: 35),
                  child: Container(
                      height: 60,
                      width: 20,
                      decoration: BoxDecoration(
                        color: const Color(0xfff7f7f7),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              image,
                              height: hite,
                            ),
                            Text(
                              text,
                              style: MaaruStyle.text.tiniest,
                            ),
                            SizedBox(
                              width: size,
                            ),
// =======
//     child:  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//       Expanded(
//           child: Padding(
//               padding: EdgeInsets.only(right: 35),
//               child: Container(
//                   height: 60,
//                   width: 20,
//                   decoration: BoxDecoration(
//                     color: Color(0xfff7f7f7),
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                   alignment: Alignment.centerLeft,
//                   child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Image.asset(
//                           image,
//                           height: hite,
//                         ),
//                         Text(
//                           text.toUpperCase(),
//                           style: MaaruStyle.text.tiny,
//                         ),
//                         SizedBox(
//                           width: size,
//                         ),
//
//
//                           // Navigator.of(context).push(
//                           //     MaterialPageRoute(builder: (_) => CreateUserProfile()));
//  Icon(
//                             Icons.navigate_next,
//                             color: MaaruColors.buttonColor,
//                             size: 40,
//                           ),
// >>>>>>> f38077fb070e945e12e76eb4c96ccef8ae6ff65f

                            // Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (_) => CreateUserProfile()));
                            Icon(
                              Icons.navigate_next,
                              color: MaaruColors.buttonColor,
                              size: 40,
                            ),
                          ]))))
        ]));
  }
}
