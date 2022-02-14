import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'dart:io';
import 'package:firebase_core/firebase_core.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen1.dart';
import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen3.dart';
import 'package:maru/features/forgot/Domain/usecases/forget_password.dart';
import 'package:maru/features/login/presentation/bloc/bloc/login_event.dart'
    as event;
import 'package:geocoding/geocoding.dart';
import 'package:geolocation/geolocation.dart' as geolocation;
import 'package:geolocation/geolocation.dart';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:geolocator/geolocator.dart';
import 'package:kiwi/kiwi.dart';
import 'package:location/location.dart';
import 'package:maru/features/login/presentation/login_screen.dart';
import 'package:maru/features/provider_login/presentation/login_provider_screen.dart';
import 'package:maru/features/provider_profile/provider_profile1.dart';
import 'package:maru/features/splash/view/splash_screen.dart';
import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
import 'package:maru/features/verify/presentation/register_pet_profile4.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen2.dart';
import 'package:maru/features/verify/presentation/register_pet_profile_screen3.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:responsive_framework/responsive_wrapper.dart';
import 'package:responsive_framework/utils/scroll_behavior.dart';
import 'package:wifi_configuration_2/wifi_configuration_2.dart';

import 'core/theme/maaru_style.dart';
import 'core/utils.dart';
import 'features/Account_setting/presentation/bloc/edit_profile_screen.dart';
import 'features/Book_Appointment/presentation/booked_confirm.dart';
import 'features/Home/presentation/pet_profile.dart';
import 'features/Home/presentation/search_screen.dart';
import 'features/chat/domain/entity/mesage.dart';
import 'features/chat/presentation/chatt_screen.dart';
import 'features/forgot/presentation/forgot_screen.dart';
import 'features/login/presentation/bloc/bloc/login_bloc.dart';
import 'features/login/presentation/bloc/bloc/login_state.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

import 'features/provider_home/presentation/upcoming_appointment_calender.dart';
import 'features/provider_home/presentation/upcoming_appointment_screen.dart';
import 'features/provider_register/presentation/provider_register.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await registerDependencyInjection();
  await Firebase.initializeApp();
  // Socket socket = io('http://18.191.199.31:80', <String, dynamic> { 'transports':['websocket'],
  try {
    IO.Socket socket = IO.io('http://18.191.199.31:80', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': true,
    });

// Dart client
    socket.on('connect', (_) {
      print('ss${socket.id}');
    });
    socket.on('event', (data) => print(data));
    socket.on('disconnect', (_) => print('disconnect'));
    socket.on('fromServer', (_) => print(_));
  } catch (e) {
    print(e);
  }
  runApp(MyApp());
  Geolocation.loggingEnabled = true;

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
        // builder: (context, widget) => ResponsiveWrapper.builder(
        //         BouncingScrollWrapper.builder(context, widget),
        //         maxWidth: 1200,
        //         minWidth: 480,
        //         defaultScale: false,
        //         breakpoints: [
        //           const ResponsiveBreakpoint.resize(100, name: MOBILE),
        //         ]),
        debugShowCheckedModeBanner: false,
        checkerboardOffscreenLayers: true,
        title: 'Maaru',
        theme: theme,
        //todo: navigate to SplashScreen
//TODO:need to putup scrooll pagination vie
// w on the buttom (Provider search screen)

        home:   Scaffold(body: (Chat1())));
  }
}

class HomePage4 extends StatefulWidget {
  // const HomePage({Key? key}) : super(key: key);

  @override
  _HomePage4State createState() => _HomePage4State();
}

