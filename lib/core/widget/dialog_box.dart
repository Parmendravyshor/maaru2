import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';

class CustomDialogBox extends StatefulWidget {
  final String title, descriptions, text;
  final Image img;

  const CustomDialogBox(
      {Key key, this.title, this.descriptions, this.text, this.img})
      : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  TextEditingController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(left: 10, top: 30, right: 10, bottom: 10),
          margin: EdgeInsets.only(top: 20),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: MaaruStyle.colors.cardbg,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 10), blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Text(
                widget.title,
              ),
              SizedBox(
                height: 15,
              ),
              FractionallySizedBox(
                widthFactor: 0.9,
                child: TextField(
                  onChanged: (val) {},
                  textAlign: TextAlign.start,
                  controller: _controller,
                  maxLines: null,
                  decoration: InputDecoration(
                    hintText: 'Endpoint without https://',
                    // hintStyle: MaaruStyle.text.,
                    border: MaaruStyle.defaultBorder,
                    enabledBorder: MaaruStyle.defaultBorder,
                    focusedBorder: MaaruStyle.defaultBorder,
                  ),
                ),
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      if (_controller.text.isNotEmpty) {
                        KiwiContainer().resolve<SharedPrefHelper>().saveString(
                            MaaruConstant.chatEndPoint, _controller.text);
                        _controller.clear();
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text(
                      widget.text,
                      style: TextStyle(fontSize: 18),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
