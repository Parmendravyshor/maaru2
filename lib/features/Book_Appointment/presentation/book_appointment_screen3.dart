import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/date_picker.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Account_setting/presentation/payment_screen.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen1.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';

import 'book_appointment_screen2.dart';
import 'booked_confirm.dart';

class BookAppointmentScreen3 extends StatefulWidget {
  @override
  _BookAppointmentScreen3State createState() => _BookAppointmentScreen3State();
}

class _BookAppointmentScreen3State extends State<BookAppointmentScreen3> {
  bool pressAttention = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: CreateHomeScreen(
          // Color:MaaruColors.textButtonColor
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Flex(direction: Axis.vertical, children: [
                  Column(
                    children: [
                      Container(
                        width: 2000,
                        child: Image.asset('assets/images/imgdd.jpg'),
                      ),
                      Container(
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20),
                              ),
                              color: Colors.white),
                          height: 250,
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
                                    height: size.height * 0.05,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (_) =>
                                                        BookAppointment1()));
                                          },
                                          child: Image.asset(
                                            'assets/icons/Rectangle copy 3.png',
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
                                                        BookAppointment2()));
                                          },
                                          child: Image.asset(
                                            'assets/icons/Rectangle copy 3.png',
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
                                                        BookAppointmentScreen3()));
                                          },
                                          child: Image.asset(
                                            'assets/icons/Rectangle copy 3.png',
                                            height: 40,
                                            width: 40,
                                          )),
                                    ],
                                  ),
                                  Text(
                                    'Austin Pet Groomer'.toUpperCase(),
                                    style: MaaruStyle.text.xlarge,
                                  ),
                                  SizedBox(
                                    width: size.width * 0.16,
                                  ),
                                  Text(
                                    '1115 Emihi Grove Austin, Textas 00000'.toUpperCase(),
                                    style: MaaruStyle.text.medium,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Book Appointments'.toUpperCase(),
                                    style: MaaruStyle.text.tiny,
                                  ),
                                ],
                              )))
                    ],
                  ),
                  Container(height: 440, width: 400, child: Appointments()),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Services'.toUpperCase(),
                      style: MaaruStyle.text.tiny,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: 20, left: 20),
                    color: Colors.white,
                    height: 40,
                    //   width: 200,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.7),
                              borderSide: BorderSide()),
                          contentPadding: EdgeInsets.only(top: 10),
                          hintText: 'Select a Services'.toUpperCase(),
                          hintStyle: MaaruStyle.text.greyDisable,
                          fillColor: Colors.white,
                          suffixIcon: Container(
                              margin: EdgeInsets.all(10),
                              child: Image.asset(
                                'assets/icons/icone-setting-30.png',
                                height: 10,
                                width: 20,
                                // width: 30,
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),


                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Pet'.toUpperCase(),
                      style: MaaruStyle.text.tiny,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(right: 20, left: 20),
                    color: Colors.white,
                    height: 40,
                    //   width: 200,
                    child: TextFormField(
                      textAlign: TextAlign.center,
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.7),
                              borderSide: BorderSide()),
                          contentPadding: EdgeInsets.only(top: 10),
                          hintText: 'Select  pet'.toUpperCase(),
                          hintStyle: MaaruStyle.text.greyDisable,
                          fillColor: Colors.white,
                          suffixIcon: Container(
                              margin: EdgeInsets.all(10),
                              child: Image.asset(
                                'assets/icons/icone-setting-30.png',
                                height: 10,
                                width: 20,
                                // width: 30,
                              ))),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Morning'.toUpperCase(),
                      style: MaaruStyle.text.tiny,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 40,
                      width: 400,
                      child: Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: ListView(scrollDirection: Axis.horizontal, children: [
                            ChoiceRow(
                              lebal1: '10:00 AM',
                              lebal2: '10:30 AM',
                              lebal3: '11:00 AM',
                              lebal4: '11:30 AM',
                              lebal5: '12:00 AM',
                            ),
                          ]))),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Afternoon'.toUpperCase(),
                      style: MaaruStyle.text.tiny,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 40,
                      width: double.infinity,
                      child: Padding(
                          padding: EdgeInsets.only(right: 20, left: 20),
                          child: ListView(scrollDirection: Axis.horizontal, children: [
                            ChoiceRow(
                              lebal1: '12:00 PM',
                              lebal2: '12:30 PM',
                              lebal3: '01:00 PM',
                              lebal4: '01:30 PM',
                              lebal5: '02:00 PM',
                            ),
                          ]))),
                  SizedBox(
                    height: 20,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Container(
                          margin: EdgeInsets.only(left: 20),
                          child: Text(
                            'Booking Cost'.toUpperCase(),
                            style: MaaruStyle.text.tiny,
                          ))),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Booking Total'.toUpperCase(),
                            style: MaaruStyle.text.tiny,
                          ),
                          Text(
                            " \$ 85.0".toUpperCase(),
                            style: MaaruStyle.text.tiny,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Taxes'.toUpperCase(),
                            style: MaaruStyle.text.tiny,
                          ),
                          Text(
                            '\$ 5.0',
                            style: MaaruStyle.text.tiny,
                          )
                        ],
                      )),
                  Divider(
                    thickness: 1.0,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total'.toUpperCase(),
                            style: MaaruStyle.text.tiny,
                          ),
                          Text(
                            '\$ 90.0',
                            style: MaaruStyle.text.tiny,
                          )
                        ],
                      )),
                  SizedBox(
                    height: 20,
                  ),
                  ThemedButton(
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => BookedConfirm()));

                    },
                    text: 'Book Appointment',
                    enabled: true,
                  ),
                  SizedBox(
                    height: 100,
                  )
                ]))));
  }
}

