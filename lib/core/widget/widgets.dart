import 'dart:math';

import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/theme/style.dart';
import 'dart:math' as math;
//import 'package:formz/formz.dart';
/// This is a widget that will be used for displaying header titles
class HeaderText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  HeaderText(this.text, {this.textAlign = TextAlign.center});
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: textAlign);
    //style: MaaruStyle.text.medium);
  }
}

/// This will be used by any description that goes below header.
class BodyText extends StatelessWidget {
  final String text;
  final TextAlign textAlign;
  final bool enable;
  BodyText(this.text, {this.textAlign = TextAlign.center, this.enable});
  @override
  Widget build(BuildContext context) {
    return Text(text, textAlign: textAlign);
    //  style: KompanionStyle.text.small);
  }
}

class ThemedButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool enabled;

  const ThemedButton({Key key, this.text, this.onPressed, this.enabled = true})
      : super(key: key);

  Widget build(context) {
    final enabledColor = MaaruColors.buttonColor;
    final disabledColor = MaaruStyle.colors.buttonDisabled;

    final enabledTextColor = MaaruColors.primaryColorsuggesion1;
    final disabledTextColor = MaaruStyle.colors.textDisabled;
    return Center(
        child: FractionallySizedBox(
            widthFactor: 0.92,
            child: Container(
                decoration: enabled ? MaaruStyle.buttonShadow : null,
                child: FlatButton(
                    minWidth: double.infinity,
                    height: ButtonMinHeight,
                    // color: MaaruColors.primaryColor,
                    shape: enabled
                        ? MaaruStyle.buttonShapeEnabled
                        : MaaruStyle.buttonShapeDisabled,
                    color: enabled ? enabledColor : disabledColor,
                    textColor: MaaruColors.primaryColorsuggesion,
                    padding: EdgeInsets.all(18.0),
                    onPressed: onPressed,
                    child: Text(text,
                        //style: TextStyle(color: MaaruColors.buttonTextColor),

                        style: MaaruStyle.text.small.copyWith(
                            fontWeight: FontWeight.w500,
                            color: enabled
                                ? enabledTextColor
                                : disabledTextColor))))));
  }
}

class ThemedButtonGey extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool enabled;

  const ThemedButtonGey(
      {Key key, this.text, this.onPressed, this.enabled = true})
      : super(key: key);

  Widget build(context) {
    final disabledColor = MaaruStyle.colors.buttonDisabled;

    return Center(
        child: FractionallySizedBox(
            widthFactor: 0.9,
            child: Container(
                decoration: enabled ? MaaruStyle.buttonShadow : null,
                child: FlatButton(
                    minWidth: double.infinity,
                    height: ButtonMinHeight,
                    shape: MaaruStyle.buttonShapeDisabled,
                    color: disabledColor,
                    textColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    onPressed: onPressed,
                    child: Text(text
                        //text,
                        //     style: MaaruStyle.text.small.copyWith(
                        //         fontWeight: FontWeight.w600,
                        //  color: Colors.black)
                        )))));
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool enabled;

  const CustomButton({Key key, this.text, this.onPressed, this.enabled = true})
      : super(key: key);

  Widget build(context) {
    final enabledTextColor = MaaruStyle.colors.enableButtonColor;

    return FractionallySizedBox(
        widthFactor: 0.9,
        child: Container(
            decoration: BoxDecoration(color: MaaruStyle.colors.cardbg),
            child: FlatButton(
                minWidth: double.infinity,
                height: ButtonMinHeight,
                shape: MaaruStyle.buttonShapeEnabled,
                // color: MaaruStyle.colors.whiteColor,
                textColor: Colors.white,
                padding: EdgeInsets.all(8.0),
                onPressed: onPressed,
                child: Text(''
                    // style: MaaruStyle.text.small.copyWith(
                    //     fontWeight: FontWeight.w600,
                    //     color: enabledTextColor

                    ))));
  }
}

class ToggleButton extends StatefulWidget {
  final String text1;
  final String text2;

  ToggleButton({Key key, @required this.text1, this.text2}) : super(key: key);

  @override
  State<ToggleButton> createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  List<bool> isSelected;

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      ToggleButtons(
        borderColor: Colors.black,
        fillColor: MaaruColors.buttonTextColor,
        // selectedBorderColor: Colors.white,
        selectedColor: Colors.white,
        borderRadius: BorderRadius.circular(
          10,
        ),
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(54, 15, 54, 15),
            child: Text(
              widget.text1,
              style: TextStyle(fontSize: 18),
            ),
          ),
          const Padding(
            padding: EdgeInsets.fromLTRB(54, 15, 54, 15),
            child: Text(
              'text2',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
        onPressed: (int index) {
          setState(() {
            for (int i = 0; i < isSelected.length; i++) {
              isSelected[i] = i == index;
            }
          });
        },
        isSelected: isSelected,
      ),
    ]);
  }
}
//import 'package:formz/formz.dart';

String validateEmail(String value) {
  Pattern pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value) || value == null)
    return 'Enter a valid email address';
  else
    return null;
}
