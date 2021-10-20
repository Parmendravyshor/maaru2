

import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/core/widget/skip_buttons.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile2.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile3.dart';

class ViewPetProfile extends StatefulWidget {
  @override
  _ViewPetProfileState createState() => _ViewPetProfileState();
}

class _ViewPetProfileState extends State<ViewPetProfile> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MaaruColors.DogsBackground,
        body: SafeArea(
          bottom: false,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.bottomRight,
                  height: size.height * 0.25,
                  width: size.width * 0.9,
                  child: BackgroundImage(
                    assetImage: 'assets/images/kutta.png',
                  )),
              Container(
                  //height: size.,
                  width: 1000,
                  height: 700,
                  alignment: FractionalOffset.bottomCenter,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Container(
                      padding: EdgeInsets.fromLTRB(30, 10, 0, 10),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  'assets/icons/icone-setting-67.png',
                                  height: 40,
                                  width: 40,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) =>
                                                  ViewPetProfile2()));
                                    },
                                    child: Image.asset(
                                      'assets/icons/icone-setting-68.png',
                                      height: 40,
                                      width: 40,
                                      color: Colors.grey[100],
                                    )),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) => ViewPetProfile3()));
                                  },
                                  child: Image.asset(
                                    'assets/icons/icone-setting-68.png',
                                    height: 40,
                                    width: 40,
                                    color: Colors.grey[100],
                                  ),
                                )
                              ],
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Text(
                                    'Max',
                                    style: MaaruStyle.text.large,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.60,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (_) =>
                                                    CreateregisterPetProfile1()));
                                      },
                                      child: Image.asset(
                                        'assets/icons/icone-setting-29.png',
                                        height: 40,
                                      ))
                                ]),
                            Text(
                              'Jack  Russell',
                              style: MaaruStyle.text.tiny,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                    padding:
                                        EdgeInsets.only(right: 30, top: 20),
                                    child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 80,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[50],
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 20),
                                                      child: Text('Age',
                                                          style: MaaruStyle
                                                              .text.red)),
                                                  Text('2',
                                                      style: MaaruStyle
                                                          .text.tinyDisable),
                                                ]),
                                          ),
                                          Container(
                                            height: 80,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[50],
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 20),
                                                      child: Text('Sex',
                                                          style: MaaruStyle
                                                              .text.red)),
                                                  Text('Male',
                                                      style: MaaruStyle
                                                          .text.tinyDisable),
                                                ]),
                                          ),
                                          Container(
                                            height: 80,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[50],
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 20),
                                                      child: Text('Height',
                                                          style: MaaruStyle
                                                              .text.red)),
                                                  Text('8"',
                                                      style: MaaruStyle
                                                          .text.tinyDisable),
                                                ]),
                                          ),

                                          Container(
                                            height: 80,
                                            width: 70,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[50],
                                              shape: BoxShape.rectangle,
                                              borderRadius:
                                                  BorderRadius.circular(15.0),
                                            ),
                                            child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                      padding: EdgeInsets.only(
                                                          top: 20),
                                                      child:
                                                      Text('Weight',
                                                          style: MaaruStyle
                                                              .text.red)),
                                                  Text('4lbs',
                                                      style: MaaruStyle
                                                          .text.tinyDisable),
                                                ]),
                                          ),
                                        ])),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    height: size.height * 0.13,
                                    width: size.width * 0.99,
                                    decoration: BoxDecoration(
                                      color: Colors.green[50],
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          bottomLeft: Radius.circular(30)),
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                  padding:
                                                      EdgeInsets.only(left: 43),
                                                  child: Text(
                                                    'Jimmmy Booker',
                                                    style:
                                                        MaaruStyle.text.tiniest,
                                                  )),
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Text(
                                                    'Owner',
                                                    style: MaaruStyle.text.tiny,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.22,
                                                  ),
                                                  Image.asset(
                                                    'assets/icons/icone-setting-69.png',
                                                    height: 20,
                                                  )
                                                ],
                                              ),
                                            ]))),
                                SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Upcoming Appointments',
                                  style: MaaruStyle.text.tiniest,
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                Padding(
                                    padding: EdgeInsets.only(right: 20),
                                    child: Image.asset(
                                        'assets/images/austintext-1.png')),
                                SizedBox(
                                  height: 20,
                                ),
                                RoundedButton(
                                  buttonName: 'View all Appointments',
                                  Color: MaaruColors.primaryColorsuggesion,
                                  Color1: MaaruColors.primaryColorsuggesion1,
                                )
                              ],
                            )
                          ])))
            ]))));
  }
}
