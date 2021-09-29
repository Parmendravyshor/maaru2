import 'package:flutter/material.dart';
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
        borderColor: Colors.grey[300],borderWidth: -0.0,
        fillColor: MaaruColors.primaryColorsuggesion1,
         selectedBorderColor: Colors.white,
        selectedColor: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(54, 10, 54, 15),
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
