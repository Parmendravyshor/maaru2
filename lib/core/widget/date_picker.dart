import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';

class DatePicker extends StatefulWidget {

  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime _selectedDate;
  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return
    Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(children: [
          TextField(
            focusNode: AlwaysDisabledFocusNode(),
            controller: _textEditingController,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
              // labelText: "Date of birth",
              hintText: 'mm/dd/year',
              prefixIcon:
                  Icon(Icons.calendar_today, color: MaaruColors.primaryColor),
            ),
            onTap: () {
              _selectDate(context);
            },
          ),
        ]));
  }

  _selectDate(BuildContext context) async {
    DateTime newSelectedDate = await showDatePicker(
        context: context,
        initialDate: _selectedDate != null ? _selectedDate : DateTime.now(),
        firstDate: DateTime(2000),
        lastDate: DateTime(2040),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.dark().copyWith(
              colorScheme: ColorScheme.dark(
                primary: Colors.deepPurple,
                onPrimary: Colors.white,
                surface: Colors.blueGrey,
                onSurface: Colors.yellow,
              ),
              dialogBackgroundColor: Colors.blue[500],
            ),
            child: child,
          );
        });

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _textEditingController
        ..text = DateFormat.yMd().format(_selectedDate)
        ..selection = TextSelection.fromPosition(TextPosition(
            offset: _textEditingController.text.length,
            affinity: TextAffinity.upstream));
    }
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
