import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/features/Account_setting/presentation/account_setting.dart';

class ShowLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Container(
            color: Colors.white,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
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
                hintText: 'Search Location',hintStyle: MaaruStyle.text.greyDisable,
                fillColor: Colors.grey[100],
                suffixIcon: Container(
                  child: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.grey,
                    ),
                    onPressed: () {},
                  ),
                ),
                filled: true,
                contentPadding: const EdgeInsets.only(
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
              decoration: const BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Image.asset(
                'assets/128/CrystalGaskell.png',
                height: 60,
                width: 60,
              ),
            )),
      ],
    );
  }
}
