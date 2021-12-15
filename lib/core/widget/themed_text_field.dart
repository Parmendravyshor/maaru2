import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/theme/style.dart';

class _ThemedTextFieldState extends State<ThemedTextField> {
  bool _obscureText = false;
  bool _password = false;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  FocusNode _focusNode = FocusNode();

  _ThemedTextFieldState(this._password) {
    _obscureText = this._password;
  }

  @override
  void initState() {
    super.initState();

    // Force a repaint whenever focus changes
    _focusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  // Toggles the password show status
  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  /// inputDectoration deals with passing border details
  /// and placeholder details
  inputDecoration(ThemedTextField widget) {
    return InputDecoration(
        filled: true,
        fillColor: Colors.white,
        suffixIcon: widget.suffixIcon != null
            ? Container(
                child: Row(children: [
                Text(widget.text1),
                FractionallySizedBox(
                    heightFactor: 0.7,
                    child: TextButton(
                        onPressed: _password ? _toggle : null,
                        child: Image(image: widget.suffixIcon)))
              ]))
            : null,
        //  errorBorder: MaaruStyle.defaultBorder,
        // focusedErrorBorder: MaaruStyle.defaultBorder,
        // border: MaaruStyle.defaultBorder,
        // disabledBorder: MaaruStyle.defaultBorder,
        // enabledBorder: MaaruStyle.defaultBorder,
        // focusedBorder: MaaruStyle.focusedBorder,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: MaaruColors.textfeildline),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
        labelText: widget.placeholder,
        contentPadding: EdgeInsets.only(left: 0),
        labelStyle:  MaaruStyle.text.tiny,
       );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
            height: TextFieldContainerHeight,
            color: Colors.white,
            child: FractionallySizedBox(
                widthFactor: 0.9,
                heightFactor: 1,
                child: Column(children: [
                  Container(
                      height: TextFieldHeight,
                      child: Form(
                          key: _formKey,
                          child: TextFormField(
                            focusNode: _focusNode,
                            obscureText: _obscureText,
                            enabled: widget.enabled,
                            controller: widget.editingController,
                            textInputAction: widget.textinputaction2,
                            onChanged: widget.onChanged,
                            autocorrect: false,
                            keyboardType: widget.keyboardType,
                            style: MaaruStyle.text.tiny,
                            decoration: inputDecoration(widget),
                          )))
                ]))));
  }
}

/// Themed form text input field
///
/// Themes a default TextField, allowing various elements to be customised by
/// injecting them into the constructor. This will be used everywhere and
/// it uses a fixed height to allow properly rounding the edges. The height
/// will be defined in style.
class ThemedTextField extends StatefulWidget {
  final String placeholder;
  final ImageProvider suffixIcon;
  final TextInputType keyboardType;
  final ValueChanged<String> onChanged;
  final TextEditingController editingController;
  final bool enabled, password;
  final Text text;
  final String text1;
  final TextStyle textStyle;
  final textinputaction2;
  ThemedTextField(
    this.placeholder,
    this.keyboardType, {
    this.suffixIcon,
    this.onChanged,
    this.text1,
    this.text,
    this.editingController,
    this.enabled,
    this.textinputaction2,
    this.password = false,
    this.textStyle,
    TextInputAction textInputAction,
    bool autovalidate,
  });

  @override
  _ThemedTextFieldState createState() => _ThemedTextFieldState(this.password);
}

class ThemeChanges2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
             Flexible(
              child: Container(
                  alignment: Alignment.center,
                   padding: EdgeInsets.only(top: 4),
                  child:
                  TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      //When the TextFormField is ON focus
                      contentPadding: EdgeInsets.only(right: 6),
                      hintText: 'Height',
                      hintStyle: MaaruStyle.text.tiniest,
                    ),
                    onChanged: (text) {
                      //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                    },
                    //   editingController: _lnameController
                  )
              ),
            ),
            new Flexible(
              child: Container(
                  alignment: Alignment.center,

                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]),
                        ),
                        //When the TextFormField is ON focus

                        hintText: '0',
                        hintStyle: MaaruStyle.text.greyDisable,
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(top: 20, right: 1),
                          child: Text(
                            'ft',
                            style: MaaruStyle.text.tiniest,
                          ),
                        )),
                    onChanged: (text) {
                      //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                    },
                    //   editingController: _lnameController
                  )),
            ),
            new Flexible(
              child: Container(
                 
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]),
                        ),
                        // //When the TextFormField is ON focus
                        // focusedBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.teal),
                        // ),
                        hintText: '0',
                        hintStyle: MaaruStyle.text.greyDisable,
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            'inch',
                            style: MaaruStyle.text.tiniest,
                          ),
                        )),
                    onChanged: (text) {
                      //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                    },
                    //   editingController: _lnameController
                  )),
            ),
          ],
        )));
  }
}

class ThemeChanges extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 20, right: 20),
        child: Container(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            new Flexible(
              child: Container(
                  padding: EdgeInsets.only(top: 7),
                  alignment: Alignment.center,
                  // padding: EdgeInsets.only(right: 15),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey[300]),
                      ),
                      //When the TextFormField is ON focus
                       contentPadding: EdgeInsets.only(right: 5),
                      hintText: 'Weight',
                      hintStyle: MaaruStyle.text.tiniest,
                    ),
                    onChanged: (text) {
                      //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                    },
                    //   editingController: _lnameController
                  )),
            ),
            new Flexible(
              child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(top: 3),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]),
                        ),
                        //When the TextFormField is ON focus

                        hintText: '      0',
                        hintStyle: MaaruStyle.text.greyDisable,

                        )),


                    //   editingController: _lnameController
                  )),

            new Flexible(
              child: Container(
                  padding: EdgeInsets.only(top: 3),
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    keyboardType: TextInputType.number,
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey[300]),
                        ),
                        // //When the TextFormField is ON focus
                        // focusedBorder: UnderlineInputBorder(
                        //   borderSide: BorderSide(color: Colors.teal),
                        // ),

                        hintStyle: MaaruStyle.text.greyDisable,
                        suffixIcon: Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Text(
                            '   lbs',
                            style: MaaruStyle.text.tiniest,
                          ),
                        )),
                    onChanged: (text) {
                      //BlocProvider.of<RegisterBloc>(context).add(LNameChanged(text));
                    },
                    //   editingController: _lnameController
                  )),
            ),
          ],
        )));
  }
}
