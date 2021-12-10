import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/date_picker.dart';
import 'package:maru/core/widget/widgets.dart';
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
  bool _debug = false;
  bool _contextoff = false;
  bool _contextrand = false;

  TextEditingController _controller;
  int _dropDownValue = 0;
  String _selValue = "SELECT SERVICES";
  String _selValue1 = 'SELECT PET';
  String _selValue2 = 'SELECT PROVIDER';

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
                                  Row(
                                    //  mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Austin Pet Groomer',
                                        style: MaaruStyle.text.tiniest,
                                      ),
                                      SizedBox(
                                        width: size.width * 0.16,
                                      ),
                                      Image.asset(
                                        'assets/icons/New Project (2).png',
                                        width: size.width * 0.10,
                                      )
                                    ],
                                  ),
                                  Text(
                                    '1115 Emihi Grove Austin, Textas 00000',
                                    style: MaaruStyle.text.tiny,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    'Book Appointments',
                                    style: MaaruStyle.text.tiniest,
                                  ),
                                ],
                              )))
                    ],
                  ),
                  Container(height: 440, width: 400, child: Appointments()),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Services',
                      style: MaaruStyle.text.tiniest,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Padding(  padding: EdgeInsets.only(right: 20, left: 20),
                      child: DropdownButton(
                        icon: Icon(
                          Icons.expand_more,
                          color: MaaruColors.textButtonColor,
                          size: 40.09,
                        ),
                        hint:
                            Center(
                              child:
                        Text(
                          _selValue,
                          style: MaaruStyle.text.small,
                        )),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: TextStyle(color: Colors.white),
                        items: [

                          'WALKING',
                          'GROOMING',
                          'VET',
                          'DAYCARE',
                          'HOTEL',
                          'HOSPITAL',

                        ].map(
                              (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child:
                                Center(
                                child:
                              Text(val, style: MaaruStyle.text.small),
                            ));
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                                () {
                              _selValue = val;
                              if (val == "WALKING") {
                                _dropDownValue = 1;
                              }
                              if (val == "SELECT PET") {
                                _dropDownValue = 0;
                              }

                              if (val == "VET") {
                                _dropDownValue = 2;
                              }

                              if (val == "DAYCARE") {
                                _dropDownValue = 3;
                              }
                              if (val == "HOTEL") {
                                _dropDownValue = 4;
                              }
                              if (val == "HOSPITAL") {
                                _dropDownValue = 5;
                              }
                              // if (val == "GPT-3") {
                              //   _dropDownValue = 6;
                              // }
                             },
                           );
                        },
                      )),

                  SizedBox(height: 20,),

                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Provider',
                      style: MaaruStyle.text.tiniest,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(  padding: EdgeInsets.only(right: 20, left: 20),
                      child: DropdownButton(
                        icon: Icon(
                          Icons.expand_more,
                          color: MaaruColors.textButtonColor,
                          size: 40.09,
                        ),
                        hint: Center(
                          child:
                        Text(
                          _selValue1,
                          style: MaaruStyle.text.small,
                        )),
                        isExpanded: true,
                        iconSize: 30.0,
                        style: TextStyle(color: Colors.white),
                        items: [
                          'COMPANY1',
                          'COMPANY2',
                          'COMPANY3',
                          // 'DAYCARE',
                          // 'HOTEL',
                          // 'HOSPITAL',

                        ].map(
                              (val) {
                            return DropdownMenuItem<String>(
                              value: val,
                              child: Center(
                                child:Center(child:
                              Text(val, style: MaaruStyle.text.small),
                            )));
                          },
                        ).toList(),
                        onChanged: (val) {
                          setState(
                                () {
                              _selValue1 = val;
                              if (val == "COMPANY1") {
                                _dropDownValue = 1;
                              }
                              if (val == "COMPANY2") {
                                _dropDownValue = 0;
                              }
                              //
                              if (val == "COMPANY3") {
                                _dropDownValue = 2;
                              }
                              //
                              // if (val == "DAYCARE") {
                              //   _dropDownValue = 3;
                              // }
                              // if (val == "HOTEL") {
                              //   _dropDownValue = 4;
                              // }
                              // if (val == "HOSPITAL") {
                              //   _dropDownValue = 5;
                              // }
                              // // if (val == "GPT-3") {
                              // //   _dropDownValue = 6;
                              // // }
                            },
                          );
                        },
                      )),


                  SizedBox(height: 20,),

                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Pet',
                      style: MaaruStyle.text.tiniest,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(  padding: EdgeInsets.only(right: 20, left: 20),
                  child: DropdownButton(
                            icon: Icon(
                              Icons.expand_more,
                              color: MaaruColors.textButtonColor,
                              size: 40.09,
                            ),
                            hint: Center(child:
                            Text(
                              _selValue2,
                              style: MaaruStyle.text.small,
                            )),
                            isExpanded: true,
                            iconSize: 30.0,
                            style: TextStyle(color: Colors.white),
                            items: [
                              'TOMMY',
                              'SALLY',

                            ].map(
                                  (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Center(child:
                                  Text(val, style: MaaruStyle.text.small),
                                ));
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(
                                    () {
                                  _selValue2 = val;
                                  if (val == "TOMMY") {
                                    _dropDownValue = 1;
                                  }
                                  if (val == "SALLY") {
                                    _dropDownValue = 0;
                                  }
                                  //
                                  // if (val == "VET") {
                                  //   _dropDownValue = 2;
                                  // }
                                  //
                                  // if (val == "DAYCARE") {
                                  //   _dropDownValue = 3;
                                  // }
                                  // if (val == "HOTEL") {
                                  //   _dropDownValue = 4;
                                  // }
                                  // if (val == "HOSPITAL") {
                                  //   _dropDownValue = 5;
                                  // }
                                  // // if (val == "GPT-3") {
                                  // //   _dropDownValue = 6;
                                  // // }
                                },
                              );
                            },
                          )),

                  SizedBox(height: 20,),

                  SizedBox(
                    height: 20,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Morning',
                      style: MaaruStyle.text.tiniest,
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
                      'Afternoon',
                      style: MaaruStyle.text.tiniest,
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
                            'Booking Cost',
                            style: MaaruStyle.text.large,
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
                            'Booking Total',
                            style: MaaruStyle.text.tiny,
                          ),
                          Text(
                            " \$ 85.0",
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
                            'Taxes',
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
                            'Total',
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
