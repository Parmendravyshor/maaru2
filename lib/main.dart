
import 'dart:math';


import 'package:flutter/material.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geocoder/geocoder.dart';

import 'package:geocoding/geocoding.dart';
import 'package:geolocation/geolocation.dart' as geolocation;

import 'package:geolocation/geolocation.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:maru/features/Account_setting/presentation/account_setting.dart';
import 'package:maru/features/Account_setting/presentation/change_password_screen.dart';
import 'package:maru/features/Account_setting/presentation/payment_screen.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen1.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen3.dart';
import 'package:maru/features/Home/presentation/home_sceen.dart';
import 'package:maru/features/login/presentation/login_screen.dart';
import 'package:maru/features/provider_home/presentation/create_provider_home.dart';
import 'package:maru/features/provider_profile/provider_profile1.dart';
import 'package:maru/features/provider_profile/provider_profile2.dart';
import 'package:maru/features/splash/view/splash_screen.dart';
import 'package:maru/features/verify/presentation/register_pet_profile4.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen2.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen3.dart';
import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

import 'core/theme/maaru_style.dart';
import 'core/utils.dart';
import 'features/Account_setting/presentation/edit_profile_screen.dart';
import 'features/Home/presentation/chat_screen.dart';
import 'features/Home/presentation/search_screen.dart';
import 'features/faketest.dart';



void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencyInjection();
  runApp(MyApp());
  Geolocation.loggingEnabled = true;
  WidgetsFlutterBinding.ensureInitialized();
  // FlutterBackgroundService.initialize(onStart);
  // BackgroundFetch.registerHeadlessTask(callback);
}

final theme = ThemeData(
  textTheme: GoogleFonts.poppinsTextTheme(),
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
   Position _currentPosition;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Location"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_currentPosition != null)
              Text(
                  "LAT: ${_currentPosition.latitude}, LNG: ${_currentPosition.longitude}"),
            FlatButton(
              child: Text("Get location"),
              onPressed: () {
                _getCurrentLocation();
              },
            ),
          ],
        ),
      ),
    );
  }

  _getCurrentLocation() {
    Geolocator.getCurrentPosition(
            desiredAccuracy: geolocator.LocationAccuracy.best,
            forceAndroidLocationManager: true)
        .then((Position position) {
      setState(() {
        _currentPosition = position;
      });
    }).catchError((e) {
      print(e);
    });
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        // builder: (context, widget) => ResponsiveWrapper.builder(
        //     BouncingScrollWrapper.builder(context, widget),
        //     maxWidth: 1400,
        //     minWidth: 450,
        //     defaultScale: true,
        //     breakpoints: [
        //       ResponsiveBreakpoint.resize(450, name: MOBILE),
        //       ResponsiveBreakpoint.autoScale(800, name: TABLET),
        //       ResponsiveBreakpoint.resize(1000, name: DESKTOP),
        //     ],
        //     background: Container(color: Color(0xFFF5F5F5))),
        title: 'Maaru',
        theme: theme,
        //todo: navigate to SplashScreen
        home: Scaffold(body: ((maa()))));
  }
}

