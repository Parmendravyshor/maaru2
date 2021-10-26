
import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/provider_home/presentation/upcoming_appointment_calender.dart';

class UpcomingAppointmentCalender1 extends StatefulWidget {
  @override
  _UpcomingAppointmentCalender1State createState() =>
      _UpcomingAppointmentCalender1State();
}

class _UpcomingAppointmentCalender1State
    extends State<UpcomingAppointmentCalender1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              BackArrowButton(),
              SizedBox(
                height: 20,
              ),
              ShowLocation(),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 18),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            color: Colors.white,
                            height: 48,
                            //     width: 350,
                            child: TextFormField(
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                  border: new OutlineInputBorder(
                                    borderRadius: new BorderRadius.only(
                                      topRight: Radius.circular(90),
                                      bottomRight: Radius.circular(90),
                                      topLeft: Radius.circular(30),
                                      bottomLeft: Radius.circular(30),
                                    ),
                                    borderSide: new BorderSide(
                                        color: Colors.grey, width: 1),
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(left: 10, top: 20),
                                  hintText: 'Search',
                                  fillColor: Colors.white,
                                  suffixIcon: Image.asset(
                                    'assets/icons/icone-setting-19.png',
                                    height: 65,
                                    width: 45,
                                  )),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (_) =>
                                      UpcomingAppointmentCalender()));
                            },
                            child: Image.asset(
                              'assets/icons/icone-setting-20.png',
                              height: 40,
                            ))
                      ])),
              SizedBox(
                height: 20,
              ),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Upcoming Appointment',
                    style: MaaruStyle.text.tiniest,
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Image.asset('assets/images/abin1.png')),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  child: Text(
                    'Past Appointment',
                    style: MaaruStyle.text.tiniest,
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  child: Image.asset('assets/images/abin2.png'))
            ]))));
  }
}
