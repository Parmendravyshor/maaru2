import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocation/geolocation.dart';
import 'package:google_maps/google_maps.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maru/features/map/entity/entities.dart';
import 'package:meta/meta.dart';

part 'map_event.dart';
part 'map_state.dart';

class MapBloc extends Bloc<MapEvent, MapState> {
  @override
  // TODO: implement initialState
  MapState get initialState => throw UnimplementedError();
  Place focusedPlace;
  List<Place> places = PlacesMock.places;
  Map<MarkerId, Marker> markers = {};

  final StreamController _placesController =
  BehaviorSubject<List<Place>>(seedValue: []);

  final StreamController<Place> _placeFocusedController =
  StreamController<Place>();

  final StreamController<Map<MarkerId, Marker>> _markersController =
  StreamController<Map<MarkerId, Marker>>();

  Stream<List<Place>> get outPlaces => _placesController.stream;
  Stream<Place> get outPlaceFocused => _placeFocusedController.stream;
  Stream<Map<MarkerId, Marker>> get outMarkers => _markersController.stream;

  Sink get inFocusPlace => _placeFocusedController.sink;

  MapBloc() {
    _placesController.sink.add(places);
    _createMarkers();
    _markersController.sink.add(markers);
    _placeFocusedController.stream.listen(_focusPlace);
  }

  void _createMarkers() {
    places.forEach((el) {
      final MarkerId _markerId = MarkerId(el.id.toString());

      Marker _marker = Marker(
        markerId: _markerId,
        position: LatLng(el.latitude, el.longitude),
        infoWindow: InfoWindow(
          title: el.description,
          snippet: '${el.address}',
        ),
        icon: BitmapDescriptor.defaultMarker,
      );

      markers[_markerId] = _marker;
    });
  }

  void _focusPlace(Place place) {
    focusedPlace = place;
  }

  @override
  void dispose() {
    _placesController.close();
    _placeFocusedController.close();
    _markersController.close();
  }

  @override
  Stream<MapState> mapEventToState(MapEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}





class GeolocationBloc implements MapBloc {
  UserLocation userLocation;

  final StreamController<UserLocation> _userLocationController =
  StreamController<UserLocation>();

  Stream<UserLocation> get outUserLocation => _userLocationController.stream;

  GeolocationBloc() {
    _getUserLocation();
  }

