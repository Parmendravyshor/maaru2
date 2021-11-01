import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/themed_text_field.dart';
import 'package:maru/core/widget/widgets.dart';

class ChangePasswordScreen extends StatefulWidget {
  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: SingleChildScrollView(


                //   Padding(
                padding: EdgeInsets.only(
                  left: 0,top: 0
                ),
                child: Column(
                   // crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BackArrowButton(),

                    Container(
                    //  padding: EdgeInsets.only(right: 40),
                            alignment: Alignment.centerRight,
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

                            Align(
                              alignment: Alignment.centerLeft,
                          child:   Text(
                                '          Change Password',textAlign: TextAlign.start,
                                style: MaaruStyle.text.tiniest,
                              )),

                            SizedBox(
                              height: 40,
                            ),
                            ThemedTextField(
                              " Enter Current password",
                              TextInputType.text,
                              textInputAction: TextInputAction.next,
                              textStyle: TextStyle(color: Colors.grey[300]),
                              onChanged: (text) {
                                //  BlocProvider.of<RegisterBloc>(context)
                                //  .add(PasswordChanged(text));
                              },
                              // editingController: _emailController,
                            ),
                            ThemedTextField(
                              "Enter new password",
                              TextInputType.text,
                              textInputAction: TextInputAction.next,
                              textStyle: TextStyle(color: Colors.grey[300]),
                              onChanged: (text) {
                                //  BlocProvider.of<RegisterBloc>(context)
                                //  .add(PasswordChanged(text));
                              },
                              // editingController: _emailController,
                            ),
                            ThemedTextField(
                              "Confirm password",
                              TextInputType.text,
                              textInputAction: TextInputAction.next,
                              textStyle: TextStyle(color: Colors.grey[300]),
                              onChanged: (text) {
                                //  BlocProvider.of<RegisterBloc>(context)
                                //  .add(PasswordChanged(text));
                              },
                              // editingController: _emailController,
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            ThemedButton(
                              text: 'Change Password',
                              onPressed: () {},
                              enabled: true,
                            )
                          ]))
                    ));
  }
}
