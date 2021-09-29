import 'package:flutter/material.dart';

import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'package:maru/features/Home/presentation/pet_profile.dart';
import 'package:maru/features/Home/presentation/search_screen.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'package:maru/main.dart';

import 'message.dart';

class CreateHomeScreen extends StatefulWidget {

  @override
  _CreateHomeScreenState createState() => _CreateHomeScreenState();
}

class _CreateHomeScreenState extends State<CreateHomeScreen> {
  int currentTab = 0;
  final List<Widget> screens = [

    HomeScreen(),
    ProviderSearchScreen(),
    SimpleMAp(),
    PetProfile(),
    Messages(),
    ViewPetProfile()
    //   ArtistProfile()
  ]; // to store nested tabs
  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        notchMargin: 10,
        child: Container(
          height: 70,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Expanded(
                  child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = HomeScreen();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/icone-setting-10.png',
                          height: 30,
                          color:
                              currentTab == 0 ? Colors.red : Colors.grey[350],
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        currentScreen = ProviderSearchScreen();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/icone-setting-9.png',
                          height: 30,
                          color:
                              currentTab == 1 ? Colors.red : Colors.grey[350],
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (_) => PetProfile()));
                        //  currentScreen = SimpleMAp();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/icons/icone-setting-15.png',
                          height: 60,
                          //color: currentTab ==  2? Colors.red : Colors.grey,
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 40,
                    onPressed: () {
                      setState(() {
                          currentScreen = Messages();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/message.png',
                          height: 30,
                          color:
                              currentTab == 3 ? Colors.red : Colors.grey[350],
                        ),
                      ],
                    ),
                  ),
                  MaterialButton(
                    minWidth: 10,
                    onPressed: () {
                      setState(() {
                         currentScreen = ViewPetProfile();
                        currentTab = 4;
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Image.asset(
                          'assets/images/shop.png',
                          height: 30,
                          color:
                              currentTab == 4 ? Colors.red : Colors.grey[350],
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            ],
          ),
        ),
      ),
    );
  }
}
