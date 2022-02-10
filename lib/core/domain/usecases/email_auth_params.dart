import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// this entity class will hold email and password for EmailSignup and EmailLogin UseCase
class EmailAuthParams extends Equatable {
  /// email to use for login
  final String email;

  /// password to use for login
  final String password;

  /// first name to use for login
  final String first_name;

  /// last name to use for login
  final String lName;
final String userType;
  const EmailAuthParams(
      {@required this.email,
      @required this.password,
     this.first_name,
 this.userType,
   this.lName});

  @override
  List<Object> get props => [email, password, first_name, lName,userType];
}
class ChatModel{
  String name;
  String icon;
  String time;
  String currentMessage;
  ChatModel({this.currentMessage,this.icon,this.name,this.time});
}