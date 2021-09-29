

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen3.dart';

import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'core/theme/maaru_style.dart';

import 'features/Book_Appointment/presentation/book_appointment_screen1.dart';
import 'features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'features/view_pet_profile/presentation/view_pet_profile2.dart';
import 'features/view_pet_profile/presentation/view_pet_profile3.dart';

void main() {
  runApp(MyApp());
  //BackgroundFetch.registerHeadlessTask(backgroundFetchHeadlessTask);
}

final theme = ThemeData(

    textTheme: GoogleFonts.poppinsTextTheme(

    ),

);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maaru',
        theme: theme,
        //todo: navigate to SplashScreen
        home: Scaffold(body: BookAppointmentScreen3()));
  }
}

class SimpleMAp extends StatefulWidget {
  @override
  _SimpleMApState createState() => _SimpleMApState();
}

class _SimpleMApState extends State<SimpleMAp> {
  static final LatLng _kMapCenter =
      LatLng(19.018255973653343, 72.84793849278007);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
  LatLng latlong = null;
  CameraPosition _cameraPosition = CameraPosition(target: _kMapCenter);
  GoogleMapController _controller;

  Future onMapCreated(GoogleMapController controller) async {
    _controller = controller;
    String value = await DefaultAssetBundle.of(context)
        .loadString('assets/map_style.json');
    _controller.setMapStyle(value);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _cameraPosition = CameraPosition(target: LatLng(100, 100), zoom: 10.0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.green,
        body: Stack(children: [
          GoogleMap(
            initialCameraPosition: _kInitialPosition,
            onMapCreated: onMapCreated,
            myLocationEnabled: true,
            markers: _createMarker(),
          ),
          buildFloatingSearchBar(),
          SizedBox(
            height: 40,
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(10, 100, 10, 10),
              child: Expanded(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: MaaruColors.whiteColor,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Grooming',
                      style: MaaruStyle.text.mediumGreen,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Walking',
                      style: MaaruStyle.text.mediumGreen,
                    ),
                  ),
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Hotel',
                      style: MaaruStyle.text.mediumGreen,
                    ),
                  ),
                  Container(
                    height: 20,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    alignment: Alignment.center,
                    child: Text(
                      'Vet',
                      style: MaaruStyle.text.mediumGreen,
                    ),
                  ),
                ],
              )))
        ]));
  }

  Set<Marker> _createMarker() {
    return {
      // Marker(
      // markerId: MarkerId("marker_1"),
      // position: _kMapCenter,
      // infoWindow: InfoWindow(title: 'Marker 1'),
      // rotation: 90),
      Marker(
        markerId: MarkerId("marker_2"),
        position: LatLng(18.997962200185533, 72.8379758747611),
      ),
    };
  }

  Widget buildFloatingSearchBar() {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      //  width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.location_disabled_rounded),
            onPressed: () {
              setState(() {});
            },
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: Colors.white);
              }).toList(),
            ),
          ),
        );
      },
    );
  }
}
