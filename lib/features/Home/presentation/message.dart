import 'package:flutter/material.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/core/widget/show_location.dart';
import 'package:maru/features/Home/presentation/custom_card.dart';

import 'chat_circle_list_view.dart';

class Messages extends StatefulWidget {
  // const Messages({Key key}) : super(key: key);

  @override
  _MessagesState createState() => _MessagesState();
}

class _MessagesState extends State<Messages> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(

          children: [

            Align(
                alignment: Alignment.centerRight,

                    child:
                    Container(
                  alignment: Alignment.centerRight,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/64/AlanPost.png',
                    height: 60,
                   // width: 60,
                  ),
                )),

            Container(
              padding: EdgeInsets.only(right: 20,left: 20
              ),
              color: Colors.white,
              height: 45,
              //  width: 200,
              child: TextFormField(
                cursorColor: Colors.black,
                decoration: InputDecoration(
                    border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.7),
                        borderSide: new BorderSide()),
                    hintText: 'Search',
                    fillColor: Colors.white,
                    suffixIcon: Image.asset(
                      'assets/icons/icone-setting-19.png',
                      height: 50,
                      // width: 30,
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '   Providers',
                style: MaaruStyle.text.small,
              ),
            ),
            SizedBox(height: 10,),
            ListTile(
              leading:
                  Container(height: 100,width:200,child:
              Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
              ProfileAvatar(
                imageUrl: 'assets/images/Russo-Alessandro-Eric-20.jpg',
                avatarRadius: 60,
                width: 90,
                Color: Colors.yellow,
              ),
                ProfileAvatar(
                  imageUrl: 'assets/images/istockphoto-1179420343-612x612.jpg',
                  avatarRadius: 60,
                  width: 90,
                  Color: Colors.yellow,
                ),]),
// title: Padding(padding: EdgeInsets.only(right: 30),child:
// Align(alignment: Alignment.centerLeft,child:
// ProfileAvatar(
//   imageUrl: 'assets/images/Russo-Alessandro-Eric-20.jpg',
//   avatarRadius: 60,
//   width: 90,
//   Color: Colors.yellow,
// ),
                  )),


            CustomCard()
          ],
        )));
  }
}