class MapView extends StatefulWidget {
  @override
  _MapViewState createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  CameraPosition _initialLocation = CameraPosition(target: LatLng(0.0, 0.0));
  GoogleMapController mapController;
  static final LatLng _center = const LatLng(45.521563, -122.677433);
  final Set<Marker> _markers = {};
  LatLng _currentMapPosition = _center;
  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_currentMapPosition.toString()),
        position: _currentMapPosition,
        infoWindow:
            InfoWindow(title: 'Nice Place', snippet: 'Welcome to Poland'),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  Position _currentPosition;
  String _currentAddress = '';

  final startAddressController = TextEditingController();
  final destinationAddressController = TextEditingController();

  final startAddressFocusNode = FocusNode();
  final desrinationAddressFocusNode = FocusNode();

  String _startAddress = '';
  String _destinationAddress = '';
   String _placeDistance;

  Set<Marker> markers = {};

   PolylinePoints polylinePoints;
  Map<PolylineId, Polyline> polylines = {};
  List<LatLng> polylineCoordinates = [];

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  Widget _textField({
    @required TextEditingController controller,
    @required FocusNode focusNode,
    @required String label,
    @required String hint,
    @required double width,
    // @required Icon prefixIcon,
    Widget suffixIcon,
    Widget prefixIcon,
    @required Function(String) locationCallback,
  }) {
    return Container(
      width: width * 0.8,
      child: TextField(
        onChanged: (value) {
          locationCallback(value);
        },
        controller: controller,
        focusNode: focusNode,
        decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: label,
          filled: true,
          fillColor: Colors.white,
          enabledBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40.0),
            ),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(40.0),
            ),
            borderSide: BorderSide(
              color: Colors.white,
              width: 2,
            ),
          ),
          contentPadding: const EdgeInsets.all(15),
          hintText: hint,
        ),
      ),
    );
  }

  // Method for retrieving the current location
  _getCurrentLocation() async {
    LocationData myLocation;
    await Geolocator.getCurrentPosition(
            desiredAccuracy: geolocator.LocationAccuracy.high)
        .then((
      Position position,
    ) async {
      setState(() {
        _currentPosition = position;
        //_currentAddress = _getAddress();
        print('CURRENT POS: $_currentPosition');
        mapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              target: LatLng(position.latitude, position.longitude),
              zoom: 18.0,
            ),
          ),
        );
      });

      await _getAddress();
    }).catchError((e) {
      print(e);
    });
    final coordinates = Coordinates(myLocation.latitude, myLocation.longitude);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
    print(
        ' ${first.locality}, ${first.adminArea},${first.subLocality}, ${first.subAdminArea},${first.addressLine}, ${first.featureName},${first.thoroughfare}, ${first.subThoroughfare}');
    return first;
  }

  // Method for retrieving the address
  _getAddress() async {
    try {
      List<Placemark> p = await placemarkFromCoordinates(
          _currentPosition.latitude, _currentPosition.longitude);

      Placemark place = p[0];

      setState(() {
        _currentAddress =
            "${place.name}, ${place.locality}, ${place.postalCode}, ${place.country}";
        startAddressController.text = _currentAddress;
        _startAddress = _currentAddress;
      });
    } catch (e) {
      print(e);
    }
  }

  // Method for calculating the distance between two places
  Future<bool> _calculateDistance() async {
    try {
      // Retrieving placers from addresses
      List startPlacemark = await locationFromAddress(_startAddress);
      List destinationPlacemark =
          await locationFromAddress(_destinationAddress);

      // Use the retrieved coordinates of the current position,
      // instead of the address if the start position is user's
      // current position, as it results in better accuracy.
      double startLatitude = _startAddress == _currentAddress
          ? _currentPosition.latitude
          : startPlacemark[0].latitude;

      double startLongitude = _startAddress == _currentAddress
          ? _currentPosition.longitude
          : startPlacemark[0].longitude;

      double destinationLatitude = destinationPlacemark[0].latitude;
      double destinationLongitude = destinationPlacemark[0].longitude;

      String startCoordinatesString = '($startLatitude, $startLongitude)';
      String destinationCoordinatesString =
          '($destinationLatitude, $destinationLongitude)';

      // Start Location Marker
      Marker startMarker = Marker(
        markerId: MarkerId(startCoordinatesString),
        position: LatLng(startLatitude, startLongitude),
        infoWindow: InfoWindow(
          title: 'Start $startCoordinatesString',
          snippet: _startAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Destination Location Marker
      Marker destinationMarker = Marker(
        markerId: MarkerId(destinationCoordinatesString),
        position: LatLng(destinationLatitude, destinationLongitude),
        infoWindow: InfoWindow(
          title: 'Destination $destinationCoordinatesString',
          snippet: _destinationAddress,
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      // Adding the markers to the list
      markers.add(startMarker);
      markers.add(destinationMarker);

      print(
        'START COORDINATES: ($startLatitude, $startLongitude)',
      );
      print(
        'DESTINATION COORDINATES: ($destinationLatitude, $destinationLongitude)',
      );

      // Calculating to check that the position relative
      // to the frame, and pan & zoom the camera accordingly.
      double miny = (startLatitude <= destinationLatitude)
          ? startLatitude
          : destinationLatitude;
      double minx = (startLongitude <= destinationLongitude)
          ? startLongitude
          : destinationLongitude;
      double maxy = (startLatitude <= destinationLatitude)
          ? destinationLatitude
          : startLatitude;
      double maxx = (startLongitude <= destinationLongitude)
          ? destinationLongitude
          : startLongitude;

      double southWestLatitude = miny;
      double southWestLongitude = minx;

      double northEastLatitude = maxy;
      double northEastLongitude = maxx;

      // Accommodate the two locations within the
      // camera view of the map
      mapController.animateCamera(
        CameraUpdate.newLatLngBounds(
          LatLngBounds(
            northeast: LatLng(northEastLatitude, northEastLongitude),
            southwest: LatLng(southWestLatitude, southWestLongitude),
          ),
          100.0,
        ),
      );
      //
      // Calculating the distance between the start and the end positions
      // with a straight path, without considering any route
      double distanceInMeters = await Geolocator.bearingBetween(
        startLatitude,
        startLongitude,
        destinationLatitude,
        destinationLongitude,
      );

      await _createPolylines(startLatitude, startLongitude, destinationLatitude,
          destinationLongitude);

      double totalDistance = 0.0;

      // Calculating the total distance by adding the distance
      // between small segments
      for (int i = 0; i < polylineCoordinates.length - 1; i++) {
        totalDistance += _coordinateDistance(
          polylineCoordinates[i].latitude,
          polylineCoordinates[i].longitude,
          polylineCoordinates[i + 1].latitude,
          polylineCoordinates[i + 1].longitude,
        );
      }

      setState(() {
        _placeDistance = totalDistance.toStringAsFixed(2);
        print('DISTANCE: $_placeDistance km');
      });

      return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  // Formula for calculating distance between two coordinates
  // https://stackoverflow.com/a/54138876/11910277
  double _coordinateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  // Create the polylines for showing the route between two places
  _createPolylines(
    double startLatitude,
    double startLongitude,
    double destinationLatitude,
    double destinationLongitude,
  ) async {
    polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      Secrets.API_KEY, // Google Maps API Key
      PointLatLng(startLatitude, startLongitude),
      PointLatLng(destinationLatitude, destinationLongitude),
      travelMode: TravelMode.transit,
    );

    if (result.points.isNotEmpty) {
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    PolylineId id = PolylineId('poly');
    Polyline polyline = Polyline(
      polylineId: id,
      color: Colors.red,
      points: polylineCoordinates,
      width: 3,
    );
    polylines[id] = polyline;
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Scaffold(
        floatingActionButton: Padding(
          padding: EdgeInsets.only(bottom: 20, left: 40),
          child: Container(
            decoration: BoxDecoration(
                color: MaaruColors.darkGrey2,
                border: Border.all(
                  color: MaaruColors.darkGrey2,
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            height: 140,
            child: Center(
              child: Column(children: [
                Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(top: 10),
                  child: Column(children: [
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>ProviderProfile1()));
                    },
                  child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 40,
                            child: Image.network(
                                'https://www.mockofun.com/wp-content/uploads/2019/12/circle-photo.jpg'),
                          ),
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Austin Pet Groomer',
                                  style: MaaruStyle.text.medium,
                                ),
                                const SizedBox(
                                  width: 30,
                                ),
                                Text(
                                  '781 Lufes Highway',
                                  style: MaaruStyle.text.greyDisable,
                                ),
                                Text('Austin, Texas 75483',
                                    style: MaaruStyle.text.greyDisable),
                              ]),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: MaaruColors.primaryColorsuggesion,
                                  ),
                                  Text('5')
                                ],
                              ),
                              const SizedBox(
                                height: 50,
                              )
                            ],
                          ),
                        ]),),
                  ]),
                ),
              ]),
            ),
          ),
        ),
        key: _scaffoldKey,
        body: Stack(
          children: <Widget>[
            // Map View
            GoogleMap(
              markers: Set<Marker>.from(markers),
              initialCameraPosition: _initialLocation,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              mapType: MapType.normal,
              zoomGesturesEnabled: true,
              zoomControlsEnabled: false,
              polylines: Set<Polyline>.of(polylines.values),
              onMapCreated: (GoogleMapController controller) {
                mapController = controller;
              },
            ),

            // Show zoom buttons
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    // ClipOval(
                    //   child: Material(
                    //     color: Colors.blue.shade100, // button color
                    //     child: InkWell(
                    //       splashColor: Colors.blue, // inkwell color
                    //       child: SizedBox(
                    //         width: 50,
                    //         height: 50,
                    //         child: Icon(Icons.add),
                    //       ),
                    //       onTap: () {
                    //         mapController.animateCamera(
                    //           CameraUpdate.zoomIn(),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // ),
                    // SizedBox(height: 20),
                    // ClipOval(
                    //   child: Material(
                    //     color: Colors.blue.shade100, // button color
                    //     child: InkWell(
                    //       splashColor: Colors.blue, // inkwell color
                    //       child: SizedBox(
                    //         width: 50,
                    //         height: 50,
                    //         child: Icon(Icons.remove),
                    //       ),
                    //       onTap: () {
                    //         mapController.animateCamera(
                    //           CameraUpdate.zoomOut(),
                    //         );
                    //       },
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
            // Show the place input fields & button for
            // showing the route
            SafeArea(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          20.0,
                        ),
                      ),
                    ),
                    //  width: width * 0.9,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          // ,  Text(
                          //     'Places',
                          //     style: TextStyle(fontSize: 20.0),
                          //   )
                          const SizedBox(height: 10),
                          _textField(
                              label: 'Start',
                              hint: 'Choose starting point',
                              suffixIcon: IconButton(
                                icon: const Icon(Icons.my_location),
                                onPressed: _getCurrentLocation,
                              ),
                              prefixIcon: IconButton(
                                icon: const Icon(Icons.search),
                                onPressed: () {
                                  startAddressController.text = _currentAddress;
                                  _startAddress = _currentAddress;
                                  mapController.animateCamera(
                                    CameraUpdate.newCameraPosition(
                                      CameraPosition(
                                        target: LatLng(
                                          _currentPosition.latitude,
                                          _currentPosition.longitude,
                                        ),
                                        zoom: 18.0,
                                      ),
                                    ),
                                  );
                                },
                              ),
                              controller: startAddressController,
                              focusNode: startAddressFocusNode,
                              width: width,
                              locationCallback: (String value) {
                                setState(() {
                                  _startAddress = value;
                                });
                              }),
                          // SizedBox(height: 10),
                          // _textField(
                          //     label: 'Destination',
                          //     hint: 'Choose destination',
                          //     prefixIcon: Icon(Icons.looks_two),
                          //     controller: destinationAddressController,
                          //     focusNode: desrinationAddressFocusNode,
                          //     width: width,
                          //     locationCallback: (String value) {
                          //       setState(() {
                          //         _destinationAddress = value;
                          //       });
                          //     }),
                          // SizedBox(height: 10),
                          // Visibility(
                          //   visible: _placeDistance == null ? false : true,
                          //   child: Text(
                          //     'DISTANCE: $_placeDistance km',
                          //     style: TextStyle(
                          //       fontSize: 16,
                          //       fontWeight: FontWeight.bold,
                          //     ),
                          //   ),
                          // ),
                          // SizedBox(height: 5),
                          // ElevatedButton(
                          //   onPressed: (_startAddress != '' &&
                          //       _destinationAddress != '')
                          //       ? () async {
                          //     startAddressFocusNode.unfocus();
                          //     desrinationAddressFocusNode.unfocus();
                          //     setState(() {
                          //       if (markers.isNotEmpty) markers.clear();
                          //       if (polylines.isNotEmpty)
                          //         polylines.clear();
                          //       if (polylineCoordinates.isNotEmpty)
                          //         polylineCoordinates.clear();
                          //       _placeDistance = null;
                          //     });
                          //
                          //     _calculateDistance().then((isCalculated) {
                          //       if (isCalculated) {
                          //         ScaffoldMessenger.of(context)
                          //             .showSnackBar(
                          //           SnackBar(
                          //             content: Text(
                          //                 'Distance Calculated Sucessfully'),
                          //           ),
                          //         );
                          //       } else {
                          //         ScaffoldMessenger.of(context)
                          //             .showSnackBar(
                          //           SnackBar(
                          //             content: Text(
                          //                 'Error Calculating Distance'),
                          //           ),
                          //         );
                          //       }
                          //     });
                          //   }
                          //       : null,
                          //   child: Padding(
                          //     padding: const EdgeInsets.all(8.0),
                          //     child: Text(
                          //       'Show Route'.toUpperCase(),
                          //       style: TextStyle(
                          //         color: Colors.white,
                          //         fontSize: 20.0,
                          //       ),
                          //     ),
                          //   ),
                          //   style: ElevatedButton.styleFrom(
                          //     primary: Colors.red,
                          //     shape: RoundedRectangleBorder(
                          //       borderRadius: BorderRadius.circular(20.0),
                          //     ),
                          //   ),
                          // ),
                          const SizedBox(
                            width: 10,
                          ),
                          InkWell(
                              onTap: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (_) => ProviderSearchScreen())),
                              child: Image.asset(
                                'assets/icons/scnd.png',
                                height: 40,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Show current location button
            // SafeArea(
            //   child: Align(
            //     alignment: Alignment.bottomRight,
            //     child: Padding(
            //       padding: const EdgeInsets.only(right: 10.0, bottom: 10.0),
            //       child: ClipOval(
            //         child: Material(
            //           color: Colors.orange.shade100, // button color
            //           child: InkWell(
            //             splashColor: Colors.orange, // inkwell color
            //             child: SizedBox(
            //               width: 56,
            //               height: 56,
            //               child: Icon(Icons.my_location),
            //             ),
            //             onTap: () {
            //
            //               mapController.animateCamera(
            //                 CameraUpdate.newCameraPosition(
            //                   CameraPosition(
            //
            //                     target: LatLng(
            //                       _currentPosition.latitude,
            //                       _currentPosition.longitude,
            //                     ),
            //                     zoom: 18.0,
            //                   ),
            //                 ),
            //               );
            //
            //             },
            //           ),
            //         ),
            //       ),
            //     ),
            //   ),
            // ),
            const SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(10, 130, 10, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Item('Grooming'),
                    Item('Walking'),
                    Item('Hotel'),
                    Item('Vet')
                  ],
                )),
            const SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.fromLTRB(40, 180, 10, 10),
                child: Image.asset(
                  'assets/icons/icone-setting-41.png',
                  height: 60,
                )),
            const SizedBox(height: 10),
            Container(
                height: 300,
                alignment: Alignment.bottomRight,
                padding: const EdgeInsets.fromLTRB(20, 180, 30, 10),
                child: Image.asset(
                  'assets/icons/icone-setting-42.png',
                  height: 60,
                )),
            const SizedBox(height: 10),
            Container(

                // height: 250,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.fromLTRB(40, 140, 50, 100),
                child: Image.asset(
                  'assets/icons/icone-setting-42.png',
                  height: 60,
                )),
            const SizedBox(height: 10),
            Container(
              // height: 250,
              alignment: Alignment.bottomCenter,
              padding: const EdgeInsets.fromLTRB(40, 100, 0, 180),
              child: Image.asset(
                'assets/icons/icone-setting-44.png',
                height: 60,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget Item(String text) {
    return Card(
        color: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(40.0))),
        child: Container(
          height: 30,
          width: 75,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.0),
          ),
          alignment: Alignment.center,
          child: Text(
            text,
            style: MaaruStyle.text.smallGreen,
          ),
        ));
  }
}

