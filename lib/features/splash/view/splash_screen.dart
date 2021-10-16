
import 'package:flutter/material.dart';

import 'package:maru/core/data/datasource/notification.dart';
import 'package:maru/core/data/datasource/notification_helper.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/core/widget/background_image.dart';
import 'package:maru/features/splash/verify_screen.dart';

// ignore: todo
//TODO: Splash Screen

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  // final String _heading = "Standing up as a community\nagainst sexual violence";
  LocalDataHelper localDataHelper = LocalDataHelper();
  String latitude = 'waiting...';
  String longitude = 'waiting...';
  String altitude = 'waiting...';
  String accuracy = 'waiting...';
  String bearing = 'waiting...';
  String speed = 'waiting...';
  String time = 'waiting...';

  @override
  void initState() {
    super.initState();
    // pushNotification();
    getToken();

    localDataHelper.saveValue(key: "IsActive", value: false);
    //onBackgroundLocationUpdation();
    navigateToNextScreen();
  }
//todo: Navigate to AfterSplashScreen

  navigateToNextScreen() {
    Future.delayed(Duration(seconds: 5), () async {
      String token = await localDataHelper.getStringValue(key: "token");
      print("tokennnnnnnnnnnn :$token");
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => VerifyUser()),
          (route) => false);
    });
  }

  getToken() async {
    NotificationHelper helper = NotificationHelper();
    var fcmToken = await helper.getToken();
    print("fcm fcm fcm fcm fcm fcm fcm:$fcmToken");
  }

//todo: showing notificatonon background when app is running

  // onBackgroundLocationUpdation() async {
  //   await BackgroundLocation.setAndroidNotification(
  //     title: 'Background service is running',
  //     message: 'Background location in progress',
  //     icon: '@mipmap/ic_launcher',
  //   );
  //   await BackgroundLocation.setAndroidConfiguration(1000);
  //   await BackgroundLocation.startLocationService(distanceFilter: 20);
  //   BackgroundLocation.getLocationUpdates((location) {
  //     setState(() {
  //       latitude = location.latitude.toString();
  //       longitude = location.longitude.toString();
  //       accuracy = location.accuracy.toString();
  //       altitude = location.altitude.toString();
  //       bearing = location.bearing.toString();
  //       speed = location.speed.toString();
  //       time = DateTime.fromMillisecondsSinceEpoch(location.time.toInt())
  //           .toString();
  //     });
  //     print(
  //         '''\n
  //       Latitude:  $latitude
  //       Longitude: $longitude
  //       Altitude: $altitude
  //       Accuracy: $accuracy
  //       Bearing:  $bearing
  //       Speed: $speed
  //       Time: $time
  //     ''');
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    return Scaffold(
        //Todo: Useing Background image inside the Screen

        backgroundColor: MaaruColors.whiteColor,
        body:
         Stack(children: [
          Image.asset(
            'assets/icons/Splash-Provider-or-User-screen-svg-new.png',
            height: 3000,
            width: 3000,
            fit: BoxFit.cover,
          ),
          Container(
              alignment: Alignment.center,
              child: BackgroundImage(
                assetImage: 'assets/images/logom (3).png',
                //  hight: 200,
                widt: 300,
              ))
        ]));
  }
}
