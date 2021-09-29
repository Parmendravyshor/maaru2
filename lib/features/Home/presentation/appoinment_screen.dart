import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/show_location.dart';

class AppointmentScreen extends StatefulWidget {
  @override
  _AppointmentScreenState createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ShowLocation(),
          SizedBox(
            height: 20,
          ),
          Padding(
              padding: EdgeInsets.only(left: 20),
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
                                  borderRadius: new BorderRadius.circular(10.7),
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
              style: MaaruStyle.text.large,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Image.asset('assets/images/frankspet.png'),
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              'Past Appoinments',
              style: MaaruStyle.text.large,
            ),
          ),
        ])));
  }
}
