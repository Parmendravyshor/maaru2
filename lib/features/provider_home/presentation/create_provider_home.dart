

import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/features/provider_home/presentation/provider_accept_decline_screen.dart';
import 'package:maru/features/provider_home/presentation/upcoming_appointment_calender.dart';
import 'package:maru/features/provider_home/presentation/upcoming_appointment_screen.dart';
import 'package:maru/features/provider_home/provider_message.dart';
import 'package:maru/features/provider_setting/presentation/provider_settin.dart';


class CreateProviderHome extends StatefulWidget {
  //dhhdhdkldhldh
  //gegggg
  // final int selectedIndex;
  final Color;
  final Color1;
  final Color2;
  final Color3;
  final selectedIndex;
  const CreateProviderHome(
      {Key key,
        this.Color,
        this.selectedIndex,
        this.Color1,
        this.Color2,
        this.Color3})
      : super(key: key);
  // const CreateHomeScreen({@required this.selectedIndex, @required this.Color})
  //     : super();
  @override
  _CreateProviderHomeState createState() => _CreateProviderHomeState();
}

class _CreateProviderHomeState extends State<CreateProviderHome> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0.0,
      backgroundColor: MaaruColors.darkGrey2,
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => TestApp()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20,top: 10),
                child: Image.asset('assets/icons/icon0.png',
                    height: 30, color: widget.Color
                  //selectedIndex == 0
                  //  ? MaaruColors.textButtonColor
                  // : Colors.grey[350],
                ),
              ),
            ),
            title: Text('')),
        BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => UpcomingAppointmentCalender()));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 40,bottom: 8),
                child: Image.asset('assets/icons/icon1.png',
                    height: 30, color: widget.Color1
                  //selectedIndex == 1
                  //   ? MaaruColors.textButtonColor
                  //  : Colors.grey[350],
                ),
              ),
            ),
            title: Text('')),
        BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) =>  UpcomingAppointmentCalender1(),));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Image.asset(
                    'assets/icons/icon4.png',
                    height: 60,
                  ),
                )),
            title: Text('')),
        BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => ProviderMessages()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(),
                  child: Image.asset(
                      'assets/icons/icon2.png',
                      height: 30,
                      color: widget.Color2
                    //selectedIndex == 3
                    //  ? MaaruColors.textButtonColor
                    // : Colors.grey[350],
                  ),
                )),
            title: Text('')),
        BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>   ProviderSetting()));
                },
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.asset(
                      'assets/icons/icon3.png',
                      height: 30,
                      color: widget.Color3
                    //selectedIndex == 4
                    //  ? MaaruColors.textButtonColor
                    // : Colors.grey[350],
                  ),
                )),
            title: Text('')),
      ],
      // currentIndex: selectedIndex,
      // onTap: (index) => setState(() => selectedIndex = index),
      //
    );
  }
}
// class CreateProviderHome extends StatefulWidget {
//
//
//   @override
//   _CreateProviderHomeState createState() => _CreateProviderHomeState();
// }
//
// class _CreateProviderHomeState extends State<CreateProviderHome> {
//
//   int currentTab = 0;
//   final List<Widget> screens = [
//
//     TestApp(),
//     UpcomingAppointmentCalender(),
//    UpcomingAppointmentCalender1(),
//     Messages(),
//     ProviderSetting(),
//     //   ArtistProfile()
//   ]; // to store nested tabs
//   final PageStorageBucket bucket = PageStorageBucket();
//   Widget currentScreen = TestApp();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: PageStorage(
//         child: currentScreen,
//         bucket: bucket,
//       ),
//       bottomNavigationBar: BottomAppBar(
//         color: Colors.white,
//         shape: CircularNotchedRectangle(),
//         notchMargin: 10,
//         child: Container(
//           height: 70,
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               Expanded(
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: <Widget>[
//                       MaterialButton(
//                         minWidth: 40,
//                         onPressed: () {
//                           setState(() {
//                             currentScreen = TestApp();
//                             currentTab = 0;
//                           });
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Image.asset(
//                               'assets/icons/icone-setting-10.png',
//                               height: 30,
//                               color:
//                               currentTab == 0 ? Colors.red : Colors.grey[350],
//                             ),
//                           ],
//                         ),
//                       ),
//                       MaterialButton(
//                         minWidth: 40,
//                         onPressed: () {
//                           setState(() {
//                             currentScreen = UpcomingAppointmentCalender1();
//                             currentTab = 1;
//                           });
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Image.asset(
//                               'assets/icons/icone-95.png',
//                               height: 30,
//                               color:
//                               currentTab == 1 ? Colors.red : Colors.grey[350],
//                             ),
//                           ],
//                         ),
//                       ),
//                       MaterialButton(
//                         minWidth: 40,
//                         onPressed: () {
//                           setState(() {
//                             Navigator.of(context).push(
//                                 MaterialPageRoute(builder: (_) => UpcomingAppointmentCalender()));
//                             //  currentScreen = SimpleMAp();
//                             currentTab = 2;
//                           });
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Image.asset(
//                               'assets/icons/icone-setting-15.png',
//                               height: 60,
//                               //color: currentTab ==  2? Colors.red : Colors.grey,
//                             ),
//                           ],
//                         ),
//                       ),
//                       MaterialButton(
//                         minWidth: 40,
//                         onPressed: () {
//                           setState(() {
//                             currentScreen = Messages();
//                             currentTab = 3;
//                           });
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Image.asset(
//                               'assets/images/message.png',
//                               height: 30,
//                               color:
//                               currentTab == 3 ? Colors.red : Colors.grey[350],
//                             ),
//                           ],
//                         ),
//                       ),
//                       MaterialButton(
//                         minWidth: 10,
//                         onPressed: () {
//                           setState(() {
//                             currentScreen = ProviderSetting();
//                             currentTab = 4;
//                           });
//                         },
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: <Widget>[
//                             Image.asset(
//                               'assets/icons/icone98.png',
//                               height: 30,
//                               color:
//                               currentTab == 4 ? Colors.red : Colors.grey[350],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   )),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
