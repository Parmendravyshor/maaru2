
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
import 'package:maru/features/Home/presentation/pet_profile.dart';

import 'package:maru/features/register/presentation/signup_screen.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';

import '../../../main.dart';

class BookedConfirm extends StatefulWidget {
  @override
  _BookedConfirmState createState() => _BookedConfirmState();
}

class _BookedConfirmState extends State<BookedConfirm> {
String taskheading='Booking Confirmed';
 String taskmessage= 'Confirmation email and SMS has been\n'
 'sent to your registered details';
Color actioncolor=MaaruColors.blueColor;

  Widget bottombuttons(BuildContext context, Color color, String text, Function() onpress) {

    final size = MediaQuery.of(context).size;
    return FlatButton(
        color: color,
        height: size.height * 0.08,
        minWidth: size.width * 0.40,
        onPressed: onpress,
        child: Text(
          text,
          style: TextStyle(
              color: MaaruColors.whiteColor, fontSize: 15, fontWeight: FontWeight.w700),
        ));
  }
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: MaaruColors.blueColor,
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
              color: actioncolor,
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
                    taskheading,
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Text(
                    taskmessage,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ],
              ),
            ),
          ]),
          Container(
            decoration: BoxDecoration(

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
                    padding: EdgeInsets.only(left: 10,right: 10),
                    decoration: BoxDecoration(
                      color: Color(0xFFf9f9f9),
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.white),
                    ),
                    child: Container(
                     // margin: EdgeInsets.all(10),
                      child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                'Aug 21,2021',
                                style: TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                              Row(

                                children: [

                             Image.asset('assets/icons/icone-setting-21.png',height: 20,),
                                  Text(
                                    '  Date & Time',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 12),
                                  ),
                            ],
                          ),
                              Text(
                                '11:00 am',
                                style: TextStyle(
                                    fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(
                                    'Austin pet Groomers',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                  Text(
                                    '\$85.00',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 12),
                                  ),

                                ],
                              ),
                              Row(
                                //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [

                                  Image.asset('assets/icons/caticon.png',height: 20,),
                                  Text(
                                    '  Max',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 15),
                                  ),
                                ],
                              ),


                             const SizedBox(
                                height: 10,
                              ),

                            ],
                          )

                      ),
                    ),
                  const SizedBox(
                    height: 20,
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
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      bottombuttons(context, MaaruColors.button2Color, 'DONE',(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>ReviewScreen()));
                      }),
                      GestureDetector(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>ViewPetProfile()));
                        },
                        child: Container(
                          height: size.height * 0.08,
                          width: size.width * 0.40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: MaaruColors.button2Color),
                          ),
                          child: Center(
                            child: Text(
                              'VIEW PROFILE',
                              style: TextStyle(
                                  color: MaaruColors.blueColor,
                                  fontSize: 15,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      bottombuttons(context, MaaruColors.mehrooncolor, 'CANCEL',(){

                        setState(() {
                          actioncolor=MaaruColors.mehrooncolor;
                          taskheading='Successfully cancelled'.toUpperCase();
                          taskmessage='The amount deducted will refund you\nwithin 2-3 official days'.toUpperCase();
                        });
                      }),
                      bottombuttons(context, MaaruColors.blueColor, 'RESCHEDULE',(){Navigator.push(context, MaterialPageRoute(builder: (context)=>BookAppointmentScreen3()));})
                    ],
                  ),
                  SizedBox(
                    height: 10,
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
          backgroundColor: MaaruColors.button2Color,
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
          backgroundColor: MaaruColors.blueColor,
          minimumSize: Size(130, 50)),
      child: Text("Continue",style: MaaruStyle.text.small.copyWith(
          fontWeight: FontWeight.w500,
          color: MaaruColors.button2Color),),
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
