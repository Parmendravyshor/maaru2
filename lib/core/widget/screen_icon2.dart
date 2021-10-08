import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maru/core/theme/maaru_style.dart';

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  List<bool> isSelected;
  bool pressed = true;
  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ToggleButtons(
        borderColor: Colors.grey[300],
        borderWidth: -0.0,
        fillColor: MaaruColors.primaryColorsuggesion1,
        selectedBorderColor: Colors.white,
        selectedColor: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(50, 10, 50, 15),
            child: Text('Male',
                style: pressed
                    ? GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )
                    : GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                )),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(40, 10, 35, 15),
            child: Text('Female',
                style: pressed
                    ? GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.black,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )
                    : GoogleFonts.poppins(
                        textStyle: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Poppins',
                            fontSize: 18,
                            fontWeight: FontWeight.w500),
                      )),
          )
        ],
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index;
            }
          });
          setState(() {
            pressed = !pressed;
          });
        },
        isSelected: isSelected,
      )
    ]);
  }
}

class ToggleButton2 extends StatefulWidget {
  @override
  _ToggleButton2State createState() => _ToggleButton2State();
}

class _ToggleButton2State extends State<ToggleButton2> {
  List<bool> isSelected;
  bool pressed = true;
  @override
  void initState() {
    isSelected = [true, false];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ToggleButtons(
        borderColor: Colors.grey[300],
        borderWidth: -0.0,
        fillColor: MaaruColors.primaryColorsuggesion1,
        selectedBorderColor: Colors.white,
        selectedColor: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 100, 15),
            child: Text(
              'Male',
              style: pressed
                  ? TextStyle(fontSize: 20, color: Colors.black)
                  : TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(54, 10, 54, 15),
            child: Text(
              'Female',
              style: pressed
                  ? TextStyle(fontSize: 20, color: Colors.black)
                  : TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        ],
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index;
              pressed = !pressed;
            }
          });
        },
        isSelected: isSelected,
      ),
    ]);
  }
}
