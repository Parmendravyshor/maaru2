import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/date_picker.dart';
import 'package:maru/core/widget/widgets.dart';

import 'booked_confirm.dart';

class BookAppointmentScreen3 extends StatefulWidget {
  @override
  _BookAppointmentScreen3State createState() => _BookAppointmentScreen3State();
}

class _BookAppointmentScreen3State extends State<BookAppointmentScreen3> {
  bool pressAttention = true;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
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
                  height: 200,
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
                                'assets/icons/icone-setting-67.png',
                                height: 40,
                                width: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset(
                                'assets/icons/icone-setting-67.png',
                                height: 40,
                                width: 40,
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
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            'Book Appointments',
                            style: MaaruStyle.text.large,
                          ),
                        ],
                      )))
            ],
          ),
          Container(height: 400, width: 400, child: Appointments()),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 20, left: 20),
            color: Colors.white,
            height: 40,
            //   width: 200,
            child: TextFormField(
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.7),
                      borderSide: BorderSide()),
                  hintText: 'Select a Provider',
                  hintStyle: MaaruStyle.text.greyDisable,
                  fillColor: Colors.white,
                  suffixIcon: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/icons/icone-setting-30.png',
                        height: 10,
                        width: 20,
                        // width: 30,
                      ))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Pet',
              style: MaaruStyle.text.large,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 20, left: 20),
            color: Colors.white,
            height: 40,
            //   width: 200,
            child: TextFormField(
              textAlign: TextAlign.center,
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.7),
                      borderSide: BorderSide()),
                  hintText: 'Select  pet',
                  hintStyle: MaaruStyle.text.greyDisable,
                  fillColor: Colors.white,
                  suffixIcon: Container(
                      margin: EdgeInsets.all(10),
                      child: Image.asset(
                        'assets/icons/icone-setting-30.png',
                        height: 10,
                        width: 20,
                        // width: 30,
                      ))),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Morning',
              style: MaaruStyle.text.large,
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
                    Imagesgg(
                      text: '10:00 am',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Imagesgg(
                      text: '10:30 am',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Imagesgg(
                      text: '11:00 am',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Imagesgg(
                      text: '10:30 am',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Imagesgg(
                      text: '12:00 am',
                    ),
                  ]))),
          SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.center,
            child: Text(
              'Afternoon',
              style: MaaruStyle.text.large,
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
                    Imagesgg(
                      text: '12:30 am',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Imagesgg(
                      text: '1:00 am',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Imagesgg(
                      text: '1:30 am',
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Imagesgg(
                      text: '2:00 am',
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

class Imagesgg extends StatefulWidget {
  final String text;

  Imagesgg({
    @required this.text,
  });

  @override
  _ImagesggState createState() => _ImagesggState();
}

class _ImagesggState extends State<Imagesgg> {
  bool pressAttention = true;
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          setState(() => pressAttention = !pressAttention);
        },
        child: Container(
          alignment: Alignment.center,
          width: 150,
          height: 40,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: pressAttention
                ? Colors.white
                : MaaruColors.primaryColorsuggesion1,
            // border: Border.all(color: Colors.grey),
          ),
          child: Text(
            widget.text,
            style: MaaruStyle.text.greyDisable,
          ),
        ));
  }
}
