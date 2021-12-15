
import 'dart:ui';

import 'package:flutter/material.dart';


import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/skip_buttons.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'register_pet_profile_screen3.dart';
const kRegistration4PlainText = TextStyle(
    fontWeight: FontWeight.w600, fontSize: 13,color: Colors.black);
class CreateRegisterPetProfile4 extends StatefulWidget {


  @override
  _CreateRegisterPetProfile4State createState() =>
      _CreateRegisterPetProfile4State();
}

class _CreateRegisterPetProfile4State extends State<CreateRegisterPetProfile4> {
  Color circlecolor1 = MaaruColors.whiteColor;
  Color circlecolor2 = MaaruColors.whiteColor;
  Color circlecolor3 = MaaruColors.whiteColor;
  Color circlecolor4 = MaaruColors.whiteColor;
  Color circlecolor5 = MaaruColors.whiteColor;
  Color circlecolor6 = MaaruColors.whiteColor;
  bool pressed1 = true;
  bool pressed2 = true;
  bool pressed3 = true;
  bool pressed4 = true;
  bool pressed5 = true;
  bool pressed6 = true;
  Widget choosecircle(Image image, String text, Color color) {
    return CircleAvatar(
      radius: 55,
      backgroundColor: MaaruColors.greyColorText,
      child: CircleAvatar(
        backgroundColor: color,
        radius: 53,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            image,
            Text(
              text,
              style: kRegistration4PlainText,
            ),
          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return

      Scaffold(
          backgroundColor: MaaruColors.DogsBackground,

          body:SafeArea(
              top: true,
              bottom: false,
              child:
              SingleChildScrollView(
                  child: Column(children: [  SizedBox(
                    height: 20,
                  ),
                    SkipButtons(),
                    SizedBox(
                      height: 20,
                    ),

                    Container(



              alignment: Alignment.bottomRight,

             height: size.height * 0.25,
              width: size.width * 0.9,
              child:
            BackgroundImage(
                assetImage: 'assets/images/kutta.png',
              )),
          Container(
              width: 1000,
              height: 600,
              alignment: FractionalOffset.bottomCenter,
              decoration: BoxDecoration(
                  color: Color(0xFFffffff),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: Container(

                  padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Max',
                            style: MaaruStyle.text.large,
                            textAlign: TextAlign.left),
                        Text('Jack  Russell',),
                        SizedBox(
                          width: 20,
                        ),
                        SizedBox(
                          width: 40,
                          height: 20,
                        ),
                        Text(
                          'Pet Needs',
                          style: MaaruStyle.text.small,
                        ),
                        // Container(
                        //   height: 350,
                        //   width: 360,
                        //   child: Stack(
                        //     children: <Widget>[
                        //       Positioned(
                        //         top: 30,
                        //         child: GestureDetector(
                        //           onTap: () {
                        //             setState(() {
                        //               circlecolor1 == MaaruColors.whiteColor
                        //
                        //                   ? circlecolor1 =  Color(0xff93b7fd)
                        //
                        //                   : circlecolor1 =  MaaruColors.whiteColor;
                        //             });
                        //           },
                        //           child: choosecircle(
                        //               Image.asset(
                        //                 'assets/icons/Fill 1.png',
                        //                 height: 35,
                        //               ),
                        //               'Grooming',
                        //               circlecolor1),
                        //         ),
                        //       ),
                        //       Positioned(
                        //           left: 200,
                        //           child: GestureDetector(
                        //             onTap: () {
                        //               setState(() {
                        //                 circlecolor2 == MaaruColors.whiteColor
                        //
                        //                     ? circlecolor2 =Color(0xffff9976)
                        //
                        //                     : circlecolor2 = MaaruColors.whiteColor;
                        //               });
                        //             },
                        //             child: choosecircle(
                        //                 Image.asset(
                        //                   'assets/icons/Fill 1 (2).png',
                        //                   height: 35,
                        //                 ),
                        //                 'Vet',
                        //                 circlecolor2),
                        //           )),
                        //       Positioned(
                        //           top: 100,
                        //           left: 110,
                        //           child: GestureDetector(
                        //             onTap: () {
                        //               setState(() {
                        //                 circlecolor3 == MaaruColors.whiteColor
                        //
                        //                     ? circlecolor3 = Color(0xfffff2bf)
                        //
                        //                     : circlecolor3 = MaaruColors.whiteColor;
                        //               });
                        //             },
                        //             child: choosecircle(
                        //                 Image.asset(
                        //                   'assets/icons/Fill 1 (3).png',
                        //                   height: 35,
                        //                 ),
                        //                 'Hotel',
                        //                 circlecolor3),
                        //           )),
                        //       Positioned(
                        //           top: 160,
                        //           child: GestureDetector(
                        //             onTap: () {
                        //               setState(() {
                        //                 circlecolor4 == MaaruColors.whiteColor
                        //
                        //                     ? circlecolor4 = MaaruColors.button2Color
                        //
                        //
                        //                     : circlecolor4 = MaaruColors.whiteColor;
                        //               });
                        //             },
                        //             child: choosecircle(
                        //                 Image.asset(
                        //                   'assets/icons/Fill 1 (1).png',
                        //                   height: 35,
                        //                 ),
                        //                 'Walking',
                        //                 circlecolor4),
                        //           )),
                        //       Positioned(
                        //           top: 130,
                        //           left: 240,
                        //           child: GestureDetector(
                        //             onTap: () {
                        //               setState(() {
                        //                 circlecolor5 == MaaruColors.whiteColor
                        //
                        //                     ? circlecolor5 = Color(0xff4f75fe)
                        //
                        //                     : circlecolor5 = MaaruColors.whiteColor;
                        //               });
                        //             },
                        //             child: choosecircle(
                        //                 Image.asset(
                        //                   'assets/icons/Background.png',
                        //                   height: 35,
                        //                 ),
                        //                 'Daycare',
                        //                 circlecolor5),
                        //           )),
                        //       Positioned(
                        //           top: 230,
                        //           left: 150,
                        //           child: GestureDetector(
                        //             onTap: () {
                        //               setState(() {
                        //                 circlecolor6 == MaaruColors.whiteColor
                        //
                        //                     ? circlecolor6 = Color(0xffFc744f)
                        //
                        //                     : circlecolor6 = MaaruColors.whiteColor;
                        //               });
                        //             },
                        //             child: choosecircle(
                        //                 Image.asset(
                        //                   'assets/icons/Background (1).png',
                        //                   height: 35,
                        //                 ),
                        //                 'Hospital',
                        //                 circlecolor6),
                        //           ))
                        //     ],
                        //   ),
                      //   ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            InkWell(
                            onTap: () {
              setState(() => pressed1 = !pressed1);
              },
                  child:
                            Container(
                                height: 80,
                                width: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: pressed1? MaaruColors.whiteColor :MaaruColors.walkingcolor,
                                  border: Border.all(color: Colors.grey[400]),
                                ),

                                child: Padding(
                                  padding:EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset('assets/icons/Fill 1 (1).png',height: 30,),
                                      SizedBox(width: 10,),
                                      Text('Walking')
                                    ],),
                                )
                            )),
                            InkWell(
                              onTap: () {
                                setState(() => pressed2 = !pressed2);
                              },
                              child:
                            Container(
                                height: 80,
                                width: 150,
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: pressed2? MaaruColors.whiteColor :MaaruColors.groomingcolor,
                                  border: Border.all(color: Colors.grey[400]),
                                ),

                                child:
                                Padding(
                                  padding:EdgeInsets.only(left: 20),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset('assets/icons/Fill 1.png',height: 30,),
                                      SizedBox(width: 10,),
                                      Text('Grooming')
                                    ],),
                                )
                            ),
                            )],),
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() => pressed3 = !pressed3);
                                },
                              child:
                            Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: pressed3? MaaruColors.whiteColor :MaaruColors.vetcolor,
                                  border: Border.all(color: Colors.grey[400]),
                                ),
                                height: 80,
                                width: 150,

                                child: Padding(
                                  padding:EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset('assets/icons/Fill 1 (2).png',height: 30,),
                                      SizedBox(width: 10,),
                                      Text('Vet')
                                    ],),
                                )
                            )),
                            InkWell(
                              onTap: () {
                                setState(() => pressed4 = !pressed4);
                              },
                              child:
                            Container(
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: pressed4? MaaruColors.whiteColor :MaaruColors.hotelcolor,
                                  border: Border.all(color: Colors.grey[400]),
                                ),
                                height: 80,
                                width: 150,

                                child:
                                Padding(
                                  padding:EdgeInsets.only(left: 20),
                                  child: Row(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset('assets/icons/Fill 1 (3).png',height: 30,),
                                      SizedBox(width: 10,),
                                      Text('Hotel')
                                    ],),
                                )
                            ),
                            )],),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,

                          children: [
                            InkWell(
                              onTap: () {
                                setState(() => pressed5 = !pressed5);
                              },
                         child: Container(
                            height: 80,
                            width: 150,
                             decoration: BoxDecoration(
                               shape: BoxShape.rectangle,
                               color: pressed5? MaaruColors.whiteColor :MaaruColors.hospitalcolor,
                               border: Border.all(color: Colors.grey[400]),
                             ),

                            child: Padding(
                              padding:EdgeInsets.only(left: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                Image.asset('assets/icons/Background (1).png',height: 30,),
                                  SizedBox(width: 10,),
                                Text('Hospital')
                              ],),
                            )
                          ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() => pressed6 = !pressed6);
                              },
                           child: Container(
                                height: 80,
                                width: 150,
                               decoration: BoxDecoration(
                                 shape: BoxShape.rectangle,
                                 color: pressed6? MaaruColors.whiteColor :MaaruColors.daycarecolor,
                                 border: Border.all(color: Colors.grey[400]),
                               ),

                                child:
                                Padding(
                                  padding:EdgeInsets.only(left: 20),
                                  child: Row(
                                   // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Image.asset('assets/icons/Background.png',height: 30,),
                                      SizedBox(width: 10,),
                                      Text('Daycare')
                                  ],),
                                )
                            ),
                            )],),
                         SizedBox(
                          height: 40,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          HomeScreen()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color:  Colors.white12,
                                      shape: BoxShape.circle),
                                  child: Text(
                                    'Back',style: MaaruStyle.text.greyDisable,


                                  ),),),

                                        InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (_) =>
                                                          HomeScreen()));
                                            },
                                            child: Container(
                                              alignment: Alignment.centerRight,
                                              child: Image.asset(
                                                  'assets/images/next (2).png',height: 60,),
                                            )),
                                      ]),
                                ]))
          )]))));
  }
}

class Imagesgg extends StatefulWidget {
  final String text;
  final String AssetImage;

  Imagesgg({
    @required this.text,
    this.AssetImage,
  });

  @override
  _ImagesggState createState() => _ImagesggState();
}

class _ImagesggState extends State<Imagesgg> {
  bool pressAttention = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() => pressAttention = !pressAttention);
        },
        child: Container(
            alignment: Alignment.center,
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: pressAttention
                  ? Colors.white
                  : MaaruColors.blueColor,
              border: Border.all(color: Colors.grey[300]),
            ),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Image.asset(
                  widget.AssetImage,
                  height: 20,
                  width: 20,
                ),
              ),
              //  ),
              Text(
                widget.text,
                style: TextStyle(color: MaaruColors.whiteColor),
              ),
            ])));
  }
}