class _HomePage4State extends State<HomePage4> {
  var isMovedUp = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('AnimatedPositioned in Flutter')),
      body: Center(
        child: GestureDetector(
          onTap: () => setState(() => isMovedUp = !isMovedUp),
          child: Stack(
            clipBehavior: Clip.none,
            alignment: Alignment.center,
            children: [
              Image.network('https://bit.ly/2VcCSow'),
              const Text(
                'Summer 😎',
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.black,
                ),
              ),
              AnimatedPositioned(
                duration: Duration(seconds: 1),
                bottom: isMovedUp ? 140 : 10.0,
                curve: Curves.elasticInOut,
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: NetworkImage('https://bit.ly/3cXWD9j'),
                  backgroundColor: Colors.orange[300],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AnimatedElevationButton extends StatefulWidget {
  @override
  _AnimatedElevationButtonState createState() =>
      _AnimatedElevationButtonState();
}

class _AnimatedElevationButtonState extends State<AnimatedElevationButton>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  Animation<double> _animationTween;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: Duration(milliseconds: 30),
      vsync: this,
    );
    _animationTween =
        Tween(begin: 0.0, end: 20.0).animate(_animationController);
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      child: Material(
        color: Colors.red,
        borderRadius: BorderRadius.circular(8.0),
        elevation: _animationTween.value,
        child: Image.asset('assets/icons/icone-setting-52.png'),
      ),
    );
  }

  void _onTapDown(TapDownDetails details) {
    _animationController.forward();
  }

  void _onTapUp(TapUpDetails details) {
    _animationController.reverse();
  }
}

class HomePage6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Builder in Flutter'),
      ),
      body: Center(
        child: AnimatedElevationButton(),
      ),
    );
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

  String text = '';
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: height,
      width: width,
      child: Scaffold(
          resizeToAvoidBottomInset: false,
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
                      InkWell(
                        //TODO:HFHFFF NEED CHANGE
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (_) => BookAppointment1(id1: 4,)));
                        },
                        child: Row(
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
                                        color:
                                            MaaruColors.primaryColorsuggesion,
                                      ),
                                      Text('5')
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 50,
                                  )
                                ],
                              ),
                            ]),
                      ),
                    ]),
                  ),
                ]),
              ),
            ),
          ),
          key: _scaffoldKey,
          body: Stack(
              fit: StackFit.loose,
              alignment: AlignmentDirectional.topStart,
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
                Center(
                  child: BlocProvider(
                      create: (context) => KiwiContainer().resolve<LoginBloc>(),
                      child: BlocBuilder<LoginBloc, LoginState>(
                          builder: (context, state) {
                        if (state is LoginInitial) {
                          String text;
                          BlocProvider.of<LoginBloc>(context)
                              .add(event.GetProvider(text));
                          print('figffgfg${text}');
                          return CircularProgressIndicator();
                        } else if (state is ProviderLoaded1) {
                          // AnimatedElevationButton()),
                          return Column(children: <Widget>[
                            SafeArea(
                              child: Container(
                                alignment: Alignment.topLeft,
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
                                  padding: const EdgeInsets.only(
                                      top: 0.0, bottom: 10.0),
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
                                              startAddressController.text =
                                                  _currentAddress;
                                              _startAddress = _currentAddress;
                                              mapController.animateCamera(
                                                CameraUpdate.newCameraPosition(
                                                  CameraPosition(
                                                    target: LatLng(
                                                      _currentPosition.latitude,
                                                      _currentPosition
                                                          .longitude,
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

                                      const SizedBox(
                                        width: 10,
                                      ),
                                      InkWell(
                                          onTap: () => Navigator.of(context)
                                              .push(MaterialPageRoute(
                                                  builder: (_) =>
                                                      ProviderSearchScreen())),
                                          child: Image.asset(
                                            'assets/icons/scnd.png',
                                            height: 40,
                                          ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(10, 0, 10, 0),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                          onTap: () {
                                            setState(() {
                                              // BlocProvider.of<LoginBloc>(context)
                                              //     .add(event.GetProvider(text));
                                            });
                                          },
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                text = 'Grooming';
                                                BlocProvider.of<LoginBloc>(
                                                        context)
                                                    .add(event.GetProvider(
                                                        text));
                                              });
                                            },
                                            child: Item('Grooming'),
                                          )),
                                      Item('Walking'),
                                      Item('Hotel'),
                                      Item('Vet')
                                    ],
                                  )),
                            ),
                            const SizedBox(height: 10),
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(40, 0, 10, 0),
                                child: Stack(children: [
                                  ListView.builder(
                                    physics: const ScrollPhysics(),
                                      scrollDirection: Axis.vertical,
                                      shrinkWrap: true,
                                      itemCount: state.getProviderModel
                                          .providersListing.length,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return Container(
                                          height: 300,
                                          alignment: Alignment.bottomRight,
                                          padding: const EdgeInsets.fromLTRB(
                                              20, 180, 30, 10),
                                          child: Text(''),
                                          // Image.network(
                                          //  state.getProviderModel.providersListing[index].description.toString(),
                                          //  height: 60,
                                        );

                                        // RepeatContainer('assets/images/kutta.png',),
                                      })
                                ]))
                          ]);
                        } else {
                          return CircularProgressIndicator();
                        }
                        ;
                      })),
                ),
              ])),
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

