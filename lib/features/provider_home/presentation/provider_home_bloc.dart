import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'provider_home_event.dart';
part 'provider_home_state.dart';

class ProviderHomeBloc extends Bloc<ProviderHomeEvent, ProviderHomeState> {


  @override
  // TODO: implement initialState
  ProviderHomeState get initialState => throw UnimplementedError();

  @override
  Stream<ProviderHomeState> mapEventToState(ProviderHomeEvent event) {
    // TODO: implement mapEventToState
    throw UnimplementedError();
  }
}
