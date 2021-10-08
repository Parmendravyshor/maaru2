import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/date_picker.dart';
import 'package:maru/core/widget/show_location.dart';

class UpcomingAppointmentCalender extends StatefulWidget {
  @override
  _UpcomingAppointmentCalenderState createState() =>
      _UpcomingAppointmentCalenderState();
}

class _UpcomingAppointmentCalenderState
    extends State<UpcomingAppointmentCalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
              Padding(
                  padding: EdgeInsets.only(left: 30, right: 20),
                  child: Column(children: [
                    Padding(
                        padding: EdgeInsets.only(right: 60),
                        child: Text(
                          'Upcoming Appointment',
                          style: MaaruStyle.text.large,
                        )),
                    Container(height: 400, width: 400, child: Appointments()),
                  ])),
                      Padding(padding: EdgeInsets.only(left: 30,right: 20),
                      child:
                      Image.asset('assets/images/ddfdsf.png')),
                      SizedBox(height: 100,)
            ]))));
  }
}