class Secrets {
  // Add your Google Maps API Key here
  static const API_KEY = 'AIzaSyAcwOMoEO8-zDBVGzeGdPspSM3qJepJeUA';
}

class MapSample extends StatefulWidget {
  @override
  _MapSampleState createState() => _MapSampleState();
}

class _MapSampleState extends State<MapSample> {
  GoogleMapController _controller;
  static final LatLng myLocation = LatLng(30.748882, 76.641357);

  var icons;

  Set<Marker> markers = {};

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: myLocation,
    zoom: 15.4746,
  );

  Set<Marker> _createMarker(Position position) {
    return <Marker>[
      Marker(
          markerId: MarkerId("marker_1"),
          position: LatLng(position.latitude, position.longitude),
          icon: BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueOrange,
          )),
      //  Marker(
      //    markerId: MarkerId("marker_2"),
      //    icon: await getMarkerIcon("assets/users/DavidElks.png", Size(150.0, 150.0))
      //   )
    ].toSet();
  }

  // _createMarker(Position position){
  //   Marker(
  //       markerId: MarkerId("marker_1"),
  //       position: LatLng(position.latitude, position.longitude),
  //       icon: BitmapDescriptor.defaultMarkerWithHue(
  //         BitmapDescriptor.hueOrange,
  //       ));

  // }

  Future<BitmapDescriptor> getMarkerIcon(String imagePath, Size size) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Radius radius = Radius.circular(size.width / 2);

    final Paint tagPaint = Paint()..color = Colors.blue;
    final double tagWidth = 40.0;

    final Paint shadowPaint = Paint()..color = Colors.blue.withAlpha(100);
    final double shadowWidth = 15.0;

    final Paint borderPaint = Paint()..color = Colors.white;
    final double borderWidth = 3.0;

    final double imageOffset = shadowWidth + borderWidth;

    // Add shadow circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(0.0, 0.0, size.width, size.height),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        shadowPaint);

    // Add border circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(shadowWidth, shadowWidth,
              size.width - (shadowWidth * 2), size.height - (shadowWidth * 2)),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        borderPaint);

    // Add tag circle
    canvas.drawRRect(
        RRect.fromRectAndCorners(
          Rect.fromLTWH(size.width - tagWidth, 0.0, tagWidth, tagWidth),
          topLeft: radius,
          topRight: radius,
          bottomLeft: radius,
          bottomRight: radius,
        ),
        tagPaint);

    // Add tag text
    TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
    textPainter.text = TextSpan(
      text: '1',
      style: TextStyle(fontSize: 20.0, color: Colors.white),
    );

    textPainter.layout();
    textPainter.paint(
        canvas,
        Offset(size.width - tagWidth / 2 - textPainter.width / 2,
            tagWidth / 2 - textPainter.height / 2));

    // Oval for the image
    Rect oval = Rect.fromLTWH(imageOffset, imageOffset,
        size.width - (imageOffset * 2), size.height - (imageOffset * 2));

    // Add path for oval image
    canvas.clipPath(Path()..addOval(oval));

    // Add image
    ui.Image image = await getImageFromPath(
        imagePath); // Alternatively use your own method to get the image
    paintImage(canvas: canvas, image: image, rect: oval, fit: BoxFit.fitWidth);

    // Convert canvas to image
    final ui.Image markerAsImage = await pictureRecorder
        .endRecording()
        .toImage(size.width.toInt(), size.height.toInt());

    // Convert image to bytes
    final ByteData byteData =
        await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
    final Uint8List uint8List = byteData.buffer.asUint8List();

    return BitmapDescriptor.fromBytes(uint8List);
  }

  Future<ui.Image> getImageFromPath(String imagePath) async {
    File imageFile = File(imagePath);

    Uint8List imageBytes = imageFile.readAsBytesSync();

    final Completer<ui.Image> completer = new Completer();

    ui.decodeImageFromList(imageBytes, (ui.Image img) {
      return completer.complete(img);
    });

    return completer.future;
  }

  changeMapMode() {
    getJsonFile("assets/json/mapsdesign.json").then(setMapStyle);
  }

  Future<String> getJsonFile(String path) async {
    return await rootBundle.loadString(path);
  }

  void setMapStyle(String mapStyle) {
    _controller.setMapStyle(mapStyle);
  }

  Future<Position> getloc() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: geolocator.LocationAccuracy.high);
    print("position position position:$position");
    // context.read<HomeBloc>().add(UpdateUserLocation(position));

    return position;
  }

  @override
  void initState() {
    super.initState();
    // getIcons();
    addMarkers();
  }

  addMarkers() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: geolocator.LocationAccuracy.high);
    //  var icon = await getMarkerIcon("assets/users/DavidElks.png", Size(150.0, 150.0));
    BitmapDescriptor icon1 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/64/CrystalGaskell.png");
    BitmapDescriptor icon2 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/32/AlanPost.png");
    BitmapDescriptor icon3 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/32/AshleyJudd.png");
    BitmapDescriptor icon4 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/32/DavidElks.png");
    BitmapDescriptor icon5 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/32/RohitShah.png");
    BitmapDescriptor icon6 = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration.empty, "assets/32/WinnieLu.png");

    setState(() {
      markers.add(Marker(
          markerId: MarkerId("marker_1"),
          position: LatLng(position.latitude, position.longitude),
          icon: icon1));
      markers.add(Marker(
          markerId: MarkerId("marker_2"),
          position: LatLng(30.70698670093554, 76.70888880227865),
          icon: icon2));
      markers.add(Marker(
          markerId: MarkerId("marker_3"),
          position: LatLng(30.696376, 76.700028),
          icon: icon3));
      markers.add(Marker(
          markerId: MarkerId("marker_4"),
          position: LatLng(30.70244464316716, 76.69509738045028),
          icon: icon4));
      markers.add(Marker(
          markerId: MarkerId("marker_5"),
          position: LatLng(30.699736043070946, 76.69189672602559),
          icon: icon5));
      markers.add(Marker(
          markerId: MarkerId("marker_6"),
          position: LatLng(30.71041898120244, 76.69725050592257),
          icon: icon6));
    });
  }

  getIcons() async {
    var icon =
        await getMarkerIcon("assets/32/DavidElks.png", Size(150.0, 150.0));
    print(" icon  icon icon icon icon$icon");
    setState(() {
      icons = icon;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: getloc(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          Position position = snapshot.data;

          return BlocBuilder<PetProfileBloc, PetProfileState>(
            // buildWhen: (previous, current) => previous.status != current.status,
            builder: (context, state) {
              return GoogleMap(
                zoomControlsEnabled: false,
                mapType: MapType.normal,

                initialCameraPosition: CameraPosition(
                  target: LatLng(position.latitude, position.longitude),
                  zoom: 15.4746,
                ),
                //  _kGooglePlex,
                onMapCreated: (GoogleMapController controller) {
                  _controller = controller;
                  controller.setMapStyle(changeMapMode());
                },
                markers: markers,
                // _createMarker( position)
              );
              // FutureBuilder(
              //   future: _createMarker( position),

              //   builder: (context , snapshot){
              //     if (!snapshot.hasData) {
              //           return Center(child: Text("LOADING......"));
              //         }
              //     if(snapshot.hasError){
              //       return Center(child: Text(snapshot.error.toString()),);
              //     }
              //     var markers = snapshot.data.;
              //     print("markers  markers markers markers $markers");
              //     return GoogleMap(
              //       zoomControlsEnabled: false,
              //       mapType: MapType.normal,

              //       initialCameraPosition:CameraPosition(
              //         target: LatLng(position.latitude, position.longitude),
              //         zoom: 15.4746,
              //       ),
              //       //  _kGooglePlex,
              //       onMapCreated: (GoogleMapController controller) {
              //         _controller = controller;
              //         controller.setMapStyle(changeMapMode());
              //       },
              //       markers:markers
              //     );
              //   });
            },
          );
        });
  }

  _processing(Size size) {
    return Container(
      width: size.width,
      alignment: Alignment.center,
      child: CircularProgressIndicator(),
    );
  }
}

