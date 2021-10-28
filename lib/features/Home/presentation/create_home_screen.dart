import 'package:flutter/material.dart';
import 'package:maru/core/theme/maaru_style.dart';
import 'package:maru/features/Account_setting/presentation/account_setting.dart';

import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'package:maru/features/Home/presentation/pet_profile.dart';
import 'package:maru/features/Home/presentation/search_screen.dart';
import 'package:maru/features/login/presentation/login_screen.dart';
import 'package:maru/features/register/presentation/signup_screen.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'package:maru/main.dart';

import 'message.dart';

class CreateHomeScreen extends StatefulWidget {
  // final int selectedIndex;
  final Color;
  final Color1;
  final Color2;
  final Color3;
  final selectedIndex;
  const CreateHomeScreen(
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
  _CreateHomeScreenState createState() => _CreateHomeScreenState();
}

class _CreateHomeScreenState extends State<CreateHomeScreen> {
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
                    .push(MaterialPageRoute(builder: (_) => HomeScreen()));
              },
              child: Image.asset('assets/icons/icone-setting-10.png',
                  height: 30, color: widget.Color
                  //selectedIndex == 0
                  ///  ? MaaruColors.textButtonColor
                  // : Colors.grey[350],
                  ),
            ),
            title: Text('')),
        BottomNavigationBarItem(
            icon: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => ProviderSearchScreen()));
              },
              child: Image.asset('assets/icons/icone-setting-9.png',
                  height: 30, color: widget.Color1
                  //selectedIndex == 1
                  //   ? MaaruColors.textButtonColor
                  //  : Colors.grey[350],
                  ),
            ),
            title: Text('')),
        BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => PetProfile()));
                },
                child: Image.asset(
                  'assets/icons/icone-setting-15.png',
                  height: 60,
                )),
            title: Text('')),
        BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (_) => Messages()));
                },
                child: Image.asset(
                  'assets/icons/icone-setting-11.png',
                  height: 30,
                  color: widget.Color2
                  //selectedIndex == 3
                    //  ? MaaruColors.textButtonColor
                     // : Colors.grey[350],
                )),
            title: Text('')),
        BottomNavigationBarItem(
            icon: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AccountSettingScreen()));
                },
                child: Image.asset(
                  'assets/icons/icone98.png',
                  height: 30,
                  color: widget.Color3
                  //selectedIndex == 4
                    //  ? MaaruColors.textButtonColor
                     // : Colors.grey[350],
                )),
            title: Text('')),
      ],
      // currentIndex: selectedIndex,
      // onTap: (index) => setState(() => selectedIndex = index),
      //
    );
  }
}
// class CreateHomeScreen extends StatefulWidget {
//   @override
//   _CreateHomeScreenState createState() => _CreateHomeScreenState();
// }
//
// class _CreateHomeScreenState extends State<CreateHomeScreen> {
//   int currentTab = 0;
//   Widget currentScreen;
//   final List<Widget> screens = [
//     HomeScreen(),
//     ProviderSearchScreen(),
//     SimpleMAp(),
//     PetProfile(),
//     Messages(),
//     ViewPetProfile()
//     //   ArtistProfile()
//   ]; // to store nested tabs
//   final PageStorageBucket bucket = PageStorageBucket();
//
//   //= HomeScreen();
//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       children: [
//         Scaffold(
//           backgroundColor: Colors.white,
//           body: PageStorage(
//             child: currentScreen,
//             bucket: bucket,
//           ),
//           bottomNavigationBar: BottomAppBar(
//             color: Colors.white,
//             shape: CircularNotchedRectangle(),
//             notchMargin: 10,
//             child: Container(
//               height: 70,
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: <Widget>[
//                   Expanded(
//                       child: Row(
//                         //   crossAxisAlignment: CrossAxisAlignment,
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: <Widget>[
//                           MaterialButton(
//                             minWidth: 40,
//                             onPressed: () {
//                               setState(() {
//                                 currentScreen = HomeScreen();
//                                 currentTab = 0;
//                               });
//                             },
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Image.asset(
//                                   'assets/icons/icone-setting-10.png',
//                                   height: 30,
//                                   color: currentTab == 0
//                                       ? Colors.red
//                                       : Colors.grey[350],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           MaterialButton(
//                             minWidth: 40,
//                             onPressed: () {
//                               setState(() {
//                                 currentScreen = ProviderSearchScreen();
//                                 currentTab = 1;
//                               });
//                             },
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Image.asset(
//                                   'assets/icons/icone-setting-9.png',
//                                   height: 30,
//                                   color: currentTab == 1
//                                       ? Colors.red
//                                       : Colors.grey[350],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           MaterialButton(
//                             minWidth: 40,
//                             onPressed: () {
//                               setState(() {
//                                 Navigator.of(context).push(MaterialPageRoute(
//                                     builder: (_) => PetProfile()));
//                                 //  currentScreen = SimpleMAp();
//                                 currentTab = 2;
//                               });
//                             },
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Image.asset(
//                                   'assets/icons/icone-setting-15.png',
//                                   height: 60,
//                                   //color: currentTab ==  2? Colors.red : Colors.grey,
//                                 ),
//                               ],
//                             ),
//                           ),
//                           MaterialButton(
//                             minWidth: 40,
//                             onPressed: () {
//                               setState(() {
//                                 currentScreen = Messages();
//                                 currentTab = 3;
//                               });
//                             },
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Image.asset(
//                                   'assets/images/message.png',
//                                   height: 30,
//                                   color: currentTab == 3
//                                       ? Colors.red
//                                       : Colors.grey[350],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           MaterialButton(
//                             minWidth: 10,
//                             onPressed: () {
//                               setState(() {
//                                 currentScreen = ViewPetProfile();
//                                 currentTab = 4;
//                               });
//                             },
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: <Widget>[
//                                 Image.asset(
//                                   'assets/images/shop.png',
//                                   height: 30,
//                                   color: currentTab == 4
//                                       ? Colors.red
//                                       : Colors.grey[350],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       )),
//                 ],
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }
//
// class HomePage1 extends StatefulWidget {
//   @override
//   State<HomePage1> createState() => _HomePage1State();
// }
//
// class _HomePage1State extends State<HomePage1> {
//   int index = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: index,
//         onTap: (int index) {
//           setState(() {
//             this.index = index;
//           });
//         },
//         iconSize: 40,
//         items: <BottomNavigationBarItem>[
//           new BottomNavigationBarItem(
//             icon: new Icon(Icons.home),
//             title: new Text(""),
//           ),
//           new BottomNavigationBarItem(
//             icon: SizedBox(
//                 height: 40,
//                 width: 40,
//                 child: ImageIcon(
//                   AssetImage(
//                     'assets/icons/icone-setting-1.png',
//                   ),
//                 )),
//             title: new Text(""),
//           ),
//         ],
//       ),
//       body: Navigator(
//         onGenerateRoute: (settings) {
//           Widget page = LoginScreen();
//           Widget page1 = RegisterScreen();
//           if (settings.name == 'page2') page = RegisterScreen();
//           return MaterialPageRoute(builder: (_) => page);
//         },
//       ),
//     );
//   }
// }
//
// class HomePage2 extends StatefulWidget {
//   @override
//   HomePage2State createState() => HomePage2State();
// }
//
// class HomePage2State extends State<HomePage2> {
//   final widgetOptions = [
//     HomeScreen(),
//     ProviderSearchScreen(),
//     SimpleMAp(),
//     PetProfile(),
//     Messages(),
//     ViewPetProfile()
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: GestureDetector(
//               onTap: () {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => LoginScreen()));
//               },
//               child: Text('Beer App')),
//         ),
//         body: Center(
//           child: GestureDetector(
//               onTap: () {
//                 Navigator.of(context).push(
//                     MaterialPageRoute(builder: (context) => RegisterScreen()));
//               },
//               child: widgetOptions.elementAt(0)),
//         ),
//         bottomNavigationBar: Navigation(selectedIndex: 1));
//   }
// }
