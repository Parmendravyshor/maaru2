import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      height: size.height * 0.4,
      // width: size.width * 0.9,

      child: Image.asset(
        "assets/images/logom (3).png",
        width: 200,
      ),
      //  fit: BoxFit.cover,
    );
  }
}
