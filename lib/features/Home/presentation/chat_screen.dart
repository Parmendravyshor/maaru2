
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/main.dart';

class ChatScreen extends StatefulWidget {
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0XFFf9f9f9),
        appBar: AppBar(
          toolbarHeight: 190,
elevation: 0,
          // Set this height
          flexibleSpace: Container(
            color: Colors.white,
            child: Column(
              children: [
                SizedBox(height: 30),
                BackArrowButton(),
                ProfileAvatar(
                  imageUrl: ('assets/images/Russo-Alessandro-Eric-20.jpg'),
                  width: 80,
                  avatarRadius: 80,
                  Color: Colors.yellow,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'OSCAR',
                  style: MaaruStyle.text.tiniest,
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Padding(
            padding:  EdgeInsets.only(bottom: 130.0, right: 20),
            child: FloatingActionButton(
                onPressed: () {},
                child: Image.asset('assets/icons/icone-setting-65.png'))),
        body: SafeArea(
          bottom: false,
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Stack(children: [
                ListView(
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ProfileAvatar(
                              imageUrl:
                                  ('assets/images/Russo-Alessandro-Eric-20.jpg'),
                              width: 40,
                              avatarRadius: 40,
                              Color: Colors.yellow,
                            ),
                            Card(
                              margin: EdgeInsets.only(top: 20),
                              color: MaaruColors.primaryColorsuggesion,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )),
                              child:
                        Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 80,
                                 width: 270,
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                            'I would like to discuss some monthly subscription with you',
                                            style: MaaruStyle.text.tiny),
                                      ),
                                    ],
                                  )),
                            )
                          ],
                        )),
                    Container(
                        padding: const EdgeInsets.only(top: 30, bottom: 10),
                        alignment: Alignment.center,
                        child: Text(
                          'Aug2,11:30Am',
                          style: MaaruStyle.text.greyDisable,
                        )),
                    Padding(
                        padding: EdgeInsets.only(left: 10, right: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Card(
                              margin: EdgeInsets.only(top: 20),
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20),
                              )),
                              child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 70,
                                  width: 270,
                                  child: Column(
                                    children: <Widget>[
                                      ListTile(
                                        title: Text(
                                            'Sounds good. I am free most of the today tomorrow',
                                            style: MaaruStyle.text.tiny),
                                      ),
                                    ],
                                  )),
                            ),
                            ProfileAvatar(
                              imageUrl: ('assets/128/DavidElks.png'),
                              width: 40,
                              avatarRadius: 40,
                              Color: Colors.yellow,
                            ),
                          ],
                        )),
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                      //  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            height: MediaQuery.of(context).size.height * 0.25,
                            width: MediaQuery.of(context).size.width,
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(top: 20, left: 30),
                              child: TextFormField(
                                  textAlign: TextAlign.start,
                                  textAlignVertical: TextAlignVertical.center,
                                  keyboardType: TextInputType.multiline,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.only(right: 60, left: 20),
                                    hintText: 'Type message here',
                                    hintStyle: MaaruStyle.text.greyDisable,
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white)),
                                    disabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white),
                                    ),
                                    prefixIcon: TextButton(
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                  height: 130,
                                                  color: Colors.white,
                                                  child: Column(children: [
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceEvenly,
                                                        children: [
                                                          IconItem(
                                                            Icons
                                                                .insert_drive_file,
                                                            Colors.indigo,
                                                            'Document',
                                                          ),
                                                          IconItem(
                                                              Icons.camera_alt,
                                                              Colors.pink,
                                                              'Camera'),
                                                          IconItem(
                                                              Icons
                                                                  .insert_photo,
                                                              Colors.purple,
                                                              'Gallery'),
                                                          InkWell(
                                                            onTap: () {
                                                              Navigator.of(
                                                                      context)
                                                                  .push(MaterialPageRoute(
                                                                      builder:
                                                                          (_) =>
                                                                              SimpleMAp()));
                                                            },
                                                            child: IconItem(
                                                                Icons
                                                                    .location_pin,
                                                                Colors.yellow,
                                                                'Location'),
                                                          )
                                                        ])
                                                  ]));
                                            });
                                      },
                                      child: Image.asset(
                                        'assets/icons/icone-setting-64.png',
                                        height: 40,
                                      ),
                                    ),
                                  )),
                            ))
                      ]),
                ),
              ])),
        ));
  }

  Widget IconItem(IconData icon, Color color, String text) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          backgroundColor: color,
          child: Icon(
            icon,
            size: 29,
          ),
        ),
        Text(
          text,
          style: MaaruStyle.text.tiny,
        ),
      ],
    );
  }
}
