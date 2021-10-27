import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/features/Book_Appointment/presentation/reviewe_screen.dart';
import 'package:maru/features/register/presentation/signup_screen.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';

import '../../../main.dart';
import 'book_appointment_screen3.dart';

class ProviderBookedConfirm extends StatefulWidget {
  @override
  _ProviderBookedConfirmState createState() => _ProviderBookedConfirmState();
}

class _ProviderBookedConfirmState extends State<ProviderBookedConfirm> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: MaaruColors.primaryColorsuggesion1,
        body: SafeArea(
          bottom: false,
          child: ListView(
            children: [
              Flex(direction: Axis.vertical, children: [
                Container(
                  color: Color(0xff236855),
                  height: size.height * 0.30,
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
//SizedBox(height: size.height*0.06,),
                      Icon(
                        Icons.check_circle,
                        size: 60,
                        color: Colors.white,
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        'Booking Confirmed',
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Text(
                        'Confirmation email and SMS has been\n'
                        'sent to your registered details',
                        textAlign: TextAlign.center,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                ),
              ]),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20)),
                  color: Colors.white,
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text(
                        'Appointment Details',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: size.height * 0.02,
                      ),
                      Container(
                          color: Colors.transparent,
                          height: size.height * 0.08,
                          width: size.width * 0.99,
                          child: Row(children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white),
                              height: size.height * 0.08,
                              width: size.width * 0.16,
                              child: Image.asset(
                                'assets/images/kutta.png',
                                height: size.height * 0.08,
                                width: size.width * 0.16,
                              ),
                            ),
                            SizedBox(
                              width: size.width * 0.05,
                            ),
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Max',
                                    style: MaaruStyle.text.large,
                                  ),
                                  Text(
                                    'Dog Grooming',
                                    style: MaaruStyle.text.tiny,
                                  ),
                                ])
                          ])),
                      Container(
                          height: size.height * 0.13,
                          width: size.width * 1,
                          padding: EdgeInsets.only(right: 20, left: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Color(0xFFf9f9f9),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/icons/icone-setting-21.png',
                                      height: 20,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Date & Time ',
                                      style: MaaruStyle.text.greyDisable,
                                    ),
                                    SizedBox(
                                      width: 100,
                                    ),
                                    Text(
                                      'Aug. 21,2021 ',
                                      style: MaaruStyle.text.greyDisable,
                                    )
                                  ]),
                              Text(
                                '10:20 am',
                                style: MaaruStyle.text.tiny,
                              ),
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Austin Pety Grooming ',
                                      style: MaaruStyle.text.tiny,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text(
                                      '\$85.0 ',
                                      style: MaaruStyle.text.tiny,
                                    )
                                  ]),
                            ],
                          )),
                      Text('Location', style: MaaruStyle.text.greyDisable),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('1357 Muno Manor Austin,Tx 00000',
                              style: MaaruStyle.text.greyDisable),
                          Image.asset(
                            'assets/icons/icone-setting-24.png',
                            height: size.height * 0.03,
                          )
                        ],
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => SimpleMAp()));
                          },
                          child: Image.asset(
                            'assets/images/g.png',
                            height: size.height * 0.20,
                            width: size.width * 1,
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  backgroundColor:
                                      MaaruColors.primaryColorsuggesion1,
                                  minimumSize: Size(130, 50)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => ReviewScreen()));
                              },
                              child: Text('Done',
                                  style: MaaruStyle.text.small.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color:
                                          MaaruColors.primaryColorsuggesion))),
                          SizedBox(
                            width: 20,
                          ),
                          FlatButton(
                            height: 50,
                            minWidth: 170,
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) => ViewPetProfile()));
                            },
                            child: Text('View Profile',
                                style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                  color: MaaruColors
                                      .primaryColorsuggesion1, //   fontWeight: FontWeight.bold,
                                  fontFamily: 'Poppins',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ))),
                            textColor: MaaruColors.textButtonColor,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: MaaruColors.primaryColorsuggesion1,
                                    width: 1,
                                    style: BorderStyle.solid),
                                borderRadius: BorderRadius.circular(10)),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          TextButton(
                              style: TextButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  backgroundColor: MaaruColors.textButtonColor,
                                  minimumSize: Size(130, 50)),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (_) => RegisterScreen()));
                              },
                              child: Text('Cancel',
                                  style: MaaruStyle.text.small.copyWith(
                                      fontWeight: FontWeight.w500,
                                      color:
                                          MaaruColors.primaryColorsuggesion))),
                          SizedBox(
                            width: 20,
                          ),
                          Container(
                              height: 50,
                              width: 170,
                              decoration: BoxDecoration(
                                  color: MaaruColors.primaryColorsuggesion,
                                  borderRadius: BorderRadius.circular(10)),
                              child: FlatButton(
                                height: 50,
                                minWidth: 170,
                                color: MaaruColors.primaryColorsuggesion,
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          BookAppointmentScreen3()));
                                },
                                child: Text('Reschedule',
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle(
                                      color: MaaruColors
                                          .primaryColorsuggesion1, //   fontWeight: FontWeight.bold,
                                      fontFamily: 'Poppins',
                                      fontSize: 20,
                                      fontWeight: FontWeight.w600,
                                    ))),
                                textColor: MaaruColors.textButtonColor,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}