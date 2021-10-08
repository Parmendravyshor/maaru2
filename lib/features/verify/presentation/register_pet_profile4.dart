import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/skip_buttons.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'Register_pet_profile_screen3.dart';

class CreateRegisterPetProfile4 extends StatefulWidget {
  @override
  _CreateRegisterPetProfile4State createState() =>
      _CreateRegisterPetProfile4State();
}

class _CreateRegisterPetProfile4State extends State<CreateRegisterPetProfile4> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: MaaruColors.DogsBackground,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
          SkipButtons(),
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
                        Stack(children: [
                          Row(
                            children: [
                              // Padding(
                              //   padding: EdgeInsets.fromLTRB(10, 70, 10, 0),
                              //   child:

                              Padding(
                                  padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                  child: Imagesgg(
                                    AssetImage:
                                        'assets/icons/icone-setting-77.png',
                                    text: 'Grooming',
                                  )),
                              //     ),
                              SizedBox(
                                width: 20,
                                height: 20,
                              ),
                              //    ),
                              Expanded(
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Padding(
                                        padding: EdgeInsets.only(
                                          right: 20,
                                          top: 90,
                                        ),
                                        child: Imagesgg(
                                          AssetImage:
                                              'assets/icons/icone-setting-73.png',
                                          text: 'Hotel',
                                        ),
                                      ))),
                              //  ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                child: Imagesgg(
                                  AssetImage:
                                      'assets/icons/icone-setting-71.png',
                                  text: 'Vet',
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(20, 160, 0, 0),
                            child:
                            Imagesgg(
                              AssetImage: 'assets/icons/icone-setting-72.png',
                              text: 'Walking',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(200, 150, 0, 0),
                            child: Imagesgg(
                              AssetImage: 'assets/icons/icone-setting-74.png',
                              text: 'Day care',
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(120, 220, 0, 0),
                            child: Imagesgg(
                              AssetImage: 'assets/icons/icone-setting-76.png',
                              text: 'Hospital',
                            ),
                          ),
                        ]),
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
                                          CreateRegisterPetProfile3()));
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  height: 50,
                                  width: 60,
                                  decoration: BoxDecoration(
                                      color: Colors.white12,
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
                                                CreateHomeScreen()));
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
            width: 85,
            height: 85,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: pressAttention
                  ? Colors.white
                  : MaaruColors.primaryColorsuggesion1,
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
