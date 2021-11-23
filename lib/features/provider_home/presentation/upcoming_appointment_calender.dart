
import 'package:flutter/material.dart';



import 'package:maru/core/theme/maaru_style.dart';

import 'package:maru/core/widget/date_picker.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Book_Appointment/presentation/provider_confirm_book.dart';

import 'create_provider_home.dart';

class UpcomingAppointmentCalender extends StatefulWidget {
  @override
  _UpcomingAppointmentCalenderState createState() =>
      _UpcomingAppointmentCalenderState();
}

class _UpcomingAppointmentCalenderState
    extends State<UpcomingAppointmentCalender> {
  @override
  Widget build(BuildContext context) {
    var selectedIndex;
    return Scaffold(
      backgroundColor: MaaruColors.darkGrey2,
        bottomNavigationBar: CreateProviderHome(selectedIndex: 1,
        Color1:  selectedIndex == 1
        ? Colors.grey[300]
            :  MaaruColors.textButtonColor
        ),
      body: SafeArea(
        bottom: false,
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(height: 20,),
            ShowLocation(),
SizedBox(height: 30,),
            Padding(padding:EdgeInsets.only(left: 10,right: 10),child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:[
              Container(
                  child:new Flexible(
                    child:
            TextFormField(
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
              20.0, 15.0, 25.0, 10.0),
          fillColor: Colors.white,
          suffixIcon: Image.asset(
            'assets/icons/icone-setting-19.png',
            height: 50,
            // width: 30,
          )),
    ),)),
SizedBox(width: 10,),
  Image.asset('assets/icons/icone-setting-40.png',height: 40,),])),
            Container(
                height: 380,
                width: 400,
                color: Colors.white,
                child: Appointments()),
            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.all(10),
              height: 170,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Column(children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                      ),
                      child: Image.asset('assets/images/kutta.png'),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Austin pet care',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            'Pet walking',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '1357 Muno Manor',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            'Austin,Tx 75923',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 15,
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
                Padding(
                  padding:EdgeInsets.only(left: 220),
              child:  Container(
                  alignment: Alignment.center,
                  //  padding: EdgeInsets.only(right: 80),
                  height: 35,
                  width: 140,
                  decoration: BoxDecoration(
                      color: MaaruColors
                          .blueColor,
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
                ),)]),
              ),
            ),
          ],
        )),
      ),
    );
  }
}
