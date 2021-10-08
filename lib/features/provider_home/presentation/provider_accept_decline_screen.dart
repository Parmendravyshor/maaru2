import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/show_location.dart';

import '../../../main.dart';

class ProviderAcceptOrDeclineScreen extends StatefulWidget {
  const ProviderAcceptOrDeclineScreen({Key key}) : super(key: key);

  @override
  _ProviderAcceptOrDeclineScreenState createState() =>
      _ProviderAcceptOrDeclineScreenState();
}

class _ProviderAcceptOrDeclineScreenState
    extends State<ProviderAcceptOrDeclineScreen> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(
                child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                  Container(
                      margin: EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        'Booking Request',
                        style: MaaruStyle.text.large,
                      )),

                  // Align(
                  //     alignment: Alignment.center,
                  //     child:
                  Padding(padding: EdgeInsets.only(left: 15,right: 20,top: 20),child:Column(children: [
                    Slidable(
                      actionPane: SlidableDrawerActionPane(),
                      actions: <Widget>[
                        Container(
                          padding: EdgeInsets.fromLTRB(40, 20, 0, 0),
                          color: Colors.red,
                          height: 140,
                          width: 300,
                          //   decoration: BoxDecoration,
                          child:Row(children: [
                            IconSlideAction(
                              caption: 'Accept',
                              color: Colors.blue,
                              icon:
                              Icons.done,

                            ),
                            Icon(Icons.arrow_forward)
                          ]),)],
                      secondaryActions: <Widget>[

                        IconSlideAction(
                          caption: 'Delete',
                          color: Colors.red,
                          icon: Icons.delete,
                        ),
                      ],
                      child: Container(
                        height: 130,
                        width: 420,
                        //margin: EdgeInsets.all(25),
                        child: Container(
                            decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(20.7),
                                border: Border.all(color: Colors.grey[200])),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Max',
                                      style: MaaruStyle.text.large,
                                    ),
                                    SizedBox(
                                      width: 60,
                                    ),
                                    Text('Aug. 21, 2021')
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(
                                      'Dog Grooming',
                                      style: MaaruStyle.text.large,
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Text('10:00')
                                  ],
                                ),
                                Padding(
                                    padding: EdgeInsets.only(right: 40),
                                    child: Text(
                                      '1357 Muno Manor Austin, Tx 75923',
                                    )),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(left: 120),
                                  height: 35,
                                  width: 150,
                                  decoration: BoxDecoration(
                                      color: MaaruColors.primaryColorsuggesion1,
                                      borderRadius: new BorderRadius.circular(10.7),
                                      border: Border.all(color: Colors.white)),
                                  child: Text(
                                    'View Details',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ],
                            )
                          //Text('Item Data$index'),
                        ),
                      ),
                    )
                    //  )
                  ]),
                  )]))));
  }
}
