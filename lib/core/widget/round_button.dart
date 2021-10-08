import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../theme/maaru_style.dart';

class RoundedButton extends StatelessWidget {
  final buttonName;
  final Color;
  final Color1;
  const RoundedButton({@required this.buttonName, this.Color, this.Color1})
      : super();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.09,
      width: size.width * 0.85,
      decoration: BoxDecoration(
        color: Color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          buttonName,
          style:GoogleFonts.poppins(textStyle:TextStyle(
              color: Color1,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w600,
              fontSize: 20)),
        ),
      ),
    );
  }
}
