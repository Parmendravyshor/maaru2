


import 'package:google_maps/google_maps.dart';

class PlacesMock {
  static List<Place> places = <Place>[
    const Place(
        id: 1,
        description: 'Lojas Americanas',
        state: 'SP',
        city: 'São Paulo',
        address: 'R. Silva Bueno, 400',
        latitude: -23.5963531,
        longitude: -46.6019338,
        image:
        'https://image.isu.pub/140205201423-452dd45aa318dc4631b69596161f96f0/jpg/page_1.jpg'),
    const Place(
        id: 2,
        description: 'Magazine Luiza',
        state: 'SP',
        city: 'São Paulo',
        address: 'R. Silva Bueno, 380',
        latitude: -23.5993549,
        longitude: -46.6030992,
        image:
        'https://digitalks.com.br/wp-content/uploads/2018/12/magazine-luiza-logo-1.png'),
    const Place(
        id: 3,
        description: 'Casas Bahia',
        state: 'SP',
        city: 'São Paulo',
        address: 'Praça Ramos de Azevedor, 131',
        latitude: -23.5458473,
        longitude: -46.6415126,
        image:
        'https://iguatemi.com.br/esplanada/sites/esplanada/files/logo-1360189935923.png')
  ];
}
class Place {
  final int id;
  final String description;
  final String city;
  final String state;
  final String image;
  final String address;
  final double latitude;
  final double longitude;

  const Place(
      {this.id,
        this.description,
        this.city,
        this.state,
        this.image,
        this.address,
        this.latitude,
        this.longitude});
}
class UserLocation {
  final double latitude;
  final double longitude;

  const UserLocation({this.latitude, this.longitude});
}