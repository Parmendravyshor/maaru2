
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/alert_manager.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen3.dart';
import 'package:maru/features/Book_Appointment/presentation/reviewe_screen.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';

import 'package:maru/features/register/presentation/signup_screen.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';

import '../../../main.dart';

class BookedConfirm extends StatefulWidget {
  @override
  _BookedConfirmState createState() => _BookedConfirmState();
}

class _BookedConfirmState extends State<BookedConfirm> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MaaruColors.primaryColorsuggesion1,
        bottomNavigationBar: CreateHomeScreen(
          // Color:MaaruColors.textButtonColor
        ),
      body: SafeArea(
        bottom: false,
        child:
      ListView(
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
                  topRight: Radius.circular(20), topLeft: Radius.circular(20)),
              color: Colors.white,
            ),

            child:
            Container(
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
                                'Austin Pet Groomming',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'Pet Grooming',
                                style: TextStyle(fontSize: 10),
                              ),
                            ])
                      ])),
                  Container(
                    height: 135,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.calendar_today_outlined,
                                size: 22,
                                color: Colors.yellow,
                              ),
                              Icon(
                                Icons.bike_scooter,
                                size: 22,
                                color: Colors.yellow,
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 0,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '  Date & Time',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Text(
                                'Austin pet Groomers',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                              Text(
                                'Max',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 15),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Aug 21,2021',
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Text(
                                '11:00 am',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                '\$85.00',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Text(
                    'Location',
                    style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '1357 Muno Manor Austin,Tx 00000',
                        style: TextStyle(fontSize: 8, color: Colors.grey),
                      ),
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
                  SizedBox(height: 20,),
                  Row(
                    children: [
                      TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  MaaruColors.primaryColorsuggesion1,
                              minimumSize: Size(130, 50),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                  color:Colors.white,

                                ),
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => ReviewScreen()));
                          },
                          child: Text('Done',
                              style: MaaruStyle.text.small.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: MaaruColors.primaryColorsuggesion))),
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
                              backgroundColor: MaaruColors.textButtonColor,
                              minimumSize: Size(130, 50),
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color:Colors.white,

                                   ),
                                borderRadius: BorderRadius.circular(10)),
                          ),

                          onPressed: () {

                                showAlertDialog(context)  ;


                          },
                          child: Text('Cancel',
                              style: MaaruStyle.text.small.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: MaaruColors.primaryColorsuggesion))),
                      SizedBox(
                        width: 20,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 50,
                        width: 170,
                          decoration: BoxDecoration(
                              color: MaaruColors.primaryColorsuggesion,
                              borderRadius: BorderRadius.circular(10)),
                  child:FlatButton(
                        height: 50,
                        minWidth: 170,
                        color: MaaruColors.primaryColorsuggesion,
                        onPressed: (){Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => BookAppointmentScreen3()));},
                        child:
                            Padding(padding:EdgeInsets.only(top: 10),child:
                        Text('Reschedule',
                            style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                              color: MaaruColors
                                  .primaryColorsuggesion1, //   fontWeight: FontWeight.bold,
                              fontFamily: 'Poppins',
                              fontSize: 20,
                              fontWeight: FontWeight.w600,
                            )))),
                        textColor: MaaruColors.textButtonColor,
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color:Colors.white,

                        ),
                        borderRadius: BorderRadius.circular(10)),
                      )
                      )],
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            ),
          )
          ],
      ),
    ));
  }

  showAlertDialog(BuildContext context,) {
    final size = MediaQuery.of(context).size;
    // set up the buttons
    Widget cancelButton = TextButton(
      style: TextButton.styleFrom(
          backgroundColor: MaaruColors.textButtonColor,
          minimumSize: Size(130, 50)),
      child: Text("Cancel", style: MaaruStyle.text.small.copyWith(
          fontWeight: FontWeight.w500,
          color: MaaruColors.primaryColorsuggesion)),
      onPressed:  () {
        Navigator.pop(context);
      },
    );

    Widget continueButton = TextButton(
      style: TextButton.styleFrom(
          backgroundColor: MaaruColors.primaryColorsuggesion1,
          minimumSize: Size(130, 50)),
      child: Text("Continue",style: MaaruStyle.text.small.copyWith(
          fontWeight: FontWeight.w500,
          color: MaaruColors.primaryColorsuggesion),),
      onPressed:  () {
        AlertManager.showSuccessMessage( "Appointment cancel successful", context);
        Navigator.of(context).push(MaterialPageRoute(builder: (_)=>HomeScreen()));
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(

      title: Container(
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
      content:
      Text("Are you want to \n cancel Appointment?",textAlign: TextAlign.center,),
      actions: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
        cancelButton,
        continueButton,
      ]),
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
