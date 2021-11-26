import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';

import 'account_setting.dart';

class PaymentScreen extends StatefulWidget {
  @override
  _PaymentScreenState createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BackArrowButton(),
                  InkWell(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => AccountSettingScreen()));
                      },
                      child: Align(alignment: Alignment.topRight,
                        child: Container(
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Image.asset(
                            'assets/128/CrystalGaskell.png',
                            height: 60,
                            width: 60,
                          ),
                        ),
                      )),
                ],
              ),

              SizedBox(
                height: 60,
              ),
              Container(
                  padding: EdgeInsets.only(left: 30.0),
                  child: Text(
                    'Payment Information',
                    style: MaaruStyle.text.tiniest,
                  )),
              SizedBox(
                height: 20,
              ),
              ThemedTextField(
                "Name on Card",
                TextInputType.text,
                textInputAction: TextInputAction.next,
                textStyle: TextStyle(color: Colors.grey[300]),
                onChanged: (text) {},
              ),
              ThemedTextField(
                "Credit Card Number",
                TextInputType.text,
                textInputAction: TextInputAction.next,
                textStyle: TextStyle(color: Colors.grey[300]),
                onChanged: (text) {},
              ),
              Row(
                children: [
                  new Flexible(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ThemedTextField(
                        "Exp Date", TextInputType.number,
                        textInputAction: TextInputAction.next,
                        textStyle: TextStyle(color: Colors.grey[300]),
                        onChanged: (text) {
                          //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                        },
                        //   editingController: _lnameController
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  new Flexible(
                    child: Container(
                      padding: EdgeInsets.only(right: 15),
                      child: ThemedTextField(
                        "Cvv", TextInputType.number,
                        textInputAction: TextInputAction.next,
                        textStyle: TextStyle(color: Colors.grey[300]),
                        onChanged: (text) {
                          //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                        },
                        //   editingController: _lnameController
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: CircleAvatar(
                      backgroundColor:Colors.grey[100],radius: 30,
                      child:
                    Icon(
                      Icons.add,
                      color: MaaruColors.buttonColor,
                      size: 35,
                    ),
                  )),
                  SizedBox(
                    width: 20,
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        'Add New Card',
                        style: MaaruStyle.text.mediumGreen,
                      ))
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child:Column(children: [

              Container(
                  height: 100,
                  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.deepPurple[50],
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Visa Card',
                              style: MaaruStyle.text.tiniest,
                            ),
                            Text('Primary Payment',style: MaaruStyle.text.greyDisable,),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 150),
                            child: Text('**** **** **** 9877',style: MaaruStyle.text.tiny,))
                      ]))),
              SizedBox(
                height: 20,
              ),
              Container(
                  height: 100,
                  width: 380,
                  decoration: BoxDecoration(
                      color: Colors.white,

                      borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey[100])
                  ),
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 10, 0),
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discover Card',
                              style: MaaruStyle.text.greyDisable,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 150),
                            child: Text('**** **** **** 9877',style: MaaruStyle.text.greyDisable,))
                      ]))),
              SizedBox(
                height: 30,
              ),
              ThemedButton(
                text: 'Update Payment',
                onPressed: () {},
              ),
              SizedBox(
                height: 100,
              )
            ],
          ),
        )]))));
  }
}
