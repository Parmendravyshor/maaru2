import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var image = new Image.network("http://www.gstatic.com/webp/gallery/1.jpg");
    var container = new Container(
      child: image,
      padding: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
      width: 200.0,
      height: 200.0,
    );

    return Scaffold(
      body: Center(
          child: new ListView.builder(
        itemBuilder: (context, index) {
          if (index == 0) {
            //first row is horizontal scroll
            var singleChildScrollView = SingleChildScrollView(
                child: Row(
                  children: <Widget>[
                    container,
                    container,
                    container,
                  ],
                ),
                scrollDirection: Axis.horizontal);
            return singleChildScrollView;
          } else {
            return new Row(
              children: <Widget>[container, container],
            );
          }
        },
        itemCount:
            1, // 9 rows of AllGenresAndMoods + 1 row of PopularGenresAndMoods
      )),
    );
  }
}

class TEst4 extends StatefulWidget {
  @override
  _TEst4State createState() => _TEst4State();
}

class _TEst4State extends State<TEst4> {
  bool priceupdate_value = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (priceupdate_value)
          Column(
            children: <Widget>[
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'New Price',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Update Other Information',
                ),
              ),
            ],
          ),
        CheckboxListTile(
          title: Text("Do you want to update your price?"),
          controlAffinity: ListTileControlAffinity.leading,
          value: priceupdate_value,
          onChanged: (bool priceupdateValue) {
            setState(() {
              priceupdate_value = priceupdateValue;
            });
          },
        ),
      ],
    );
  }
}

class FAkeTEst2 extends StatefulWidget {
  @override
  _FAkeTEst2State createState() => _FAkeTEst2State();
}

class _FAkeTEst2State extends State<FAkeTEst2> {
  bool priceupdate_value = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (priceupdate_value)
          Column(
            children: <Widget>[
              CustomPaint(
                size: Size(400, 400),
                painter: LinePainter(),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'New Price',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  labelText: 'Update Other Information',
                ),
              ),
            ],
          ),
        Switch(
          // title: Text("Do you want to update your price?"),
          // controlAffinity: ListTileControlAffinity.leading,
          value: priceupdate_value,
          onChanged: (bool priceupdateValue) {
            setState(() {
              priceupdate_value = priceupdateValue;
            });
          },
        ),
      ],
    );
  }
}

class ButtonPainter extends CustomPainter {
  Color buttonBorderColor;
  Color progressColor;
  double percentage;
  double width;
  ButtonPainter(
      {this.buttonBorderColor,
      this.progressColor,
      this.percentage,
      this.width});
  @override
  void paint(Canvas canvas, Size size) {
    Paint line = Paint()
      ..color = buttonBorderColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Paint complete = Paint()
      ..color = progressColor
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke
      ..strokeWidth = width;
    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = min(size.width / 2, size.height / 2);
    canvas.drawCircle(center, radius, line);
    double arcAngle = 2 * pi * (percentage / 100);
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, complete);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class CurvedPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 15;

    var path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.200, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class LinePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 300;

    Offset start = Offset(0, size.height / 2);
    Offset end = Offset(size.width, size.height / 2);

    canvas.drawLine(start, end, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

void paint(Canvas canvas, Size size) {
  double dashHeight = 5, dashSpace = 3, startY = 0;
  final paint = Paint()
    ..color = Colors.grey[300]
    ..strokeWidth = 1;
  while (startY < size.height) {
    canvas.drawLine(Offset(0, startY), Offset(0, startY + dashHeight), paint);
    startY += dashHeight + dashSpace;
  }
}

@override
bool shouldRepaint(CustomPainter oldDelegate) => false;
