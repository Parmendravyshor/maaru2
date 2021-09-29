import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile3.dart';

class ViewPetProfile2 extends StatefulWidget {
  @override
  _ViewPetProfile2State createState() => _ViewPetProfile2State();
}

class _ViewPetProfile2State extends State<ViewPetProfile2> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MaaruColors.DogsBackground,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              SizedBox(
                height: 20,
              ),
              Container(
                  alignment: Alignment.centerRight,
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
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                ViewPetProfile()));
                                  },
                                  child:
                                  Image.asset(
                                  'assets/icons/icone-setting-67.png',
                                  height: 40,
                                  width: 40,
                                )),
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
                                  child:
                                  Image.asset(
                                  'assets/icons/icone-setting-67.png',
                                  height: 40,
                                  width: 40,

                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (_) =>
                                                ViewPetProfile3()));
                                  },
                                  child:
                                  Image.asset(
                                  'assets/icons/icone-setting-68.png',
                                  height: 40,
                                  width: 40,
                                  color: Colors.grey[100],
                                )),
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
                                  Image.asset(
                                    'assets/icons/icone-setting-29.png',
                                    height: 40,
                                  )
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
                                            width: 60,
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
                                            width: 60,
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
                                            width: 60,
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
                                            width: 60,
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
                                                      child: Text('Weight',
                                                          style: MaaruStyle
                                                              .text.red)),
                                                  Text(
                                                    '4lbs',
                                                    style: MaaruStyle
                                                        .text.tinyDisable,
                                                  ),
                                                ]),
                                          ),
                                        ])),
                                SizedBox(
                                  height: 30,
                                ),
                               Text(
                                    'Known Allergies',
                                    style: MaaruStyle.text.large,
                                  ),
                                SizedBox(
                                  height: 20,
                                ),
                                      Text(
                                        'Itchy Skin, Congestion, Postnasal Drip, Wheezing' ,
                                        style: MaaruStyle.text.greyDisable,
                                      ),



                                SizedBox(
                                  height: 30,
                                ),
                                Text('Pet Vaccine',style: MaaruStyle.text.large,),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    height: size.height * 0.13,
                                    width: size.width * 0.85,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[200],
                                      borderRadius: BorderRadius.all(Radius.circular(18.0)
                                         )
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [

                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [

                                                  Text(
                                                    'Robbins',style: MaaruStyle.text.large,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.22,
                                                  ),
                                                Text('Jan. 13, 2019',style: MaaruStyle.text.tinyDisable,)
                                                ],
                                              ),

                                        Padding(
                                            padding:
                                            EdgeInsets.only(left: 20),child:
                                              Text('Austin Vet Services',style: MaaruStyle.text.tinyDisable,))
                                            ]))),
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                    height: size.height * 0.13,
                                    width: size.width * 0.85,
                                    decoration: BoxDecoration(
                                        color: Colors.grey[200],
                                        borderRadius: BorderRadius.all(Radius.circular(18.0)
                                        )
                                    ),
                                    child: Padding(
                                        padding: EdgeInsets.only(top: 20),
                                        child: Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                            children: [

                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceEvenly,
                                                children: [

                                                  Text(
                                                    'Parvo',style: MaaruStyle.text.large,
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    width: size.width * 0.22,
                                                  ),
                                                  Text('Mar. 25, 2020',style: MaaruStyle.text.tinyDisable,)
                                                ],
                                              ),

                                              Padding(
                                                  padding:
                                                  EdgeInsets.only(left: 20),child:
                                              Text('Austin Vet Services',style: MaaruStyle.text.tinyDisable,))
                                            ]))),

                              ],
                            )
                          ])))
            ]))));
  }
}