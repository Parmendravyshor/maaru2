import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/core/widget/widgets.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen1.dart';
import 'package:maru/main.dart';

import 'create_home_screen.dart';

class ProviderSearchScreen extends StatefulWidget {
  @override
  _ProviderSearchScreenState createState() => _ProviderSearchScreenState();
}

class _ProviderSearchScreenState extends State<ProviderSearchScreen> {
  Color _iconColor = Colors.yellowAccent;
  @override
  Widget build(BuildContext context) {
    var selectedIndex;
    return Scaffold(
        backgroundColor:MaaruColors.darkGrey2,
        bottomNavigationBar:
        CreateHomeScreen(
          selectedIndex: 1,
          Color1:  selectedIndex == 1
              ? MaaruColors.darkGrey2
              : MaaruColors.textButtonColor
          //  Color:Colors.red
       // MaaruColors.textButtonColor
        ),
        body: SafeArea(
            child: Column(children: [


Stack(children:[
  ShowLocation(),
          MyClass(),
          SizedBox(
            height: 20,
          ),
          //  Padding(
          //    padding: EdgeInsets.only(left: 20),
          //
          // child:PadExp

              Padding(
            padding: EdgeInsets.fromLTRB(10, 100, 0, 0),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                        padding: EdgeInsets.only(
                          top: 0,
                          right: 10,
                        ),
                        child: TextFormField(
                          // cursorColor: Colors.black,
                          decoration: InputDecoration(
                              enabledBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.7),
                                  borderSide: new BorderSide(
                                      color: Colors.grey[300], width: 1.0)),
                              focusedBorder: new OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.7),
                                  borderSide: new BorderSide(
                                      color: Colors.grey[300], width: 1.0)),
                              hintText: 'Search',
                              hintStyle: MaaruStyle.text.greyDisable,
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              fillColor: Colors.white,
                              suffixIcon: Image.asset(
                                'assets/icons/icone-setting-19.png',
                                height: 50,
                                // width: 30,
                              )),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Padding(
                      padding: EdgeInsets.only(right: 70),
                      child: InkWell(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (_) => MapView()));
                          },
                          child: Image.asset(
                            'assets/icons/icon-bl-15.png',
                            height: 40,
                          ))),
                ]),
          ),
          SizedBox(
            width: 20,
          ),

          Padding(
              padding: EdgeInsets.only(top: 320,right: 10,left: 10),
              child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => BookAppointment1()));
                  },
                  child:      Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.grey[300])),
                    height: 120,
                    child: Container(
                      color: Colors.white,
                      margin: EdgeInsets.all(10),
                      child: Row(
                        children: [
                          Container(
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white,
                            ),
                            child: Image.asset('assets/images/kutta.png'),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Franks Pet Lounge',
                                style: MaaruStyle.text.tiniest
                              ),
                              Text(
                                'Franks Daycare',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 12),
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    size: 25,
                                    color: Colors.yellow,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                    '42 Reviews   (4.0)',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold, fontSize: 12),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),)),
        ])

            //   ]
            ])));
  }
}

class MyClass extends StatefulWidget {
  @override
  _MyClassState createState() => _MyClassState();
}

class _MyClassState extends State<MyClass> {
  bool pressGeoON = false;
  bool cmbscritta = true;
  bool isPressed = true;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: EdgeInsets.fromLTRB(20, 105, 10, 0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50.0),
              color: Colors.transparent,
            ),
            alignment: Alignment.bottomRight,
            child: InkWell(
                child: Column(children: [
                  cmbscritta
                      ? Image.asset(
                          'assets/icons/icon-bl-05.png',
                          height: 40,
                        )
                      : Padding(
                          padding: EdgeInsets.only(bottom: 20),
                          child: Container(
                            width: 500,
                            height: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    'assets/icons/icone-setting-62.png'),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.fromLTRB(10, 20, 30, 0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(

                                    onTap: () {
                                      setState(() {
                                        // isPressed = !isPressed;
                                      });
                                    },
                                    child: Image.asset(
                                      'assets/icons/icone-setting-49.png',
                                      //   color:
                                      //   isPressed ? Colors.white : Colors.blue,
                                      height: 40,
                                    ),
                                  ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // isPressed = !isPressed;
                                });
                              },
                              child:
                                  Image.asset(
                                    'assets/icons/icon-bl-26.png',
                                    height: 40,
                                  )),
                                  Image.asset(
                                    'assets/icons/icon-bl-25.png',
                                    height: 40,
                                  ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // isPressed = !isPressed;
                                });
                              },
                              child:
                                  Image.asset(
                                    'assets/icons/icon-bl-27.png',
                                    height: 40,
                                  )),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // isPressed = !isPressed;
                                });
                              },
                              child:
                                  Image.asset(
                                    'assets/icons/icon-bl-29.png',
                                    height: 40,
                                  )),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  // isPressed = !isPressed;
                                });
                              },
                              child:
                                  Image.asset(
                                    'assets/icons/icon-bl-28.png',
                                    height: 40,
                                  )),
                                  // Padding(
                                  //     padding:
                                  //         EdgeInsets.fromLTRB(0, 100, 500, 0),
                                  //     child: ToggleButton(
                                  //       text1: 'hkd',
                                  //       text2: 'hkjf',
                                  //     )),
                                ],
                              ),
                            ),
                          ),
                        )
                ]),
                //    style: TextStyle(fontSize: 14)
                onTap: () {
                  setState(() {
                    pressGeoON = !pressGeoON;
                    cmbscritta = !cmbscritta;
                  });
                })),
      ),
    ]);
  }
}
