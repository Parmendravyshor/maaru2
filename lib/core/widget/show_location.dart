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
                enabledBorder:  OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
                  borderSide: BorderSide(color: Colors.white, width: 0.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(0.0),
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
            child: ProfileAvatar(

              imageUrl:  _prefHelper
              .getStringByKey(MaruConstant.img, ''),

          errorBuilder: (context, error, stackTrace) {
            return Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),

                alignment: Alignment.center,
                child: Image.asset('assets/128/CrystalGaskell.png'));

          },
              avatarRadius: 60,width: 40,Color: Colors.white,
              child: null,
            ),

          )
            // Container(
            //   height: 40,
            //   decoration: const BoxDecoration(
            //     color: Colors.white,
            //     shape: BoxShape.circle,
            //   ),
            //   child:
            //   Image.network(
            //       _prefHelper
            //           .getStringByKey(MaruConstant.img, ''),
            //       height: 60,
            //       width: 60,
            //       errorBuilder: (context, error, stackTrace) {
            //         return Container(
            //             decoration: const BoxDecoration(
            //               shape: BoxShape.circle,
            //             ),
            //
            //             alignment: Alignment.center,
            //             child: Image.asset('assets/128/CrystalGaskell.png'));
            //       }),
            // ),

      ],
    );
  }
}
