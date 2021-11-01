import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFffffff),
        bottomNavigationBar: CreateHomeScreen(
            // Color:MaaruColors.textButtonColor
            ),
        body: SafeArea(
            bottom: false,
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  SizedBox(
                    height: 30,
                  ),
                  ShowLocation(),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Expanded(
                              child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 15,
                                    right: 10,
                                  ),
                                  child: TextFormField(
                                    // cursorColor: Colors.black,
                                    decoration: InputDecoration(
                                        enabledBorder: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(10.7),
                                            borderSide: new BorderSide(
                                                color: Colors.grey[300],
                                                width: 1.0)),
                                        focusedBorder: new OutlineInputBorder(
                                            borderRadius:
                                                new BorderRadius.circular(10.7),
                                            borderSide: new BorderSide(
                                                color: Colors.grey[300],
                                                width: 1.0)),
                                        hintText: 'Search',
                                        hintStyle: MaaruStyle.text.greyDisable,
                                        contentPadding: EdgeInsets.fromLTRB(
                                            20.0, 10.0, 20.0, 10.0),
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
                            Image.asset(
                              'assets/icons/icone-setting-20.png',
                              height: 50,
                            )
                          ])),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Upcoming Appoinments',
                      style: MaaruStyle.text.tiniest,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child:  Container(
                        height: 150,
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey[300])),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(child:
                              Container(
                                width: 100,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Image.asset('assets/images/kutta.png',height: 200,),
                              )),

                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Austin pet care',
                                        style: MaaruStyle.text.tiniestSmall
                                    ),
                                    Text(
                                        'Pet walking',
                                        style: MaaruStyle.text.tiny
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                        '1357 Muno Manor',
                                        style: MaaruStyle.text.greyDisable
                                    ),
                                    Text(
                                      'Austin,Tx 75923',
                                      style: TextStyle(color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                //width: 40,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      size: 22,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(
                                      height: 36,
                                    ),
                                    Text(
                                      'Aug 21,2021',
                                      style: TextStyle(color: Colors.grey, fontSize: 12),
                                    ),
                                    Text(
                                      '11:00 am',
                                      style: TextStyle(
                                          fontSize: 13, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),),
                  SizedBox(
                    height: 80,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Past Appoinments',
                      style: MaaruStyle.text.tiniest,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                      padding: EdgeInsets.only(left: 20, right: 15),
                      child:  Container(
                        height: 150,
                        width: 400,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey[300])),
                        child: Container(
                          margin: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Expanded(child:
                              Container(
                                width: 100,

                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                ),
                                child: Image.asset('assets/images/kutta.png',height: 200,),
                              )),

                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        'Austin pet care',
                                        style: MaaruStyle.text.tiniestSmall
                                    ),
                                    Text(
                                        'Pet walking',
                                        style: MaaruStyle.text.tiny
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                        '1357 Muno Manor',
                                        style: MaaruStyle.text.greyDisable
                                    ),
                                    Text(
                                      'Austin,Tx 75923',
                                      style: TextStyle(color: Colors.grey, fontSize: 12),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                //width: 40,
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Icon(
                                      Icons.calendar_today_outlined,
                                      size: 22,
                                      color: Colors.yellow,
                                    ),
                                    SizedBox(
                                      height: 36,
                                    ),
                                    Text(
                                      'Aug 21,2021',
                                      style: TextStyle(color: Colors.grey, fontSize: 12),
                                    ),
                                    Text(
                                      '12:00 am',
                                      style: TextStyle(
                                          fontSize: 13, fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),),
                ]))));
  }
}
