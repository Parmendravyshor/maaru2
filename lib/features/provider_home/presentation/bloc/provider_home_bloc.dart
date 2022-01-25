import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:maru/core/error/failure.dart';
import 'package:maru/core/usecases/usecase.dart';
import 'package:maru/features/provider_home/domain/use_cases/accept_request_by_id.dart';
import 'package:maru/features/provider_home/domain/use_cases/decline_request_by_id.dart';
import 'package:maru/features/provider_home/domain/use_cases/get_provider_request.dart';
import 'package:meta/meta.dart';

part 'provider_home_event.dart';
part 'provider_home_state.dart';

class ProviderHomeBloc extends Bloc<ProviderHomeEvent, ProviderHomeState> {
  ProviderHomeBloc(this._getProviderRequest, this._acceptRequest,this._declineRequest) : super();
  final GetProviderRequest _getProviderRequest;
  final AcceptRequest _acceptRequest;
final DeclineRequest _declineRequest;
  @override
  ProviderHomeState get initialState => ProviderHomeInitial();

  @override
  Stream<ProviderHomeState> mapEventToState(ProviderHomeEvent event) async* {
    if (event is getProviderRequest) {
      print('sdhdhjdhudhdhddhudh${event.service}');
      final result = await _getProviderRequest(SearchRequestProviderParams(
        name: event.name,
        service: event.service,
        date: event.date,
        provider: event.provider,
      ));
      if (result.isRight()) {
        yield RequestLoaded(result.getOrElse(() => null));
      }
    }
    if (event is AcceptRequested) {
      final result = await _acceptRequest(event.id);
      if (result.isRight()) {
        yield AcceptRequestSuccessful();
      }
      return;
    }
    if (event is Decline) {
      final result = await _declineRequest(event.id);
      if (result.isRight()) {
        yield DeclineRequestSuccessful();
      }
      return;
    }
  }
}
