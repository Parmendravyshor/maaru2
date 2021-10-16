import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/show_location.dart';

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
                                  contentPadding: EdgeInsets.only(left: 10,top: 20),
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
                    'Upcoming Appointment',
                    style: MaaruStyle.text.large,
                  )),
              SizedBox(
                height: 20,
              ),
                Padding(padding: EdgeInsets.only(left: 20,right: 20),child:
              Image.asset('assets/images/abin1.png')),
              Container(
                  margin: EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    'Past Appointment',
                    style: MaaruStyle.text.large,
                  )),
              SizedBox(
                height: 20,
              ),
              Padding(padding: EdgeInsets.only(left: 20,right: 20),child:
              Image.asset('assets/images/abin2.png'))
            ]))));
  }
}
