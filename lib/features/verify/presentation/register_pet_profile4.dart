
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

  Widget choosecontainer(
      BuildContext context, Image image, String text, Color color) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: MaaruColors.textfeildline,width: size.width*0.01),
        color: color,
      ),
      height: size.height * 0.10,
      width: size.width * 0.43,
      child: Container(
        margin: EdgeInsets.only(left: 12, top: 9, bottom: 9),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            image,
            SizedBox(
              width: size.width * 0.02,
            ),
            Text(text,style: MaaruStyle.text.tiny,),
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
                            ),
                        child: Container(

                            padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Max'.toUpperCase(),
                                      style: MaaruStyle.text.large,
                                      textAlign: TextAlign.left),
                                  Text('Jack  Russell'.toUpperCase(),),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 40,
                                    height: 20,
                                  ),
                                  Text(
                                    'Pet Needs'.toUpperCase(),
                                    style: MaaruStyle.text.small,
                                  ),
                                  Column(
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                circlecolor1 == MaaruColors.whiteColor
                                                    ? circlecolor1 = MaaruColors.groomingcolor
                                                    : circlecolor1 = MaaruColors.whiteColor;
                                              });
                                            },
                                            child: choosecontainer(
                                                context,
                                                Image.asset(
                                                  'assets/icons/Fill 1.png',
                                                  height: 35,
                                                ),
                                                'GROOMING',
                                                circlecolor1),
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  circlecolor2 == MaaruColors.whiteColor
                                                      ? circlecolor2 = MaaruColors.vetcolor
                                                      : circlecolor2 = MaaruColors.whiteColor;
                                                });
                                              },
                                              child: choosecontainer(
                                                  context,
                                                  Image.asset(
                                                    'assets/icons/Fill 1 (2).png',
                                                    height: 35,
                                                  ),
                                                  'VET',
                                                  circlecolor2)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  circlecolor3 == MaaruColors.whiteColor
                                                      ? circlecolor3 = MaaruColors.hotelcolor
                                                      : circlecolor3 = MaaruColors.whiteColor;
                                                });
                                              },
                                              child: choosecontainer(
                                                  context,
                                                  Image.asset(
                                                    'assets/icons/Fill 1 (3).png',
                                                    height: 35,
                                                  ),
                                                  'HOTEL',
                                                  circlecolor3)),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  circlecolor4 == MaaruColors.whiteColor
                                                      ? circlecolor4 = MaaruColors.walkingcolor
                                                      : circlecolor4 = MaaruColors.whiteColor;
                                                });
                                              },
                                              child: choosecontainer(
                                                  context,
                                                  Image.asset(
                                                    'assets/icons/Fill 1 (1).png',
                                                    height: 35,
                                                  ),
                                                  'WALKING',
                                                  circlecolor4)),
                                        ],
                                      ),
                                      SizedBox(
                                        height: size.height * 0.02,
                                      ),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  circlecolor5 == MaaruColors.whiteColor
                                                      ? circlecolor5 = MaaruColors.daycarecolor
                                                      : circlecolor5 = MaaruColors.whiteColor;
                                                });
                                              },
                                              child: choosecontainer(
                                                  context,
                                                  Image.asset(
                                                    'assets/icons/Background.png',
                                                    height: 35,
                                                  ),
                                                  'DAYCARE',
                                                  circlecolor5)),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  circlecolor6 == MaaruColors.whiteColor
                                                      ? circlecolor6 = MaaruColors.hospitalcolor
                                                      : circlecolor6 = MaaruColors.whiteColor;
                                                });
                                              },
                                              child: choosecontainer(
                                                  context,
                                                  Image.asset(
                                                    'assets/icons/Background (1).png',
                                                    height: 35,
                                                  ),
                                                  'HOSPITAL',
                                                  circlecolor6)),
                                        ],
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        InkWell(
                                          onTap: () {
                                          Navigator.pop(context);
                                          },
                                          child: Container(
                                            alignment: Alignment.center,
                                            height: 50,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                color:  Colors.white12,
                                                shape: BoxShape.circle),
                                            child: Text(
                                              'BACK',style: MaaruStyle.text.greyDisable,
                                            ),
                                          ),
                                        ),
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
                                ])))
                  ]))));
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
