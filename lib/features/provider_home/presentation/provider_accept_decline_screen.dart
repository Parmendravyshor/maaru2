

import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Book_Appointment/presentation/booked_confirm.dart';
import 'package:maru/features/Book_Appointment/presentation/provider_confirm_book.dart';
import 'package:maru/features/provider_home/presentation/upcoming_appointment_screen.dart';

import '../../../main.dart';

class ProviderAcceptOrDeclineScreen extends StatefulWidget {
  const ProviderAcceptOrDeclineScreen({Key key}) : super(key: key);

  @override
  _ProviderAcceptOrDeclineScreenState createState() =>
      _ProviderAcceptOrDeclineScreenState();
}

class _ProviderAcceptOrDeclineScreenState
    extends State<ProviderAcceptOrDeclineScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            ShowLocation(),
            SizedBox(
              height: 20,
            ),
            Padding(
                padding: EdgeInsets.only(left: 20, right: 18,top: 15),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          color: Colors.white,
                          height: 45,
                          //     width: 350,
                          child: TextFormField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                                border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.circular(
                                      10.7,
                                    ),
                                    borderSide: new BorderSide()),
                                hintText: 'Search',
                                fillColor: Colors.white,
                                suffixIcon: Image.asset(
                                  'assets/icons/icone-setting-19.png',
                                  width: 30,
                                )),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Image.asset(
                        'assets/icons/New Project (36).png',
                        height: 40,
                      )
                    ])),
            SizedBox(
              height: 20,
            ),
            Container(
                margin: EdgeInsets.only(left: 20, right: 20),
                child: Text(
                  'Booking Request',
                  style: MaaruStyle.text.large,
                )),

            // Align(
            //     alignment: Alignment.center,
            //     child:

            Slidable(
                actionPane: SlidableDrawerActionPane(),
                actions: <Widget>[
                  Stack(children: [
                    IconSlideAction(
                      caption: 'Accept',
                      color: Colors.blue,
                      icon: Icons.done,
                      onTap: () {

                      },
                    ),
                    Icon(Icons.arrow_forward)
                  ])
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                  ),
                ],
                child: Column(children: [
                  Container(
                      height: 200,
                      width: 420,
                      decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(20.7),
                          border: Border.all(color: Colors.grey[200])),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Max',
                                style: MaaruStyle.text.large,
                              ),
                              SizedBox(
                                width: 60,
                              ),
                              Text('Aug. 21, 2021')
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                'Dog Grooming',
                                style: MaaruStyle.text.large,
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text('10:00')
                            ],
                          ),
                          Padding(
                              padding: EdgeInsets.only(right: 40),
                              child: Text(
                                '1357 Muno Manor Austin, Tx 75923',
                              )),
                          Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(left: 120),
                            height: 35,
                            width: 150,
                            decoration: BoxDecoration(
                                color: MaaruColors.primaryColorsuggesion1,
                                borderRadius: new BorderRadius.circular(10.7),
                                border: Border.all(color: Colors.white)),
                            child: Text(
                              'View Details',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      )
                      //Text('Item Data$index'),
                      ),
                ])),

            //  )
          ]),
        )));
  }
}

class TestApp extends StatefulWidget {
  @override
  _TestAppState createState() => _TestAppState();
}

class _TestAppState extends State<TestApp> {
  int cntwidth = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          SafeArea(
            child: Column(children: [
              SizedBox(
                height: 20,
              ),
              ShowLocation(),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 18,top: 15),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(right: 10),
                            color: Colors.white,
                            height: 45,
                                 width: 350,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                      borderRadius: new BorderRadius.circular(
                                        10.7,
                                      ),
                                      borderSide: new BorderSide()),
                                  contentPadding:
                                      EdgeInsets.only(top: 0, left: 0),
                                  hintText: 'Search',
                                  fillColor: Colors.white,
                                  suffixIcon:
                                  Image.asset(
                                    'assets/icons/icone-setting-19.png',
                                    height: 65,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/icons/New Project (36).png',
                          height: 40,
                        )
                      ])),
              SizedBox(
                height: 20,
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Container(
                      padding: EdgeInsets.only(left: 20, right: 20),
                      height: 150,
                      width: 420,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(colors: [
                          MaaruColors.primaryColorsuggesion1,
                          MaaruColors.primaryColorsuggesion1,
                          MaaruColors.primaryColorsuggesion1,
                          Colors.red,
                          Colors.red,
                          Colors.red
                        ]),
                      ),
                    ),
                  ),

                  Slidable(
                    actionPane: SlidableDrawerActionPane(),
                    actionExtentRatio: 0.25,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Container(
                        height: 150,
                        width: 420,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.white,
                        ),
                        child: Container(
                            height: 220,
                            width: 420,
                            decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(20.7),
                                border: Border.all(color: Colors.grey[200])),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Max',
                                      style: MaaruStyle.text.large,
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    Text('Aug. 21, 2021',style:   MaaruStyle.text.tiniest,)
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'Dog Grooming',
                                      style: MaaruStyle.text.tiniest,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('10:00',style: MaaruStyle.text.greyDisable,)
                                  ],
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.only(right: 40, left: 18),
                                    child: Text(
                                      '1357 Muno Manor Austin, Tx 75923',style: MaaruStyle.text.greyDisable
                                    )),
                                SizedBox(
                                  height: 20,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (_) => ProviderBookedConfirm()));
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: 120),
                                      height: 35,
                                      width: 150,
                                      decoration: BoxDecoration(
                                          color: MaaruColors
                                              .primaryColorsuggesion1,
                                          borderRadius:
                                              new BorderRadius.circular(20),
                                          border:
                                              Border.all(color: Colors.white)),
                                      child: Text(
                                        'View Details',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w700),
                                      ),
                                    )),
                              ],
                            )
//Text('Item Data$index'),
                            ),
                      ),
                    ),

                    actions: <Widget>[
                      Row(children: [
                        IconSlideAction(
                          caption: 'Accept',
                          color: MaaruColors.primaryColorsuggesion1,
                          icon: Icons.done,
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (_) => UpcomingAppointmentCalender1()));
                          }
                        ),
                        SizedBox(
                          width: 25,
                        ),
                        IconSlideAction(
                          color: MaaruColors.primaryColorsuggesion1,
                          icon: Icons.arrow_forward,
                          //onTap: () => _showSnackBar('Archive'),
                        ),
                      ])
                    ],
                    secondaryActions: <Widget>[
                      Row(
                        children: [
                          IconSlideAction(
                            color: Colors.red,
                            icon: Icons.arrow_back,
                            //onTap: () => _showSnackBar('Archive'),
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          IconSlideAction(
                            caption: 'Delete',
                            color: Colors.red,
                            icon: Icons.delete,
                            //onTap: () => _showSnackBar('Archive'),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ]),
          )
        ],
      ),
    );
  }


}
