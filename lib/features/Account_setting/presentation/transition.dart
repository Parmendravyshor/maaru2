import 'package:flutter/material.dart';
import 'package:maru/core/widget/date_picker.dart';

class TransitionScreens extends StatefulWidget {
  const TransitionScreens({Key key}) : super(key: key);

  @override
  _TransitionScreensState createState() => _TransitionScreensState();
}

class _TransitionScreensState extends State<TransitionScreens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(children: [
          Align(
              alignment: Alignment.centerRight,
              child: Container(
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/64/AlanPost.png',
                  height: 60,
                  // width: 60,
                ),
              )),
          Container(
            padding: EdgeInsets.only(right: 20, left: 20),
            color: Colors.white,
            height: 45,
            //  width: 200,
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                  border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(10.7),
                      borderSide: new BorderSide()),
                  hintText: 'Search',
                  fillColor: Colors.white,
                  suffixIcon: Image.asset(
                    'assets/icons/icone-setting-19.png',
                    height: 50,
                    // width: 30,
                  )),
            ),
          ),
            Padding(padding:EdgeInsets.fromLTRB(10, 20, 10, 0),child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [ Text('hfkjhf')],
          ))
        ])));
  }
}