//  context.read<CreateAccountBloc>().add( SendOTP( createAccount));

// class SampleMap extends StatefulWidget {
//   @override
//   _SampleMapState createState() => _SampleMapState();
// }

// class _SampleMapState extends State<SampleMap> {
//   String latitude = 'waiting...';
//   String longitude = 'waiting...';
//   String altitude = 'waiting...';
//   String accuracy = 'waiting...';
//   String bearing = 'waiting...';
//   String speed = 'waiting...';
//   String time = 'waiting...';

//   @override
//   void initState() {
//     super.initState();
//     getloc();
//   }

//   Future<Position> getloc() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high);
//     print("position position position:$position");
//     return position;
//   }

//   Future<Location> getUpdateLocation() async {
//     Location upDatedLocation;
//     BackgroundLocation.getLocationUpdates((location) {
//       upDatedLocation = location;

//       setState(() {
//         latitude = location.latitude.toString();
//         longitude = location.longitude.toString();
//         accuracy = location.accuracy.toString();
//         altitude = location.altitude.toString();
//         bearing = location.bearing.toString();
//         speed = location.speed.toString();
//         time = DateTime.fromMillisecondsSinceEpoch(location.time.toInt())
//             .toString();
//       });
//       print('''\n
//         Latitude:  $latitude
//         Longitude: $longitude
//         Altitude: $altitude
//         Accuracy: $accuracy
//         Bearing:  $bearing
//         Speed: $speed
//         Time: $time
//       ''');
//     });
//     return upDatedLocation;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: getloc(),
//         builder: (context, snapshot) {
//           if (!snapshot.hasData) {
//             return Center(child: CircularProgressIndicator());
//           }
//           if (snapshot.hasError) {
//             return Text(snapshot.error.toString());
//           }
//           Position position = snapshot.data;
//           // Location position = snapshot.data;