  _getUserLocation() {
    try {
      var location = new Location();
      location.getLocation().then((coords) {
        userLocation = UserLocation(
          latitude: coords.latitude,
          longitude: coords.longitude,
        );

        _userLocationController.sink.add(userLocation);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _userLocationController.close();
  }

  @override
  Place focusedPlace;

  @override
  Map<MarkerId, dynamic> markers;

  @override
  List<Place> places;

  @override
  void _createMarkers() {
    // TODO: implement _createMarkers
  }

  @override
  void _focusPlace(Place place) {
    // TODO: implement _focusPlace
  }

  @override
  // TODO: implement _markersController
  StreamController<Map<MarkerId, dynamic>> get _markersController => throw UnimplementedError();

  @override
  // TODO: implement _placeFocusedController
  StreamController<Place> get _placeFocusedController => throw UnimplementedError();

  @override
  // TODO: implement _placesController
  StreamController get _placesController => throw UnimplementedError();

  @override
  void add(MapEvent event) {
    // TODO: implement add
  }

  @override
  Future<bool> any(bool Function(MapState element) test) {
    // TODO: implement any
    throw UnimplementedError();
  }

  @override
  Stream<MapState> asBroadcastStream({void Function(StreamSubscription<MapState> subscription) onListen, void Function(StreamSubscription<MapState> subscription) onCancel}) {
    // TODO: implement asBroadcastStream
    throw UnimplementedError();
  }

  @override
  Stream<E> asyncExpand<E>(Stream<E> Function(MapState event) convert) {
    // TODO: implement asyncExpand
    throw UnimplementedError();
  }

  @override
  Stream<E> asyncMap<E>(FutureOr<E> Function(MapState event) convert) {
    // TODO: implement asyncMap
    throw UnimplementedError();
  }

  @override
  Stream<R> cast<R>() {
    // TODO: implement cast
    throw UnimplementedError();
  }

  @override
  Future<void> close() {
    // TODO: implement close
    throw UnimplementedError();
  }

  @override
  Future<bool> contains(Object needle) {
    // TODO: implement contains
    throw UnimplementedError();
  }

  @override
  Stream<MapState> distinct([bool Function(MapState previous, MapState next) equals]) {
    // TODO: implement distinct
    throw UnimplementedError();
  }

  @override
  Future<E> drain<E>([E futureValue]) {
    // TODO: implement drain
    throw UnimplementedError();
  }

  @override
  Future<MapState> elementAt(int index) {
    // TODO: implement elementAt
    throw UnimplementedError();
  }

  @override
  Future<bool> every(bool Function(MapState element) test) {
    // TODO: implement every
    throw UnimplementedError();
  }

  @override
  Stream<S> expand<S>(Iterable<S> Function(MapState element) convert) {
    // TODO: implement expand
    throw UnimplementedError();
  }

  @override
  // TODO: implement first
  Future<MapState> get first => throw UnimplementedError();

  @override
  Future<MapState> firstWhere(bool Function(MapState element) test, {MapState Function() orElse}) {
    // TODO: implement firstWhere
    throw UnimplementedError();
  }

  @override
  Future<S> fold<S>(S initialValue, S Function(S previous, MapState element) combine) {
    // TODO: implement fold
    throw UnimplementedError();
  }

  @override
  Future forEach(void Function(MapState element) action) {
    // TODO: implement forEach
    throw UnimplementedError();
  }

  @override
  Stream<MapState> handleError(Function onError, {bool Function(dynamic error) test}) {
    // TODO: implement handleError
    throw UnimplementedError();
  }

  @override
  // TODO: implement inFocusPlace
  Sink get inFocusPlace => throw UnimplementedError();

  @override
  // TODO: implement initialState
  MapState get initialState => throw UnimplementedError();

  @override
  // TODO: implement isBroadcast
  bool get isBroadcast => throw UnimplementedError();

  @override
  // TODO: implement isEmpty
  Future<bool> get isEmpty => throw UnimplementedError();

  @override
  Future<String> join([String separator = ""]) {
    // TODO: implement join
    throw UnimplementedError();
  }

  @override
  // TODO: implement last
  Future<MapState> get last => throw UnimplementedError();

  @override
  Future<MapState> lastWhere(bool Function(MapState element) test, {MapState Function() orElse}) {
    // TODO: implement lastWhere
    throw UnimplementedError();
  }

  @override
  // TODO: implement length
  Future<int> get length => throw UnimplementedError();

  @override
  StreamSubscription<MapState> listen(void Function(MapState p1) onData, {Function onError, void Function() onDone, bool cancelOnError}) {
    // TODO: implement listen
    throw UnimplementedError();
  }

  @override
  Stream<S> map<S>(S Function(MapState event) convert) {
    // TODO: implement map
    throw UnimplementedError();
  }

  @override
  Stream<MapState> mapEventToState(MapEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }

  @override
  void onError(Object error, StackTrace stacktrace) {
    // TODO: implement onError
  }

  @override
  void onEvent(MapEvent event) {
    // TODO: implement onEvent
  }

  @override
  void onTransition(Transition<MapEvent, MapState> transition) {
    // TODO: implement onTransition
  }

  @override
  // TODO: implement outMarkers
  Stream<Map<MarkerId, dynamic>> get outMarkers => throw UnimplementedError();

  @override
  // TODO: implement outPlaceFocused
  Stream<Place> get outPlaceFocused => throw UnimplementedError();

  @override
  // TODO: implement outPlaces
  Stream<List<Place>> get outPlaces => throw UnimplementedError();

  @override
  Future pipe(StreamConsumer<MapState> streamConsumer) {
    // TODO: implement pipe
    throw UnimplementedError();
  }

  @override
  Future<MapState> reduce(MapState Function(MapState previous, MapState element) combine) {
    // TODO: implement reduce
    throw UnimplementedError();
  }

  @override
  // TODO: implement single
  Future<MapState> get single => throw UnimplementedError();

  @override
  Future<MapState> singleWhere(bool Function(MapState element) test, {MapState Function() orElse}) {
    // TODO: implement singleWhere
    throw UnimplementedError();
  }

  @override
  Stream<MapState> skip(int count) {
    // TODO: implement skip
    throw UnimplementedError();
  }

  @override
  Stream<MapState> skipWhile(bool Function(MapState element) test) {
    // TODO: implement skipWhile
    throw UnimplementedError();
  }

  @override
  // TODO: implement state
  MapState get state => throw UnimplementedError();

  @override
  Stream<MapState> take(int count) {
    // TODO: implement take
    throw UnimplementedError();
  }

  @override
  Stream<MapState> takeWhile(bool Function(MapState element) test) {
    // TODO: implement takeWhile
    throw UnimplementedError();
  }

  @override
  Stream<MapState> timeout(Duration timeLimit, {void Function(EventSink<MapState> sink) onTimeout}) {
    // TODO: implement timeout
    throw UnimplementedError();
  }

  @override
  Future<List<MapState>> toList() {
    // TODO: implement toList
    throw UnimplementedError();
  }

  @override
  Future<Set<MapState>> toSet() {
    // TODO: implement toSet
    throw UnimplementedError();
  }

  @override
  Stream<S> transform<S>(StreamTransformer<MapState, S> streamTransformer) {
    // TODO: implement transform
    throw UnimplementedError();
  }

  @override
  Stream<MapState> transformEvents(Stream<MapEvent> events, Stream<MapState> Function(MapEvent p1) next) {
    // TODO: implement transformEvents
    throw UnimplementedError();
  }

  @override
  Stream<MapState> transformStates(Stream<MapState> states) {
    // TODO: implement transformStates
    throw UnimplementedError();
  }

  @override
  Stream<MapState> where(bool Function(MapState event) test) {
    // TODO: implement where
    throw UnimplementedError();
  }
}

