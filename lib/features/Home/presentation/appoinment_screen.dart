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
    final size = MediaQuery.of(context).size;
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
                  Container(
                      margin: EdgeInsets.only(right: 10, left: 5),
                      child: ShowLocation()),
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
                              height: 30,
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20),
                              child: Image.asset(
                                'assets/icons/icon-bl-19.png',
                                height: 40,
                              ),
                            )
                          ])),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Upcoming Appoinments'.toUpperCase(),
                      style: MaaruStyle.text.tiny,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 15),
                    child: Container(
                      height: 150,
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(color: MaaruColors.textfeildline)),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                'assets/images/kutta.png',
                                height: 200,
                              ),
                            )),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Austin pet care'.toUpperCase(),
                                      style: MaaruStyle.text.tiny),
                                  Text('Pet walking'.toUpperCase(),
                                      style: MaaruStyle.text.medium),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('1357 Muno Manor'.toUpperCase(),
                                      style: TextStyle(
                                          fontSize: 11, color: Colors.grey)),
                                  Text(
                                    'Austin,Tx 75923'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
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
                                    height: size.height * 0.06,
                                  ),
                                  Text(
                                    'Aug 21,2021'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  ),
                                  Text(
                                    '11:00 am'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Past Appoinments'.toUpperCase(),
                      style: MaaruStyle.text.tiny,
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 15),
                    child: Container(
                      height: size.height * 0.18,
                      width: 400,
                      decoration: BoxDecoration(
                          border: Border.all(color: MaaruColors.textfeildline)),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              width: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                              ),
                              child: Image.asset(
                                'assets/images/kutta.png',
                                height: 200,
                              ),
                            )),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text('Austin pet care'.toUpperCase(),
                                      style: MaaruStyle.text.tiny),
                                  Text('Pet walking'.toUpperCase(),
                                      style: MaaruStyle.text.medium),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    '1357 Muno Manor'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  ),
                                  Text(
                                    'Austin,Tx 75923'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
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
                                    height: size.height * 0.06,
                                  ),
                                  Text(
                                    'Aug 21,2021'.toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.grey, fontSize: 11),
                                  ),
                                  Text(
                                    '12:00 am'.toUpperCase(),
                                    style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]))));
  }
}
