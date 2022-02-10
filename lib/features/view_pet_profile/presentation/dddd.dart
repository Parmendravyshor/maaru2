// import 'dart:math';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_polyline_points/flutter_polyline_points.dart';
// import 'package:flutter_slidable/flutter_slidable.dart';
// import 'package:geocoder/geocoder.dart';
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'package:geolocator/geolocator.dart';
// // import 'package:flutter_map/flutter_map.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import 'dart:async';
// import 'dart:ui' as ui;
// import 'dart:typed_data';
// import 'dart:io';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:maru/features/login/presentation/bloc/bloc/login_bloc.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:maru/features/login/presentation/bloc/bloc/login_event.dart'
// as event;
// import 'package:geocoding/geocoding.dart';
// import 'package:geolocation/geolocation.dart' as geolocation;
//
// import 'package:geolocation/geolocation.dart';
// import 'package:geolocator/geolocator.dart' as geolocator;
// import 'package:geolocator/geolocator.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:geolocator/geolocator.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:kiwi/kiwi.dart';
//
// import 'package:location/location.dart';
// import 'package:maru/features/Account_setting/presentation/account_setting.dart';
// import 'package:maru/features/Account_setting/presentation/change_password_screen.dart';
// import 'package:maru/features/Account_setting/presentation/payment_screen.dart';
// import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen1.dart';
// import 'package:maru/features/Book_Appointment/presentation/book_appointment_screen3.dart';
// import 'package:maru/features/Home/presentation/create_home_screen.dart';
// import 'package:maru/features/Home/presentation/home_sceen.dart';
// import 'package:maru/features/chat/domain/entity/mesage.dart';
// import 'package:maru/features/login/presentation/bloc/bloc/login_state.dart';
// import 'package:maru/features/login/presentation/login_screen.dart';
//
// import 'package:maru/features/provider_profile/provider_profile1.dart';
// import 'package:maru/features/provider_profile/provider_profile2.dart';
// import 'package:maru/features/splash/verify_screen.dart';
// import 'package:maru/features/splash/view/splash_screen.dart';
// import 'package:maru/features/verify/presentation/pet_profile_bloc.dart';
// import 'package:maru/features/verify/presentation/register_pet_profile4.dart';
// import 'package:maru/features/verify/presentation/register_pet_profile_screen1.dart';
// import 'package:maru/features/verify/presentation/register_pet_profile_screen2.dart';
// import 'package:maru/features/verify/presentation/register_pet_profile_screen3.dart';
// import 'package:maru/features/view_pet_profile/presentation/view_pet_profile1.dart';
// import 'package:material_floating_search_bar/material_floating_search_bar.dart';
//
//
// class MapSample extends StatefulWidget {
//   @override
//   _MapSampleState createState() => _MapSampleState();
// }
//
// class _MapSampleState extends State<MapSample> {
//   GoogleMapController _controller;
//   static final LatLng myLocation = LatLng(30.748882, 76.641357);
//
//   var icons;
//
//   Set<Marker> markers = {};
//
//   static final CameraPosition _kGooglePlex = CameraPosition(
//     target: myLocation,
//     zoom: 15.4746,
//   );
//
//   Set<Marker> _createMarker(Position position) {
//     return <Marker>[
//       Marker(
//           markerId: MarkerId("marker_1"),
//           position: LatLng(position.latitude, position.longitude),
//           icon: BitmapDescriptor.defaultMarkerWithHue(
//             BitmapDescriptor.hueOrange,
//           )),
//       //  Marker(
//       //    markerId: MarkerId("marker_2"),
//       //    icon: await getMarkerIcon("assets/users/DavidElks.png", Size(150.0, 150.0))
//       //   )
//     ].toSet();
//   }
//
//   // _createMarker(Position position){
//   //   Marker(
//   //       markerId: MarkerId("marker_1"),
//   //       position: LatLng(position.latitude, position.longitude),
//   //       icon: BitmapDescriptor.defaultMarkerWithHue(
//   //         BitmapDescriptor.hueOrange,
//   //       ));
//
//   // }
//
//   Future<BitmapDescriptor> getMarkerIcon(String imagePath, Size size) async {
//     final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
//     final Canvas canvas = Canvas(pictureRecorder);
//
//     final Radius radius = Radius.circular(size.width / 2);
//
//     final Paint tagPaint = Paint()..color = Colors.blue;
//     final double tagWidth = 40.0;
//
//     final Paint shadowPaint = Paint()..color = Colors.blue.withAlpha(100);
//     final double shadowWidth = 15.0;
//
//     final Paint borderPaint = Paint()..color = Colors.white;
//     final double borderWidth = 3.0;
//
//     final double imageOffset = shadowWidth + borderWidth;
//
//     // Add shadow circle
//     canvas.drawRRect(
//         RRect.fromRectAndCorners(
//           Rect.fromLTWH(0.0, 0.0, size.width, size.height),
//           topLeft: radius,
//           topRight: radius,
//           bottomLeft: radius,
//           bottomRight: radius,
//         ),
//         shadowPaint);
//
//     // Add border circle
//     canvas.drawRRect(
//         RRect.fromRectAndCorners(
//           Rect.fromLTWH(shadowWidth, shadowWidth,
//               size.width - (shadowWidth * 2), size.height - (shadowWidth * 2)),
//           topLeft: radius,
//           topRight: radius,
//           bottomLeft: radius,
//           bottomRight: radius,
//         ),
//         borderPaint);
//
//     // Add tag circle
//     canvas.drawRRect(
//         RRect.fromRectAndCorners(
//           Rect.fromLTWH(size.width - tagWidth, 0.0, tagWidth, tagWidth),
//           topLeft: radius,
//           topRight: radius,
//           bottomLeft: radius,
//           bottomRight: radius,
//         ),
//         tagPaint);
//
//     // Add tag text
//     TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
//     textPainter.text = TextSpan(
//       text: '1',
//       style: TextStyle(fontSize: 20.0, color: Colors.white),
//     );
//
//     textPainter.layout();
//     textPainter.paint(
//         canvas,
//         Offset(size.width - tagWidth / 2 - textPainter.width / 2,
//             tagWidth / 2 - textPainter.height / 2));
//
//     // Oval for the image
//     Rect oval = Rect.fromLTWH(imageOffset, imageOffset,
//         size.width - (imageOffset * 2), size.height - (imageOffset * 2));
//
//     // Add path for oval image
//     canvas.clipPath(Path()..addOval(oval));
//
//     // Add image
//     ui.Image image = await getImageFromPath(
//         imagePath); // Alternatively use your own method to get the image
//     paintImage(canvas: canvas, image: image, rect: oval, fit: BoxFit.fitWidth);
//
//     // Convert canvas to image
//     final ui.Image markerAsImage = await pictureRecorder
//         .endRecording()
//         .toImage(size.width.toInt(), size.height.toInt());
//
//     // Convert image to bytes
//     final ByteData byteData =
//     await markerAsImage.toByteData(format: ui.ImageByteFormat.png);
//     final Uint8List uint8List = byteData.buffer.asUint8List();
//
//     return BitmapDescriptor.fromBytes(uint8List);
//   }
//
//   Future<ui.Image> getImageFromPath(String imagePath) async {
//     File imageFile = File(imagePath);
//
//     Uint8List imageBytes = imageFile.readAsBytesSync();
//
//     final Completer<ui.Image> completer = new Completer();
//
//     ui.decodeImageFromList(imageBytes, (ui.Image img) {
//       return completer.complete(img);
//     });
//
//     return completer.future;
//   }
//
//   changeMapMode() {
//     getJsonFile("assets/json/mapsdesign.json").then(setMapStyle);
//   }
//
//   Future<String> getJsonFile(String path) async {
//     return await rootBundle.loadString(path);
//   }
//
//   void setMapStyle(String mapStyle) {
//     _controller.setMapStyle(mapStyle);
//   }
//
//   Future<Position> getloc() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: geolocator.LocationAccuracy.high);
//     print("position position position:$position");
//     // context.read<HomeBloc>().add(UpdateUserLocation(position));
//
//     return position;
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     // getIcons();
//     addMarkers();
//   }
//
//   addMarkers() async {
//     Position position = await Geolocator.getCurrentPosition(
//         desiredAccuracy:geolocator. LocationAccuracy.high);
//     //  var icon = await getMarkerIcon("assets/users/DavidElks.png", Size(150.0, 150.0));
//     BitmapDescriptor icon1 = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration.empty, "assets/64/CrystalGaskell.png");
//     BitmapDescriptor icon2 = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration.empty, "assets/32/AlanPost.png");
//     BitmapDescriptor icon3 = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration.empty, "assets/32/AshleyJudd.png");
//     BitmapDescriptor icon4 = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration.empty, "assets/32/DavidElks.png");
//     BitmapDescriptor icon5 = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration.empty, "assets/32/RohitShah.png");
//     BitmapDescriptor icon6 = await BitmapDescriptor.fromAssetImage(
//         ImageConfiguration.empty, "assets/32/WinnieLu.png");
//
//     setState(() {
//       markers.add(Marker(
//           markerId: MarkerId("marker_1"),
//           position: LatLng(position.latitude, position.longitude),
//           icon: icon1));
//       markers.add(Marker(
//           markerId: MarkerId("marker_2"),
//           position: LatLng(30.70698670093554, 76.70888880227865),
//           icon: icon2));
//       markers.add(Marker(
//           markerId: MarkerId("marker_3"),
//           position: LatLng(30.696376, 76.700028),
//           icon: icon3));
//       markers.add(Marker(
//           markerId: MarkerId("marker_4"),
//           position: LatLng(30.70244464316716, 76.69509738045028),
//           icon: icon4));
//       markers.add(Marker(
//           markerId: MarkerId("marker_5"),
//           position: LatLng(30.699736043070946, 76.69189672602559),
//           icon: icon5));
//       markers.add(Marker(
//           markerId: MarkerId("marker_6"),
//           position: LatLng(30.71041898120244, 76.69725050592257),
//           icon: icon6));
//     });
//   }
//
//   getIcons() async {
//     var icon =
//     await getMarkerIcon("assets/32/DavidElks.png", Size(150.0, 150.0));
//     print(" icon  icon icon icon icon$icon");
//     setState(() {
//       icons = icon;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     return BlocProvider(
//         create: (context) => KiwiContainer().resolve<LoginBloc>(),
//         child: BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
//       if (state is ProviderLoaded1) {
//         SchedulerBinding.instance.addPostFrameCallback((_) {
//           Navigator.pushReplacement(context,
//               MaterialPageRoute(builder: (BuildContext context)
//           {
//             return
//               GoogleMap(
//                 zoomControlsEnabled: false,
//                 mapType: MapType.normal,
//
//                 initialCameraPosition: CameraPosition(
//                     target:
//                   //  LatLng(position.latitude, position.longitude),
//                   //  zoom: 15.4746,
//                 ),
//                 //  _kGooglePlex,
//                 onMapCreated: (GoogleMapController controller) {
//                   _controller = controller;
//                   controller.setMapStyle(changeMapMode());
//                 },
//                 markers: markers,
//                 // _createMarker( position)
//               );
//           }
//           else {
//           return CircularProgressIndicator();
//           }
//           ;
//         });}}),
//     );}
//     }
//   // FutureBuilder(
//               //   future: _createMarker( position),
//
//               //   builder: (context , snapshot){
//               //     if (!snapshot.hasData) {
//               //           return Center(child: Text("LOADING......"));
//               //         }
//               //     if(snapshot.hasError){
//               //       return Center(child: Text(snapshot.error.toString()),);
//               //     }
//               //     var markers = snapshot.data.;
//               //     print("markers  markers markers markers $markers");
//               //     return GoogleMap(
//               //       zoomControlsEnabled: false,
//               //       mapType: MapType.normal,
//
//               //       initialCameraPosition:CameraPosition(
//               //         target: LatLng(position.latitude, position.longitude),
//               //         zoom: 15.4746,
//               //       ),
//               //       //  _kGooglePlex,
//               //       onMapCreated: (GoogleMapController controller) {
//               //         _controller = controller;
//               //         controller.setMapStyle(changeMapMode());
//               //       },
//               //       markers:markers
//               //     );
//               //   });
//
//
//
// //  context.read<CreateAccountBloc>().add( SendOTP( createAccount));
//
// // class SampleMap extends StatefulWidget {
// //   @override
// //   _SampleMapState createState() => _SampleMapState();
// // }
//
// // class _SampleMapState extends State<SampleMap> {
// //   String latitude = 'waiting...';
// //   String longitude = 'waiting...';
// //   String altitude = 'waiting...';
// //   String accuracy = 'waiting...';
// //   String bearing = 'waiting...';
// //   String speed = 'waiting...';
// //   String time = 'waiting...';
//
// //   @override
// //   void initState() {
// //     super.initState();
// //     getloc();
// //   }
//
// //   Future<Position> getloc() async {
// //     Position position = await Geolocator.getCurrentPosition(
// //         desiredAccuracy: LocationAccuracy.high);
// //     print("position position position:$position");
// //     return position;
// //   }
//
// //   Future<Location> getUpdateLocation() async {
// //     Location upDatedLocation;
// //     BackgroundLocation.getLocationUpdates((location) {
// //       upDatedLocation = location;
//
// //       setState(() {
// //         latitude = location.latitude.toString();
// //         longitude = location.longitude.toString();
// //         accuracy = location.accuracy.toString();
// //         altitude = location.altitude.toString();
// //         bearing = location.bearing.toString();
// //         speed = location.speed.toString();
// //         time = DateTime.fromMillisecondsSinceEpoch(location.time.toInt())
// //             .toString();
// //       });
// //       print('''\n
// //         Latitude:  $latitude
// //         Longitude: $longitude
// //         Altitude: $altitude
// //         Accuracy: $accuracy
// //         Bearing:  $bearing
// //         Speed: $speed
// //         Time: $time
// //       ''');
// //     });
// //     return upDatedLocation;
// //   }
//
// //   @override
// //   Widget build(BuildContext context) {
// //     return FutureBuilder(
// //         future: getloc(),
// //         builder: (context, snapshot) {
// //           if (!snapshot.hasData) {
// //             return Center(child: CircularProgressIndicator());
// //           }
// //           if (snapshot.hasError) {
// //             return Text(snapshot.error.toString());
// //           }
// //           Position position = snapshot.data;
// //           // Location position = snapshot.data;
//
// //           return FlutterMap(
// //             options: MapOptions(
// //               onLongPress: (latlong) {
// //                 print("onLongPress latlong$latlong");
// //               },
// //               onPositionChanged: (mapPosition, val) {},
// //               onTap: (latlong) {
// //                 print("onTap latlong$latlong");
// //               },
// //               // bounds: LatLngBounds(),
// //               center: LatLng(position.latitude, position.longitude),
// //               // LatLng(40.730610, -73.935242),
// //               zoom: 15,
// //             ),
// //             layers: [
// //               TileLayerOptions(
// //                 urlTemplate:
// //                     'https://api.mapbox.com/styles/v1/manjeetkmr18/ckowk5f3d0npf18k8gtuf67uk/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFuamVldGttcjE4IiwiYSI6ImNrb3drMWg1NjA1aGUyeHQ2YWh4ajMzdjQifQ.glxXpEgKk40ysepRU3_Ung',
// //                 // 'https://api.mapbox.com/styles/v1/manjeetkmr18/ckowk5f3d0npf18k8gtuf67uk/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoibWFuamVldGttcjE4IiwiYSI6ImNrb3drMWg1NjA1aGUyeHQ2YWh4ajMzdjQifQ.glxXpEgKk40ysepRU3_Ung',
// //                 additionalOptions: {
// //                   'accessToken':
// //                       'pk.eyJ1IjoibWFuamVldGttcjE4IiwiYSI6ImNrb3drMWg1NjA1aGUyeHQ2YWh4ajMzdjQifQ.glxXpEgKk40ysepRU3_Ung',
// //                   'id': 'mapbox.mapbox-streets-v8'
// //                 },
// //                 tileProvider: NonCachingNetworkTileProvider(),
// //               ),
// //               MarkerLayerOptions(
// //                 markers: [
// //                   Marker(
// //                     width: 90.0,
// //                     height: 90.0,
// //                     point: LatLng(30.70698670093554, 76.70888880227865),
// //                     // (40.732342, -73.935435),
// //                     builder: (ctx) => BuildCustomMarker(
// //                       userName: 'Alan Post',
// //                       userImage: 'assets/users/AlanPost.png',
// //                       size: 80,
// //                       userSize: 40,
// //                       color: MyTheme.primaryColor,
// //                       onPressed: () {},
// //                     ),
// //                   ),
// //                   Marker(
// //                     width: 90.0,
// //                     height: 90.0,
// //                     point: LatLng(30.696376, 76.700028),
// //                     // (40.732342, -73.935435),
// //                     builder: (ctx) => BuildCustomMarker(
// //                       userName: 'Ashley Judd',
// //                       userImage: 'assets/users/AshleyJudd.png',
// //                       size: 80,
// //                       userSize: 40,
// //                       color: MyTheme.primaryColor,
// //                       onPressed: () {},
// //                     ),
// //                     // PeerCustomMarker(
// //                     //       avatarRadius: 20,
// //                     //       imageUrl: "assets/users/DavidElks.png",
// //                     //       bgColor1: Color(0xffFFC938).withOpacity(0.7),
// //                     //       bgColor2: MyTheme.primaryColor,
//
// //                     //     )
// //                   ),
// //                   Marker(
// //                     width: 90.0,
// //                     height: 90.0,
// //                     point: LatLng(30.70244464316716, 76.69509738045028),
// //                     // (40.732342, -73.935435),
// //                     builder: (ctx) => BuildCustomMarker(
// //                       userName: 'David Elks',
// //                       userImage: 'assets/users/DavidElks.png',
// //                       size: 80,
// //                       userSize: 40,
// //                       color: MyTheme.primaryColor,
// //                       onPressed: () {},
// //                     ),
// //                     // PeerCustomMarker(
// //                     //       avatarRadius: 20,
// //                     //       imageUrl: "assets/users/DavidElks.png",
// //                     //       bgColor1: Color(0xffFFC938).withOpacity(0.7),
// //                     //       bgColor2: MyTheme.primaryColor,
//
// //                     //     )
// //                   ),
// //                   Marker(
// //                     width: 90.0,
// //                     height: 90.0,
// //                     point: LatLng(30.699736043070946, 76.69189672602559),
// //                     // (40.732342, -73.935435),
// //                     builder: (ctx) => BuildCustomMarker(
// //                       userName: 'Rohit Shah',
// //                       userImage: 'assets/users/RohitShah.png',
// //                       size: 80,
// //                       userSize: 40,
// //                       color: MyTheme.primaryColor,
// //                       onPressed: () {},
// //                     ),
// //                   ),
// //                   Marker(
// //                     width: 90.0,
// //                     height: 90.0,
// //                     point: LatLng(30.71041898120244, 76.69725050592257),
// //                     // (40.732342, -73.935435),
// //                     builder: (ctx) => BuildCustomMarker(
// //                       userName: 'Winnie Lu',
// //                       userImage: 'assets/users/WinnieLu.png',
// //                       size: 80,
// //                       userSize: 40,
// //                       color: MyTheme.primaryColor,
// //                       onPressed: () {},
// //                     ),
// //                   ),
// //                   Marker(
// //                     width: 200.0,
// //                     height: 200.0,
// //                     point: LatLng(position.latitude, position.longitude),
// //                     // 30.710992, 76.704537
// //                     builder: (ctx) => RipplesAnimation(
// //                       //  userName: 'Alice Woods',
// //                       userImage: 'assets/users/CrystalGaskell.png',
// //                       size: 100,
// //                       userSize: 60,
// //                       color: MyTheme.red400,
// //                       onPressed: () {},
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ],
// //           );
// //         });
// //   }
// // }
//
// class GoogleMapScreen extends StatefulWidget {
//   @override
//   _GoogleMapScreenState createState() => _GoogleMapScreenState();
// }
//
// class _GoogleMapScreenState extends State<GoogleMapScreen> {
//   GoogleMapController mapController;
//
//   final LatLng _center = const LatLng(28.535517, 77.391029);
//   //List<MarkerGenerator> marketGenerator = [];
//   // List<MapMarker> mapMarkers = [];
//   List<Marker> customMarkers = [];
//
//   List<Marker> mapBitmapsToMarkers(List<Uint8List> bitmaps) {
//     bitmaps.asMap().forEach((mid, bmp) {
//       customMarkers.add(Marker(
//         markerId: MarkerId("$mid"),
//         //  position: locations[mid].coordinates,
//         icon: BitmapDescriptor.fromBytes(bmp),
//       ));
//     });
//   }
//
// //   @override
// //   void initState() {
// //     super.initState();
// //  /MarkerGenerator(markerWidgets(), (bitmaps) {
// //       setState(() {
// //         mapBitmapsToMarkers(bitmaps);
// //       });
// //     }).generate(context);
// //   }
//
//   void _onMapCreated(GoogleMapController controller) {
//     mapController = controller;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Custom Marker Demo'),
//         backgroundColor: Colors.blue,
//         centerTitle: true,
//       ),
//       body: Container(
//         child: GoogleMap(
//           onMapCreated: _onMapCreated,
//           markers: customMarkers.toSet(),
//           initialCameraPosition: CameraPosition(
//             target: _center,
//             zoom: 10.0,
//           ),
//         ),
//       ),
//     );
//   }
//
// // List<Widget> markerWidgets() {
// //   return locations.map((loc) => MapMarker(loc)).toList();
// // }
// }