//           return FlutterMap(
//             options: MapOptions(
//               onLongPress: (latlong) {
//                 print("onLongPress latlong$latlong");
//               },
//               onPositionChanged: (mapPosition, val) {},
//               onTap: (latlong) {
//                 print("onTap latlong$latlong");
//               },
//               // bounds: LatLngBounds(),
//               center: LatLng(position.latitude, position.longitude),
//               // LatLng(40.730610, -73.935242),
//               zoom: 15,
//             ),
//             layers: [
//               TileLayerOptions(
//                 urlTemplate:
//                     'https://api.mapbox.com/styles/v1/manjeetkmr18/ckowk5f3d0npf18k8gtuf67uk/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFuamVldGttcjE4IiwiYSI6ImNrb3drMWg1NjA1aGUyeHQ2YWh4ajMzdjQifQ.glxXpEgKk40ysepRU3_Ung',
//                 // 'https://api.mapbox.com/styles/v1/manjeetkmr18/ckowk5f3d0npf18k8gtuf67uk/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFuamVldGttcjE4IiwiYSI6ImNrb3drMWg1NjA1aGUyeHQ2YWh4ajMzdjQifQ.glxXpEgKk40ysepRU3_Ung',
//                 additionalOptions: {
//                   'accessToken':
//                       'pk.eyJ1IjoibWFuamVldGttcjE4IiwiYSI6ImNrb3drMWg1NjA1aGUyeHQ2YWh4ajMzdjQifQ.glxXpEgKk40ysepRU3_Ung',
//                   'id': 'mapbox.mapbox-streets-v8'
//                 },
//                 tileProvider: NonCachingNetworkTileProvider(),
//               ),
//               MarkerLayerOptions(
//                 markers: [
//                   Marker(
//                     width: 90.0,
//                     height: 90.0,
//                     point: LatLng(30.70698670093554, 76.70888880227865),
//                     // (40.732342, -73.935435),
//                     builder: (ctx) => BuildCustomMarker(
//                       userName: 'Alan Post',
//                       userImage: 'assets/users/AlanPost.png',
//                       size: 80,
//                       userSize: 40,
//                       color: MyTheme.primaryColor,
//                       onPressed: () {},
//                     ),
//                   ),
//                   Marker(
//                     width: 90.0,
//                     height: 90.0,
//                     point: LatLng(30.696376, 76.700028),
//                     // (40.732342, -73.935435),
//                     builder: (ctx) => BuildCustomMarker(
//                       userName: 'Ashley Judd',
//                       userImage: 'assets/users/AshleyJudd.png',
//                       size: 80,
//                       userSize: 40,
//                       color: MyTheme.primaryColor,
//                       onPressed: () {},
//                     ),
//                     // PeerCustomMarker(
//                     //       avatarRadius: 20,
//                     //       imageUrl: "assets/users/DavidElks.png",
//                     //       bgColor1: Color(0xffFFC938).withOpacity(0.7),
//                     //       bgColor2: MyTheme.primaryColor,

