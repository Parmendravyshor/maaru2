import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kiwi/kiwi.dart';
import 'package:flutter/scheduler.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/skip_buttons.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';

import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'register_pet_profile_screen3.dart';

const kRegistration4PlainText =
    TextStyle(fontWeight: FontWeight.w600, fontSize: 13, color: Colors.black);

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

  var select1 = '';
  var select2 = '';
  var select3 = '';
  var select4 = '';
  var select5 = '';
  var select6 = '';



  Widget choosecontainer(
      BuildContext context, Image image, String text, Color color) {
    final size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(

        border: Border.all(
          color: MaaruColors.textfeildline,
        ),


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
            Text(
              text,
              style: MaaruStyle.text.tiny,


            ),
         //   Text(text,style: MaaruStyle.text.tiny,),
          ],
        ),
      ),
    );
  }
  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocProvider(
        create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
        child: Scaffold(
            backgroundColor:Colors.white,
            body: BlocProvider(
                create: (context) => KiwiContainer().resolve<PetProfileBloc>(),
                child: BlocBuilder<PetProfileBloc, PetProfileState>(
                    builder: (context, state) {
                  if (state is pet4rofileButtonTapped) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (BuildContext context) {
                        return HomeScreen();
                      }));
                    });

                    return Container();
                  } else if (state is RegisterFailure) {
                    SchedulerBinding.instance.addPostFrameCallback((_) {
                      Future.delayed(Duration(seconds: 3), () {
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            backgroundColor: Colors.black,
                            content: Text('Register Failure ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontFamily: 'poppins',
                                    fontSize: 20,
                                    color: MaaruStyle.colors.textColorWhite)),
                          ),
                        );
                      });
                    });
                  }
                  return Scaffold(
                      backgroundColor: MaaruColors.whiteColor,
                      body: SafeArea(
                          top: true,
                          bottom: false,
                          child: SingleChildScrollView(
                              child: Column(children: [
                                Stack(fit: StackFit.loose, children: <Widget>[
                                  Container(
                                      alignment: Alignment.bottomRight,
                                      // height: size.height * 0.20,
                                      // width: size.width * 0.9,
                                      child:
                                      Center(
                                        child: Image.network(
                                            _prefHelper.getStringByKey('img', ''),
                                            width:450,
                                            height: 250,
                                            fit: BoxFit.fitWidth,
                                            errorBuilder: (context, error, stackTrace) {
                                              return Container(
                                                  color: MaaruColors.DogsBackground,
                                                  alignment: Alignment.center,
                                                  child: Image.asset('assets/images/kutta.png'));
                                            }),
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          top: 30.0,bottom: 10
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: <Widget>[
                                          SkipButtons(),
                                        ],
                                      )),
                                ]),



                                Container(
                                width: 1000,
                                height: 600,
                                alignment: FractionalOffset.bottomCenter,
                                decoration:const BoxDecoration(
                                  color: Color(0xFFffffff),
                                ),
                                child: Container(
                                    padding:
                                        EdgeInsets.fromLTRB(20, 20, 20, 10),
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(_prefHelper.getStringByKey('pet_name', ''),
                                              style: MaaruStyle.text.large,
                                              textAlign: TextAlign.left),
                                          Text(
                                              _prefHelper.getStringByKey('breed_type', '')
                                          ),
                                          const SizedBox(
                                            width: 20,
                                          ),
                                          const SizedBox(
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      setState(() {
                                                        circlecolor1 ==
                                                                MaaruColors
                                                                    .whiteColor
                                                            ? circlecolor1 =
                                                                MaaruColors
                                                                    .groomingcolor
                                                            : circlecolor1 =
                                                                MaaruColors
                                                                    .whiteColor;
                                                        if (circlecolor1 ==
                                                            MaaruColors
                                                                .groomingcolor) {
                                                          select1 = 'Grooming';
                                                          print(select1);
                                                        }
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
                                                          circlecolor2 ==
                                                                  MaaruColors
                                                                      .whiteColor
                                                              ? circlecolor2 =
                                                                  MaaruColors
                                                                      .vetcolor
                                                              : circlecolor2 =
                                                                  MaaruColors
                                                                      .whiteColor;
                                                          if (circlecolor2 ==
                                                              MaaruColors
                                                                  .vetcolor) {
                                                            select2 = 'vet';
                                                            print(select2);
                                                          }
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          circlecolor3 ==
                                                                  MaaruColors
                                                                      .whiteColor
                                                              ? circlecolor3 =
                                                                  MaaruColors
                                                                      .hotelcolor
                                                              : circlecolor3 =
                                                                  MaaruColors
                                                                      .whiteColor;
                                                          if (circlecolor3 ==
                                                              MaaruColors
                                                                  .hotelcolor) {
                                                            select3 = 'hotel';
                                                            print(select3);
                                                          }
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
                                                          circlecolor4 ==
                                                                  MaaruColors
                                                                      .whiteColor
                                                              ? circlecolor4 =
                                                                  MaaruColors
                                                                      .walkingcolor
                                                              : circlecolor4 =
                                                                  MaaruColors
                                                                      .whiteColor;
                                                          if (circlecolor4 ==
                                                              MaaruColors
                                                                  .walkingcolor) {
                                                            select4 = 'walking';
                                                            print(select4);
                                                          }
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
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  GestureDetector(
                                                      onTap: () {
                                                        setState(() {
                                                          circlecolor5 ==
                                                                  MaaruColors
                                                                      .whiteColor
                                                              ? circlecolor5 =
                                                                  MaaruColors
                                                                      .daycarecolor
                                                              : circlecolor5 =
                                                                  MaaruColors
                                                                      .whiteColor;
                                                          if (circlecolor5 ==
                                                              MaaruColors
                                                                  .daycarecolor) {
                                                            select5 = 'daycare';
                                                            print(select5);
                                                          }
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
                                                          circlecolor6 ==
                                                                  MaaruColors
                                                                      .whiteColor
                                                              ? circlecolor6 =
                                                                  MaaruColors
                                                                      .hospitalcolor
                                                              : circlecolor6 =
                                                                  MaaruColors
                                                                      .whiteColor;
                                                          if (circlecolor6 ==
                                                              MaaruColors
                                                                  .hospitalcolor) {
                                                            select6 = 'hospital';
                                                            print(select6);
                                                          }
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
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 50,
                                                    width: 60,
                                                    decoration:const BoxDecoration(
                                                        color: Colors.white12,
                                                        shape: BoxShape.circle),
                                                    child: Text(
                                                      'BACK',
                                                      style: MaaruStyle
                                                          .text.greyDisable,
                                                    ),
                                                  ),
                                                ),
                                                InkWell(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (_) =>
                                                                  HomeScreen()));
                                                      BlocProvider.of<PetProfileBloc>(
                                                          context)
                                                          .add(Profile4(
                                                        walking: select1  ,
                                                        grooming: select2,
                                                        vet: select3,
                                                        hospital: select4,
                                                        hotel: select5,
                                                      ));
                                                    },
                                                    child: Container(
                                                      alignment:
                                                          Alignment.centerRight,
                                                      child: Image.asset(
                                                        'assets/images/next (2).png',
                                                        height: 60,
                                                      ),
                                                    )),
                                              ]),
                                        ])))
                          ]))));
                }))));
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
              color: pressAttention ? Colors.white : MaaruColors.blueColor,
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
