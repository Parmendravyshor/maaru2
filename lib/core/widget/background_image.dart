import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final  assetImage;
  final double hight;
  final double widt;

  const BackgroundImage(
      {Key key, @required this.assetImage, this.hight, this.widt})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return
       Container(

        child: Image.asset(
          assetImage, height: hight, width: widt,

          // colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
        ),

    );
  }
}
