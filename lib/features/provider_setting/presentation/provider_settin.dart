import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/features/Account_setting/presentation/bloc/account_setting.dart';
import 'package:maru/features/Account_setting/presentation/bloc/change_password_screen.dart';
import 'package:maru/features/Account_setting/presentation/bloc/edit_profile_screen.dart';
import 'package:maru/features/Account_setting/presentation/payment/payment_screen.dart';
import 'package:maru/features/Account_setting/presentation/transition.dart';
import 'package:maru/features/provider_home/presentation/create_provider_home.dart';
import 'package:maru/features/provider_home/presentation/webview.dart';
import 'package:maru/features/provider_setting/presentation/change_pasword.dart';
import 'package:maru/features/provider_setting/presentation/edit_profile.dart';
import 'package:maru/features/splash/verify_screen.dart';
import 'package:maru/features/splash/view/after_splash_screen.dart';
import 'package:flutter/material.dart';

class ProviderSetting extends StatefulWidget {
  @override
  _ProviderSettingState createState() => _ProviderSettingState();
}

class _ProviderSettingState extends State<ProviderSetting> {
  final SharedPrefHelper _prefHelper =
      KiwiContainer().resolve<SharedPrefHelper>();
  bool priceupdate_value = true;

  bool update = true;
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    var selectedIndex;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CreateProviderHome(
            selectedIndex: 4,
            Color3: selectedIndex == 4
                ? Colors.grey[300]
                : MaaruColors.textButtonColor),
        body: SafeArea(
            child: SingleChildScrollView(

                //  child
                //   Padding(
                padding: EdgeInsets.only(
                  left: 20,
                ),
                child: Flex(direction: Axis.vertical, children: [
                  Column(
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
                                  'Account Setting'.toUpperCase(),
                                  style: MaaruStyle.text.tiny,
                                ),
                              ),
                              SizedBox(
                                height: size.height*0.02,
                              ),
                              Test3(
                                image: 'assets/icons/icone-setting-1.png',
                                hite: 40,
                                text: 'Edit Profile'.toUpperCase(),
                                size: 115,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          const ProviderEditProfile()));
                                },
                              ),
                              SizedBox(
                                height: size.height*0.02,
                              ),
                              Test3(
                                image: 'assets/icons/icone-setting-2.png',
                                hite: 40,
                                text: 'Change Password'.toUpperCase(),
                                size: 55,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          ChangePaswordProviderSideScreen()));
                                },
                              ),
                              SizedBox(
                                height: size.height*0.02,
                              ),
                              Test3(
                                image: 'assets/icons/icone-setting-3.png',
                                hite: 40,
                                text: 'Transactions'.toUpperCase(),
                                size: 90,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => TransitionScreen()));
                                },
                              ),
                              SizedBox(
                                height: size.height*0.02,
                              ),
                              Test3(
                                image: 'assets/icons/icone-setting-3.png',
                                hite: 40,
                                text: 'ACH Information'.toUpperCase(),
                                size: 60,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => AchInformationWebView()));
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
                                            padding: EdgeInsets.only(right: 30),
                                            child: Container(
                                                height: 60,
                                                width: 400,
                                                decoration: BoxDecoration(
                                                  color: Color(0xfff7f7f7),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0),
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
                                                          value: update,
                                                          onChanged: (bool
                                                              priceupdatevalue) {
                                                            setState(() {
                                                              update =
                                                                  priceupdatevalue;
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
                                            padding: EdgeInsets.only(right: 30),
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
                                                        'Email Notification'.toUpperCase()
                                                            .toUpperCase(),
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
                                                              print(
                                                                  priceupdateValue);
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
                                text: 'Privacy Policy'.toUpperCase(),
                                size: 90,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => WebViewPolicy()));
                                },
                              ),
                              SizedBox(
                                height: size.height*0.02,
                              ),
                              Test3(
                                image: 'assets/icons/icone-setting-7.png',
                                hite: 35,
                                text: 'Terms and  Conditions'.toUpperCase(),
                                size: 15,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => WebViewPrivacy()));
                                },
                              ),
                               SizedBox(
                                height: size.height*0.02,
                              ),
                              Test3(
                                image:
                                    'assets/images/126-1264365_grey-logout-icon-png-transparent-png (2).png',
                                hite: 30,
                                size: 130,
                                text: 'Log Out'.toUpperCase(),
                                onPressed: () async {
                                  await _prefHelper.clear('pet_name');
                                  await _prefHelper.clear('last_name');
                                  await _prefHelper.clear('first_name');
                                  Navigator.of(context).pushAndRemoveUntil(
                                      MaterialPageRoute(
                                          builder: (_) => VerifyUser()),
                                      (route) => false);
                                },
                              )
                            ])),
                        const SizedBox(
                          height: 30,
                        )
                      ])
                ]))));
  }
}
