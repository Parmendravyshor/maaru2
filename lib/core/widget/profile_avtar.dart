import 'package:flutter/material.dart';
import 'package:maru/core/network/network_info.dart';

class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final double avatarRadius;
  final double width;
final Color;
  const ProfileAvatar(
      {Key key,
      @required this.imageUrl,
      @required this.avatarRadius,
      @required this.width,
      child, this.Color, Container Function(dynamic context, dynamic error, dynamic stackTrace) errorBuilder})
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
                        image:NetworkImage(imageUrl),
                        //  NetworkImage(imageUrl),
                        fit: BoxFit.cover)),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ));
  }
}
