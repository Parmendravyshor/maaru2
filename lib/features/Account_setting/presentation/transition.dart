import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/profile_avtar.dart';
class TransitionScreen extends StatefulWidget {


  @override
  _TransitionScreenState createState() => _TransitionScreenState();
}

class _TransitionScreenState extends State<TransitionScreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(children: [
                BackArrowButton(),
            Container(
              color: Colors.white,
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [

                Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset(
                        'assets/128/CrystalGaskell.png',
                        height: 60,
                        // width: 60,
                      ),
                    )),
              SizedBox(height: 20,),
                Padding(
                    padding:
                    EdgeInsets.only(top: 15, right: 10, left: 5),
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
                              20.0, 15.0, 25.0, 10.0),
                          fillColor: Colors.white,
                          suffixIcon: Image.asset(
                            'assets/icons/icone-setting-19.png',
                            height: 50,
                            // width: 30,
                          )),
                    )),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffF9F9F9),
                      ),
                      height: size.height * 0.05,
                      width: size.width * 0.43,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 20,
                            color: Color(0xffF1A102),
                          ),
                          Text(
                            'Aug 25,2021',
                            style:
                            TextStyle(fontSize: 13, color: Color(0xff525252)),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xffF9F9F9),
                      ),
                      height: size.height * 0.05,
                      width: size.width * 0.43,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            'Filter by week',
                            style: TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          Icon(
                            Icons.expand_more,
                            size: 25,
                            color: Color(0xff01301F),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Text(
                  'Transactions',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Container(
                  height: 125,
                  width: 450,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey.shade100,),

                  child: Container(

                    margin: EdgeInsets.all(5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 40,
                          width: 40,
                          decoration:  BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: ''.isEmpty
                                  ? const ExactAssetImage(
                                  'assets/128/CrystalGaskell.png')
                                  : FileImage(File('')),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(width: 0,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Austin Pet Groomings',
                              style:MaaruStyle.text.tiniestSmall,),
                            SizedBox(height: 8,),
                            Text(
                              'Aug 8,2021',
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '\$78.00',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 12),
                            ),
                            Text(
                              'Pet Grooming',
                              style: TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                            SizedBox(height: 8,),

                          ],
                        )
                      ],
                    ),
                      FlatButton(
                        onPressed: () {},
                        child: Text('View Details'),
                        color: MaaruColors.blueColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )
                  ]),
                )
              ),
            ]))])));
    ;
  }
}
