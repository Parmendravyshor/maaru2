

import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/disclaimer.dart';
import 'package:maru/features/Account_setting/presentation/change_password_screen.dart';
import 'package:maru/features/Account_setting/presentation/payment_screen.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/splash/verify_screen.dart';
import 'package:maru/features/splash/view/after_splash_screen.dart';
import 'package:maru/features/splash/view/view.dart';
import 'edit_profile_screen.dart';

class AccountSettingScreen extends StatefulWidget {
  @override
  _AccountSettingScreenState createState() => _AccountSettingScreenState();
}

class _AccountSettingScreenState extends State<AccountSettingScreen> {
  bool priceupdate_value = true;
  bool update = true;
  @override
  Widget build(BuildContext context) {
    var selectedIndex;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CreateHomeScreen(
          selectedIndex: 4,
          Color3:  selectedIndex == 4
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            alignment: Alignment.centerRight,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Image.asset(
                              'assets/128/CrystalGaskell.png',
                              height: 60,
                              width: 60,
                            ),
                          )),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Column(children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                'Account Setting',
                                style: MaaruStyle.text.large,
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Test3(
                              image: 'assets/icons/icone-setting-1.png',
                              hite: 40,
                              text: 'Edit Profile',
                              size: 115,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => CreateUserProfile()));
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Test3(
                              image: 'assets/icons/icone-setting-2.png',
                              hite: 40,
                              text: 'Change Password',
                              size: 35,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ChangePasswordScreen()));
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Test3(
                              image: 'assets/icons/icone-setting-3.png',
                              hite: 40,
                              text: 'Payment',
                              size: 130,
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => PaymentScreen()));
                              },
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 30),
                                          child: Container(
                                              height: 60,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                color: MaaruColors.darkGrey2,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: Alignment.centerLeft,
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
                                                      'Push Notification',
                                                      style: MaaruStyle
                                                          .text.tiniest,
                                                    ),
                                                    SizedBox(
                                                      width: 35,
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.centerLeft,
                                                      // child: Transform.scale(
                                                      //   scale: 1.2,
                                                      child: Switch(
                                                        activeColor: MaaruColors
                                                            .buttonTextColor,
                                                        inactiveThumbColor:
                                                            MaaruColors
                                                                .buttonTextColor,
                                                        // title: Text("Do you want to update your price?"),
                                                        // controlAffinity: ListTileControlAffinity.leading,
                                                        value:
                                                            priceupdate_value,
                                                        onChanged: (bool
                                                            priceupdateValue) {
                                                          setState(() {
                                                            priceupdate_value =
                                                                priceupdateValue;
                                                          });
                                                        },
                                                      ),
                                                    ),
                                                  ]))))
                                ]),
                            SizedBox(
                              height: 20,
                            ),
                            Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                      child: Padding(
                                          padding: EdgeInsets.only(right: 30),
                                          child: Container(
                                              height: 60,
                                              width: 400,
                                              decoration: BoxDecoration(
                                                color: MaaruColors.darkGrey2,
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              alignment: Alignment.centerLeft,
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
                                                      'Email Notification',
                                                      style: MaaruStyle
                                                          .text.tiniest,
                                                    ),
                                                    SizedBox(
                                                      width: 33,
                                                    ),
                                                    Switch(
                                                      activeColor: MaaruColors
                                                          .buttonTextColor,
                                                      inactiveThumbColor:
                                                          MaaruColors
                                                              .buttonTextColor,
                                                      // title: Text("Do you want to update your price?"),
                                                      // controlAffinity: ListTileControlAffinity.leading,
                                                      value: update,
                                                      onChanged: (bool Update) {
                                                        setState(() {
                                                          update = Update;
                                                        });
                                                      },
                                                    ),
                                                  ]))))
                                ]),
                            SizedBox(
                              height: 20,
                            ),
                            Test3(
                              image: 'assets/icons/icone-setting-6.png',
                              hite: 40,
                              text: 'Privacy Policy',
                              size: 90,
                              onPressed: () {},
                            ),
                            SizedBox(
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
                              height: 20,
                            ),
                            Test3(
                              image:
                                  'assets/images/126-1264365_grey-logout-icon-png-transparent-png.png',
                              hite: 40,
                              size: 130,
                              text: 'Log Out',
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => VerifyUser()));
                              },
                            ),
                            SizedBox(
                              height: 40,
                            )
                          ]))
                    ]))));
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
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Expanded(
          child: Padding(
              padding: EdgeInsets.only(right: 35),
              child: Container(
                  height: 60,
                  width: 20,
                  decoration: BoxDecoration(
                    color: MaaruColors.darkGrey2,
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
                        InkWell(
                          onTap: onPressed,
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (_) => CreateUserProfile()));

                          child: Icon(
                            Icons.navigate_next,
                            color: MaaruColors.buttonTextColor,
                            size: 40,
                          ),
                        ),
                      ]))))
    ]);
  }
}
