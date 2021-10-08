import 'package:flutter/material.dart';

/// This is backarrow button to navigate to back pages on top left
class BackArrowButton extends StatelessWidget {
  //final VoidCallback onTap;
 // BackArrowButton({this.onTap});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Align(alignment: Alignment.centerLeft,child:
        IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: (){Navigator.pop(context);},
        ))
      ],
      alignment: Alignment.topLeft,
    );
  }
}