class ChoiceRow extends StatefulWidget {
  final String lebal1;
  final String lebal2;
  final String lebal3;
  final String lebal4;
  final String lebal5;

  const ChoiceRow(
      {Key key,
        this.lebal1,
        this.lebal2,
        this.lebal3,
        this.lebal4,
        this.lebal5})
      : super(key: key);

  @override
  _ChoiceRowState createState() => _ChoiceRowState();
}

class _ChoiceRowState extends State<ChoiceRow> {
  List<bool> isPressedList = [false, false, false,false,false,false];

  String classChoice = '';

  @override
  Widget build(BuildContext context) {
    print("Status L $isPressedList");

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        //  SizedBox(width: 30),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isPressedList[0] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              } else {
                isPressedList[0] = true;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;

              }
            });
          },
          child: ChoiceButton(
            isPressed: isPressedList[0],
            label: widget.lebal1,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isPressedList[1] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              } else {
                isPressedList[0] = false;
                isPressedList[1] = true;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              }
            });
          },
          child: ChoiceButton(
            isPressed: isPressedList[1],
            label: widget.lebal2,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isPressedList[2] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;

              } else {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = true;
                isPressedList[3] = false;
                isPressedList[4] = false;

              }
            });
          },
          child: ChoiceButton(
            isPressed: isPressedList[2],
            label: widget.lebal3,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isPressedList[3] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              } else {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = true;
                isPressedList[4] = false;
                isPressedList[5] = false;
              }
            });
          },
          child: ChoiceButton(
            isPressed: isPressedList[3],
            label: widget.lebal4,
          ),
        ),
        SizedBox(width: 10),
        GestureDetector(
          onTap: () {
            setState(() {
              if (isPressedList[4] == true) {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = false;
                isPressedList[5] = false;
              } else {
                isPressedList[0] = false;
                isPressedList[1] = false;
                isPressedList[2] = false;
                isPressedList[3] = false;
                isPressedList[4] = true;
                isPressedList[5] = false;
              }
            });
          },
          child: ChoiceButton(
            isPressed: isPressedList[4],
            label: widget.lebal5,
          ),
        ),
      ],
    );
  }
}

class ChoiceButton extends StatefulWidget {
  final String label;
  final bool isPressed;

  ChoiceButton({this.label, this.isPressed});

  @override
  State<ChoiceButton> createState() => _ChoiceButtonState();
}

class _ChoiceButtonState extends State<ChoiceButton> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 150,
        height: 40,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: widget.isPressed
              ? MaaruColors.button2Color
              : Colors.white,
          // border: Border.all(color: Colors.grey),
        ),
        child: Center(
          child: Text(
            widget.label,
            style: widget.isPressed?
            GoogleFonts.poppins( textStyle: TextStyle(
                fontWeight: FontWeight.normal,
                fontFamily: 'Poppins',
                fontSize: 15,
                color: Colors.black)):
            MaaruStyle.text.greyDisable,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
