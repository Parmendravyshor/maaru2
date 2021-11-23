
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
                  padding: EdgeInsets.fromLTRB(30, 20, 30, 10),
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
                        Container(
                          height: 350,
                          width: 360,
                          child: Stack(
                            children: <Widget>[
                              Positioned(
                                top: 30,
                                child: GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      circlecolor1 == MaaruColors.whiteColor
                                          ? circlecolor1 =  MaaruColors.buttonColor
                                          : circlecolor1 =  MaaruColors.whiteColor;
                                    });
                                  },
                                  child: choosecircle(
                                      Image.asset(
                                        'assets/icons/icone-setting-77.png',
                                        height: 35,
                                      ),
                                      'Grooming',
                                      circlecolor1),
                                ),
                              ),
                              Positioned(
                                  left: 200,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        circlecolor2 == MaaruColors.whiteColor
                                            ? circlecolor2 = MaaruColors.buttonColor
                                            : circlecolor2 = MaaruColors.whiteColor;
                                      });
                                    },
                                    child: choosecircle(
                                        Image.asset(
                                          'assets/icons/icone-setting-71.png',
                                          height: 35,
                                        ),
                                        'Vet',
                                        circlecolor2),
                                  )),
                              Positioned(
                                  top: 100,
                                  left: 110,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        circlecolor3 == MaaruColors.whiteColor
                                            ? circlecolor3 = MaaruColors.buttonColor
                                            : circlecolor3 = MaaruColors.whiteColor;
                                      });
                                    },
                                    child: choosecircle(
                                        Image.asset(
                                          'assets/icons/icone-setting-73.png',
                                          height: 35,
                                        ),
                                        'Hotel',
                                        circlecolor3),
                                  )),
                              Positioned(
                                  top: 160,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        circlecolor4 == MaaruColors.whiteColor
                                            ? circlecolor4 = MaaruColors.buttonColor
                                            : circlecolor4 = MaaruColors.whiteColor;
                                      });
                                    },
                                    child: choosecircle(
                                        Image.asset(
                                          'assets/icons/icone-setting-72.png',
                                          height: 35,
                                        ),
                                        'Walking',
                                        circlecolor4),
                                  )),
                              Positioned(
                                  top: 130,
                                  left: 240,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        circlecolor5 == MaaruColors.whiteColor
                                            ? circlecolor5 = MaaruColors.buttonColor
                                            : circlecolor5 = MaaruColors.whiteColor;
                                      });
                                    },
                                    child: choosecircle(
                                        Image.asset(
                                          'assets/icons/icone-setting-74.png',
                                          height: 35,
                                        ),
                                        'Daycare',
                                        circlecolor5),
                                  )),
                              Positioned(
                                  top: 230,
                                  left: 150,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        circlecolor6 == MaaruColors.whiteColor
                                            ? circlecolor6 = MaaruColors.buttonColor
                                            : circlecolor6 = MaaruColors.whiteColor;
                                      });
                                    },
                                    child: choosecircle(
                                        Image.asset(
                                          'assets/icons/icone-setting-76.png',
                                          height: 35,
                                        ),
                                        'Hospital',
                                        circlecolor6),
                                  ))
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          CreateRegisterPetProfile3()));
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
                                        'assets/images/next (2).png'),
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
