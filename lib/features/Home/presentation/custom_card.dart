import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/domain/usecases/email_auth_params.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/profile_avtar.dart';

class CustomCard extends StatefulWidget {
  const CustomCard({Key key,this.chatModel}) : super(key: key);
final ChatModel chatModel;
  @override
  _CustomCardState createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){},
        child: Column(
        children: [
            Align(
            alignment: Alignment.centerRight,
            child:Expanded(
                child: Padding(padding: EdgeInsets.only(left: 10,right: 20),
                child:
                Container(

                    height: 120,width:400,

                    decoration: BoxDecoration(
                        color: Colors.grey[50],
                    borderRadius: BorderRadius.circular(20.0),


                    ),
                  child:Center(child:

          ListTile(
            leading: ProfileAvatar(
          imageUrl:  ('assets/images/istockphoto-1179420343-612x612.jpg'),
              width: 50,
              avatarRadius: 60,
              Color: Colors.yellow,
            ),
            title: Text(
              'Austin pet care',
              style: MaaruStyle.text.large,
            ),
            subtitle:
            Text(
              'Are we meeting tommarow still pet services',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,color: Colors.grey),
            ),
            trailing: Text('today', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,color: Colors.grey),),

          ),

    ))))),
          Align(
              alignment: Alignment.centerRight,
              child:Expanded(
                  child: Padding(padding: EdgeInsets.only(left: 10,right: 20),
                      child:
                      Container(

                          height: 120,width:400,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),


                          ),
                      child:Center(child:

                      ListTile(
                        leading: ProfileAvatar(
                          imageUrl:  ('assets/images/Russo-Alessandro-Eric-20.jpg'),
                          width: 50,
                          avatarRadius: 60,
                          Color: Colors.yellow,
                        ),
                        title: Text(
                          'Austin pet Grooming',
                          style: MaaruStyle.text.large,
                        ),
                        subtitle: Text(
                          'Are we still meeting tommorrow about the pet services',
                          style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,color: Colors.grey),
                        ),
                        trailing: Text('today', style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold,color: Colors.grey),),

                      ),

                      ))))),
        ]),
      );
  }
}
