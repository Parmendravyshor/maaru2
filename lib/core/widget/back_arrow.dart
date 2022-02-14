import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';

/// This is backarrow button to navigate to back pages on top left
class BackArrowButton extends StatelessWidget {
  //final VoidCallback onTap;
 // BackArrowButton({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.topLeft,child:
    IconButton(
      icon: Icon(Icons.arrow_back_ios_outlined,color:MaaruColors.buttonColor,),
      onPressed: (){Navigator.pop(context);},
    ));
  }
}
