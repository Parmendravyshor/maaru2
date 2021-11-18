import 'package:flutter/material.dart';

class ScreenIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
     // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.only(left: 20),
            onPressed: () {},
            child: Image.asset(
              "assets/icons/btn-facebook.png",
              width: 170,
            ),
          ),
        ),
       SizedBox(width: 10,),
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.only(right: 20),
            onPressed: () {},
            child: Image.asset(
              "assets/icons/btn-google.png",
              width: 170,
              //  fit: BoxFit.cover,

              // height: 70,
            ),
          ),
        ),
      ],
    );
  }
}


class ScreenIcon2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.only(left: 20),
            onPressed: () {},
            child: Image.asset(
              "assets/icons/btn-facebook.png",
              width: 170,
            ),
          ),
        ),
        SizedBox(width: 10,),
        Expanded(
          child: FlatButton(
            padding: EdgeInsets.only(right: 20),
            onPressed: () {},
            child: Image.asset(
              "assets/icons/btn-google.png",
              width: 170,
              //  fit: BoxFit.cover,

              // height: 70,
            ),
          ),
        ),
      ],
    );
  }
}
