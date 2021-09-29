import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/features/Home/presentation/create_home_screen.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';

class SkipButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => CreateHomeScreen()));
        },
        child:
        Text(
          'Skip Registration',
          style: MaaruStyle.text.medium,
        ),
      ),
    );
  }
}
