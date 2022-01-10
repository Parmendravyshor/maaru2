part of 'provider_home_bloc.dart';

@immutable
abstract class ProviderHomeEvent {}
class getProviderRequest extends ProviderHomeEvent{
final String name;
final String service;
final String provider;
final String date;
final String page;
final String limit;

  getProviderRequest(this.name, this.service, this.provider, this.date, this.page, this.limit);
}