class MyApp1 extends StatefulWidget {
  @override
  _MyApp1State createState() => _MyApp1State();
}

class _MyApp1State extends State<MyApp1> {
  GoogleMapController mapController;
  static final LatLng _center = const LatLng(45.521563, -122.677433);
  final Set<Marker> _markers = {};
  LatLng _currentMapPosition = _center;

  void _onAddMarkerButtonPressed() {
    setState(() {
      _markers.add(Marker(
        markerId: MarkerId(_currentMapPosition.toString()),
        position: _currentMapPosition,
        infoWindow:
            InfoWindow(title: 'Nice Place', snippet: 'Welcome to Poland'),
        icon: BitmapDescriptor.defaultMarker,
      ));
    });
  }

  void _onCameraMove(CameraPosition position) {
    _currentMapPosition = position.target;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: <Widget>[
            GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _center,
                  zoom: 10.0,
                ),
                markers: _markers,
                onCameraMove: _onCameraMove),
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
                ))),
            Padding(
              padding: const EdgeInsets.all(14.0),
              child: Align(
                alignment: Alignment.topRight,
                child: FloatingActionButton(
                  onPressed: _onAddMarkerButtonPressed,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.map, size: 30.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PersonEntry {
  final String name;
  final String age;
  final String studyJob;

  PersonEntry(this.name, this.age, this.studyJob);
  @override
  String toString() {
    return 'Person: name= $name, age= $age, study job= $studyJob';
  }
}

class Slidabble extends StatefulWidget {
  @override
  _SlidabbleState createState() => _SlidabbleState();
}

class _SlidabbleState extends State<Slidabble> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: 20,
            itemBuilder: (context, index) {
              return Slidable(
                actionPane: SlidableDrawerActionPane(),
                actions: <Widget>[
                  IconSlideAction(
                    caption: 'Archive',
                    color: Colors.blue,
                    icon: Icons.archive,
                  ),
                  IconSlideAction(
                    caption: 'Share',
                    color: Colors.indigo,
                    icon: Icons.share,
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'More',
                    color: Colors.black45,
                    icon: Icons.more_horiz,
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                  ),
                ],
                child: Container(
                  child: Text('Item Data$index'),
                ),
              );
            }));
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
