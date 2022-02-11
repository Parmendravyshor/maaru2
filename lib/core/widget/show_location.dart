import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/back_arrow.dart';
import 'package:maru/core/widget/profile_avtar.dart';
import 'package:maru/features/Account_setting/presentation/bloc/account_setting.dart';

class ShowLocation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Expanded(
          child: Container(

            color: Colors.transparent,
            margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextFormField(
              cursorColor: Colors.black,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  borderSide: BorderSide(color: Colors.white, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(0.0),
                    borderSide:
                        const BorderSide(color: Colors.white, width: 0.0)),
                hintText: 'Search Location',
                hintStyle: MaaruStyle.text.greyDisable,
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
        Container(
          height: 40,
          width: 40,
          decoration:  BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            image: DecorationImage(
              image: _prefHelper.getStringByKey('img', '').isEmpty
                  ? const ExactAssetImage(
                  'assets/128/CrystalGaskell.png')
                  : FileImage(File(_prefHelper.getStringByKey('img', ''))),
              fit: BoxFit.cover,
            ),
          ),
        )],
    );
  }
}
