import 'package:flutter/material.dart';
import 'package:maru/features/Account_setting/presentation/account_setting.dart';

class ShowLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: Colors.white, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(25.0),
                  borderSide: const BorderSide(color: Colors.white, width: 0.0)),
                hintText: 'Search Location',
                fillColor: Colors.grey[100],
                suffixIcon: Container(
                  child: IconButton(
                    icon: Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ),
                filled: true,
                contentPadding: EdgeInsets.only(
                  left: 15.0,
                  top: 0.0,
                  bottom: 0.0,
                ),
              ),
            ),
          ),
        ),
        InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => AccountSettingScreen()));
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/64/AlanPost.png',
                height: 60,
                width: 60,
              ),
            )),
      ],
    );
  }
}
