


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
                height: 450,
                width: 400,
                color: Colors.white,
                child: Appointments()),
            SizedBox(height: 20,),
           Padding(padding:EdgeInsets.only(left: 10,right: 10),child:
               InkWell(onTap: (){
                 Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProviderBookedConfirm()));
               },
          child:  Image.asset('assets/images/austintext-1.png'))),
          ],
        )),
      ),
    );
  }
}
