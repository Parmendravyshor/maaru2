part of 'provider_home_bloc.dart';

@immutable
abstract class ProviderHomeEvent {}
class getProviderRequest extends ProviderHomeEvent{
final String name;
final String service;
final String provider;
final String date;

  getProviderRequest(this.name, this.service, this.provider, this.date, );
}
class AcceptRequested extends ProviderHomeEvent{
  final int id;
  AcceptRequested(this.id);
  @override
  String toString() =>'AcceptRequested';
  }
class Decline extends ProviderHomeEvent{
  final int id;
  Decline(this.id);
  @override
  String toString() =>'Decline';
}
