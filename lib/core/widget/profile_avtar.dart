import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kiwi/kiwi.dart';
import 'package:maru/core/constant/constant.dart';
import 'package:maru/core/data/datasource/shared_pref_helper.dart';
import 'package:maru/core/network/network_info.dart';

class ProfileAvatar extends StatelessWidget {
  SharedPrefHelper _prefHelper = KiwiContainer().resolve<SharedPrefHelper>();
  final String imageUrl;
  final String imageUrl2;
  final double avatarRadius;
  final Function(dynamic context, dynamic error, dynamic stackTrace) errorBuilder;
  final double width;
final Color;
   ProfileAvatar(
      {Key key,
      @required this.imageUrl,
      @required this.avatarRadius,
      @required this.width,
      child, this.Color,  Function(dynamic context, dynamic error, dynamic stackTrace), this.errorBuilder, this.imageUrl2 })
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
        alignment: Alignment.center,
        height: avatarRadius,
        width: width,

        // color: MyTheme.red,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                height: avatarRadius,
                width: avatarRadius,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color:Color, width: 1.0),
                    image: DecorationImage(
                        image:_prefHelper.getStringByKey(MaruConstant.img, '').isEmpty ? Image.asset('assets/128/CrystalGaskell.png').toString():
                        FileImage(File(_prefHelper.getStringByKey(MaruConstant.img, '').toString())),
                ),

                        //  NetworkImage(imageUrl),


                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