//                     //     )
//                   ),
//                   Marker(
//                     width: 90.0,
//                     height: 90.0,
//                     point: LatLng(30.70244464316716, 76.69509738045028),
//                     // (40.732342, -73.935435),
//                     builder: (ctx) => BuildCustomMarker(
//                       userName: 'David Elks',
//                       userImage: 'assets/users/DavidElks.png',
//                       size: 80,
//                       userSize: 40,
//                       color: MyTheme.primaryColor,
//                       onPressed: () {},
//                     ),
//                     // PeerCustomMarker(
//                     //       avatarRadius: 20,
//                     //       imageUrl: "assets/users/DavidElks.png",
//                     //       bgColor1: Color(0xffFFC938).withOpacity(0.7),
//                     //       bgColor2: MyTheme.primaryColor,

//                     //     )
//                   ),
//                   Marker(
//                     width: 90.0,
//                     height: 90.0,
//                     point: LatLng(30.699736043070946, 76.69189672602559),
//                     // (40.732342, -73.935435),
//                     builder: (ctx) => BuildCustomMarker(
//                       userName: 'Rohit Shah',
//                       userImage: 'assets/users/RohitShah.png',
//                       size: 80,
//                       userSize: 40,
//                       color: MyTheme.primaryColor,
//                       onPressed: () {},
//                     ),
//                   ),
//                   Marker(
//                     width: 90.0,
//                     height: 90.0,
//                     point: LatLng(30.71041898120244, 76.69725050592257),
//                     // (40.732342, -73.935435),
//                     builder: (ctx) => BuildCustomMarker(
//                       userName: 'Winnie Lu',
//                       userImage: 'assets/users/WinnieLu.png',
//                       size: 80,
//                       userSize: 40,
//                       color: MyTheme.primaryColor,
//                       onPressed: () {},
//                     ),
//                   ),
//                   Marker(
//                     width: 200.0,
//                     height: 200.0,
//                     point: LatLng(position.latitude, position.longitude),
//                     // 30.710992, 76.704537
//                     builder: (ctx) => RipplesAnimation(
//                       //  userName: 'Alice Woods',
//                       userImage: 'assets/users/CrystalGaskell.png',
//                       size: 100,
//                       userSize: 60,
//                       color: MyTheme.red400,
//                       onPressed: () {},
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         });
//   }
// }

class GoogleMapScreen extends StatefulWidget {
  @override
  _GoogleMapScreenState createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  GoogleMapController mapController;

  final LatLng _center = const LatLng(28.535517, 77.391029);
  //List<MarkerGenerator> marketGenerator = [];
  // List<MapMarker> mapMarkers = [];
  List<Marker> customMarkers = [];

  List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
    bitmaps.asMap().forEach((mid, bmp) {
      customMarkers.add(Marker(
        markerId: MarkerId("$mid"),
        //  position: locations[mid].coordinates,
        icon: BitmapDescriptor.fromBytes(bmp),
      ));
    });
  }

//   @override
//   void initState() {
//     super.initState();
//  /MarkerGenerator(markerWidgets(), (bitmaps) {
//       setState(() {
//         mapBitmapsToMarkers(bitmaps);
//       });
//     }).generate(context);
//   }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Marker Demo'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      body: Container(
        child: GoogleMap(
          onMapCreated: _onMapCreated,
          markers: customMarkers.toSet(),
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 10.0,
          ),
        ),
      ),
    );
  }

// List<Widget> markerWidgets() {
//   return locations.map((loc) => MapMarker(loc)).toList();
// }
}
