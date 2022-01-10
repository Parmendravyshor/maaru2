import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/provider_home/domain/use_cases/get_provider_request.dart';
import 'package:meta/meta.dart';

part 'provider_home_event.dart';
part 'provider_home_state.dart';

class ProviderHomeBloc extends Bloc<ProviderHomeEvent, ProviderHomeState> {
  ProviderHomeBloc(this._getProviderRequest) : super();
  final GetProviderRequest _getProviderRequest;

  @override
  ProviderHomeState get initialState => ProviderHomeInitial();

  @override
  Stream<ProviderHomeState> mapEventToState(ProviderHomeEvent event) async* {
    if (event is getProviderRequest) {
      print('sdhdhjdhudhdhddhudh${event.service}');
      print('sdhdhjdhudhdhddhudh${event.limit}');
      print('sdhdhjdhudhdhddhudh${event.date}');
      print('sdhdhjdhudhdhddhudh${event.page}');
      final result = await _getProviderRequest(SearchRequestProviderParams(
        name: event.name,

        service: event.service,
        date: event.date,
        page: event.page,
        provider: event.provider,
      ));
      if (result.isRight()) {
        yield RequestLoaded(result.getOrElse(() =>null));
      }
    }
  }
}