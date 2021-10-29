
import 'dart:ui';

import 'package:flutter/material.dart';




import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Book_Appointment/presentation/provider_confirm_book.dart';
import 'package:maru/features/provider_home/presentation/upcoming_appointment_calender.dart';

import 'create_provider_home.dart';

class UpcomingAppointmentCalender1 extends StatefulWidget {
  @override
  _UpcomingAppointmentCalender1State createState() =>
      _UpcomingAppointmentCalender1State();
}

class _UpcomingAppointmentCalender1State
    extends State<UpcomingAppointmentCalender1> {
  @override
  Widget build(BuildContext context) {
    var selectedIndex;
    return Scaffold(
        backgroundColor: MaaruColors.darkGrey2,
        bottomNavigationBar: CreateProviderHome(selectedIndex: 2,
            // Color1:  selectedIndex == 2
            //     ? Colors.grey[300]
            //     :  MaaruColors.textButtonColor
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
            //  BackArrowButton(),
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
                Container(
                    margin: EdgeInsets.only(left: 20, right: 20),
child:Image.asset('assets/images/abin1.png'),
//                       Container(
//                         margin: EdgeInsets.all(10),
//                         height: 220,
//                         width: 400,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(20),
//                             border: Border.all(color: Colors.grey)),
//                         child: Container(
//                           margin: EdgeInsets.all(10),
//                           child: Column(
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     width: 100,
//                                     decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(20),
//                                       color: Colors.white,
//                                     ),
//                                     child: Image.asset('assets/images/kutta.png'),
//                                   ),
//                                   SizedBox(
//                                     width: 20,
//                                   ),
//                                   Container(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         Text(
//                                           'Austin pet care',
//                                           style: TextStyle(
//                                               fontWeight: FontWeight.bold, fontSize: 15),
//                                         ),
//                                         Text(
//                                           'Pet walking',
//                                           style: TextStyle(fontSize: 14),
//                                         ),
//                                         SizedBox(
//                                           height: 20,
//                                         ),
//                                         Text(
//                                           '1357 Muno Manor',
//                                           style: TextStyle(color: Colors.grey, fontSize: 12),
//                                         ),
//                                         Text(
//                                           'Austin,Tx 75923',
//                                           style: TextStyle(color: Colors.grey, fontSize: 12),
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     width: 15,
//                                   ),
//                                   Container(
//                                     child: Column(
//                                       crossAxisAlignment: CrossAxisAlignment.end,
//                                       children: [
//                                         Icon(
//                                           Icons.calendar_today_outlined,
//                                           size: 22,
//                                           color: Colors.yellow,
//                                         ),
//                                         SizedBox(
//                                           height: 36,
//                                         ),
//                                         Text(
//                                           'Aug 21,2021',
//                                           style: TextStyle(color: Colors.grey, fontSize: 12),
//                                         ),
//                                         Text(
//                                           '11:00 am',
//                                           style: TextStyle(
//                                               fontSize: 13, fontWeight: FontWeight.bold),
//                                         ),
//
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
//                                 children: [
//                                   Container(
//                                     height: 30,
//                                       width: 30,
//                                       decoration: BoxDecoration(
//                                           border: Border.all(
//                                             color: Colors.grey[500],
//                                           ),
//                                           borderRadius: BorderRadius.all(Radius.circular(20))
//                                       ),
// child: Icon(Icons.check_circle,color: Colors.grey,),
//                                   ),
//                                   Container(
//                                     height: 30,
//                                     width: 30,
//                                     decoration: BoxDecoration(
//                                         border: Border.all(
//                                           color: Colors.red[500],
//                                         ),
//                                         borderRadius: BorderRadius.all(Radius.circular(20))
//                                     ),
//                                     child: Icon(Icons.cancel),
//                                   ),
//                               ],),
//                               // Row(
//                               //   mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               //   children: [
//                               //    Text('Accept',style:MaaruStyle.text.greyDisable),
//                               //     Text('Remove',style:MaaruStyle.text.greyDisable),
//                               //   ],),
//                             ],
//                           ),
//                         ),
//                       ),
                ),
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
