import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class PetProfileAuthParams extends Equatable {
  final String petName;
  final String male;
  final String female;
  final String breedType;
  final String height;
  final String weight;
  final String birthDate;

  PetProfileAuthParams(
      {@required this.male,
      @required this.female,
      @required this.petName,
      @required this.breedType,
      @required this.height,
      @required this.weight,
      @required this.birthDate});
  @override
  List<Object> get props =>
      [male, female, petName, birthDate, hashCode, weight, birthDate];
}
