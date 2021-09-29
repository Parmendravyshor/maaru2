import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';

class BookAppointmentScreen3 extends StatefulWidget {
  @override
  _BookAppointmentScreen3State createState() => _BookAppointmentScreen3State();
}

class _BookAppointmentScreen3State extends State<BookAppointmentScreen3> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xFFa19c96),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(children: [
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
              height: size.height * 0.90,
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
                            Image.asset(
                              'assets/icons/icone-setting-67.png',
                              height: 40,
                              width: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/icons/icone-setting-68.png',
                              height: 40,
                              width: 40,
                              color: Colors.grey[100],
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Image.asset(
                              'assets/icons/icone-setting-68.png',
                              height: 40,
                              width: 40,
                              color: Colors.grey[100],
                            ),
                          ],
                        ),
                        Row(
                          //  mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Austin Pet Groomer',
                              style: MaaruStyle.text.large,
                            ),
                            SizedBox(
                              width: size.width * 0.27,
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
                        Text('Book Appointments')
                      ])))
        ]))));
  }
}
