
import 'package:flutter/material.dart';
import 'package:flutter_bloc/src/bloc_provider.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';

import 'alert_manager.dart';
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
        fillColor: Color(0xffe2d6b8),
        selectedBorderColor: Colors.white,
        selectedColor: Colors.white,
        // borderRadius: BorderRadius.circular(
        //   10,
        // ),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text('MALE',
              style: pressed
                  ? MaaruStyle.text.toggel
                  : MaaruStyle.text.toggel,),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Text('FEMALE',
              style: pressed
                  ? MaaruStyle.text.toggel
                  : MaaruStyle.text.toggel,),
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


