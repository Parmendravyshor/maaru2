import 'dart:math';
import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
class Secrets {
  // Add your Google Maps API Key here
  static const API_KEY = 'AIzaSyAcwOMoEO8-zDBVGzeGdPspSM3qJepJeUA';
}
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


class FinalContainers extends StatefulWidget {
  @override
  _FinalContainersState createState() => _FinalContainersState();
}

class _FinalContainersState extends State<FinalContainers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            //container for upcoming appointments
            child:
            Container(
              height: 120,
              width: 400,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
              child: Container(
                margin: EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      width: 100,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Austin pet care',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 15),
                          ),
                          Text(
                            'Pet walking',
                            style: TextStyle(fontSize: 14),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Text(
                            '1357 Muno Manor',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            'Austin,Tx 75923',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Icon(
                            Icons.calendar_today_outlined,
                            size: 22,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            height: 36,
                          ),
                          Text(
                            'Aug 21,2021',
                            style: TextStyle(color: Colors.grey, fontSize: 12),
                          ),
                          Text(
                            '11:00 am',
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //container of booking confirmed
          Container(
            height: 135,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.grey),
            ),
            child: Container(
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.calendar_today_outlined,
                        size: 22,
                        color: Colors.yellow,
                      ),
                      Icon(
                        Icons.bike_scooter,
                        size: 22,
                        color: Colors.yellow,
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Date & Time',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      Text(
                        'Austin pet Groomers',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'Max',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: 80,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Aug 21,2021',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      Text(
                        '11:00 am',
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '\$85.00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //container for search screen
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey)),
            height: 120,
            child: Container(
              color: Colors.white,
              margin: EdgeInsets.all(10),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Franks Pet Lounge',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      Text(
                        'Franks Daycare',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.star,
                            size: 25,
                            color: Colors.yellow,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '42 Reviews   (4.0)',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //container for splash screen
          Container(
            height: 125,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: Colors.grey.shade100,),

            child: Container(

              margin: EdgeInsets.all(10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 30,
                  ),
                  SizedBox(width: 15,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Austin Pet Groomings',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        'Aug 8,2021',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        '\$78.00',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      Text(
                        'Pet Grooming',
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                      ),
                      SizedBox(height: 8,),
                      FlatButton(
                        onPressed: () {},
                        child: Text('View Details'),
                        color: Colors.green,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}


Future<Album> fetchAlbum() async {
  final response =
  await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

// Appropriate action depending upon the
// server response
  if (response.statusCode == 200) {
    return Album.fromJson(json.decode(response.body));
  } else {
    throw Exception('Failed to load album');
  }
}

class Album {
  final int userId;
  final int id;
  final String title;

  Album({this.userId, this.id, this.title});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}



class MyApp4 extends StatefulWidget {
  MyApp4({Key key}) : super(key: key);

  @override
  _MyApp4State createState() => _MyApp4State();
}

class _MyApp4State extends State<MyApp4> {
  Future<Album> futureAlbum;

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetching Data',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('GeeksForGeeks'),
        ),
        body: Center(
          child: FutureBuilder<Album>(
            future: futureAlbum,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.title);
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
