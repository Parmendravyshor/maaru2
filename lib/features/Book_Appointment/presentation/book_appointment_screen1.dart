import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/core/widget/round_button.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen3.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/faketest.dart';
import 'book_appointment_screen2.dart';
import 'booked_confirm.dart';

class BookAppointment1 extends StatefulWidget {
  @override
  _BookAppointment1State createState() => _BookAppointment1State();
}

class _BookAppointment1State extends State<BookAppointment1> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey,
        resizeToAvoidBottomInset: true,
        bottomNavigationBar: CreateHomeScreen(
            // Color:MaaruColors.textButtonColor
            ),
        body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
                child: Column(
              children: [
                Container(
                  width: 2000,
                  child: Image.asset('assets/images/imgdd.jpg'),
                ),
                Container(
                  decoration: const BoxDecoration(color: Colors.white),
                  height: size.height * 1.1,
                  width: size.width * 1,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                    color: Colors.white,
                    //height: size.height*0.80,
                    width: size.width * 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              'assets/icons/Rectangle copy 3.png',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) => BookAppointment2()));
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
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (_) =>
                                          BookAppointmentScreen3()));
                                },
                                child: Image.asset(
                                  'assets/icons/icone-setting-68.png',
                                  height: 40,
                                  width: 40,
                                  color: Colors.grey[100],
                                )),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Austin Pet Groomer',
                              style: MaaruStyle.text.xlarge,
                            ),
                            // SizedBox(
                            //   width: size.width * 0.16,
                            // ),
                            // Image.asset(
                            //   'assets/icons/New Project (2).png',
                            //   width: size.width * 0.10,
                            // )
                          ],
                        ),
                        Text(
                          '1115 Emihi Grove Austin, Textas 00000',
                          style: MaaruStyle.text.tiny,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/icons/container1.png',
                              //width: 180,
                              height: size.height * 0.09,
                            ),
                            Image.asset(
                              'assets/icons/container2.png',
                              //  width: 180,
                              height: size.height * 0.09,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/icons/container3.png',
                              // width: 150,
                              height: size.height * 0.09,
                            ),
                            Image.asset(
                              'assets/icons/container4.png',
                              // width: 150,
                              height: size.height * 0.09,
                            ),
                          ],
                        ),

                        SizedBox(
                          height: size.height * 0.01,
                        ),
                        Text(
                          'About',
                          style: MaaruStyle.text.tiniest,
                        ),
                        SizedBox(
                          height: size.height * 0.02,
                        ),
                        Text(
                            "Lorem ipsum is placeholder text commonly used in\n"
                            "the graphic, print, and publishing industries \n"
                            "for previewing layouts and visual mackups.",
                            style: MaaruStyle.text.greyDisable),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          'Hours Of Operation',
                          style: MaaruStyle.text.tiniest,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('monday-saturday',
                                textAlign: TextAlign.start,
                                style: MaaruStyle.text.greyDisable),
                            Text('9:00 am-6:00 pm',
                                style: MaaruStyle.text.tiniest),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('sunday',
                                textAlign: TextAlign.start,
                                style: MaaruStyle.text.greyDisable),
                            Text('closed', style: MaaruStyle.text.tiniest),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        ThemedButton(
                          onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => BookAppointmentScreen3()));
                          },
                          text: ' Book Appointments',
                          enabled: true,
                        ),
                        // InkWell(
                        //     onTap: () {
                        //       Navigator.of(context).push(MaterialPageRoute(
                        //           builder: (_) => BookAppointmentScreen3()));
                        //     },

                        // RoundedButton(
                        //   buttonName: 'Book Appointments',
                        //   Color1: MaaruColors.blueColor,
                        //   Color: MaaruColors.primaryColorsuggesion,
                        // ),
                      ],
                    ),
                  ),
                ),
              ],
            ))));
  }
}
// icon:SizedBox(
//
//   child:
//   new IconButton(
//       icon: new Image.asset("assets/icons/icone-setting-9.png"),
//       onPressed: () {
//         AppStatecurrentTab == index ? Colors.red : Colors.blue;
//       }),
//   width: 38,
//   height: 38,
// ),
