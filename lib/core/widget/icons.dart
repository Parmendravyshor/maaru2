import 'package:flutter/material.dart';

class ScreenIcon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Container(

      margin: EdgeInsets.only(left: 25,right: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: (){},
            child: Image.asset(
              'assets/icons/Rectangle copy.png',
              height: size.height * 0.06,
            ),
          ),
          SizedBox(
            width: size.width * 0.04,
          ),
          InkWell(
            onTap: (){},
            child: Image.asset(
              'assets/icons/Rectangle (1).png',
              height: size.height * 0.06,
            ),
          )
        ],
      ),
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
