import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:megatech/source/core/failure.dart';
import 'package:megatech/source/model/session_model.dart';
import 'package:megatech/source/repository/sign_in_repository.dart';
import 'package:meta/meta.dart';

part 'session_event.dart';
part 'session_state.dart';

class SessionBloc extends Bloc<SessionEvent, SessionState> {
  final ISignedInRepository iSignedInRepository;
  SessionBloc({required this.iSignedInRepository}) : super(SessionInitial()) {
    on<GetSession>((event, emit)async {

      final either = await iSignedInRepository.getSession();
      emit(either.fold((failure) => const SessionError(message: CACHE_FAILURE_MESSAGE),
              (success) => SessionLoaded(sessionModel: success)));

    });
  }


  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHE_FAILURE_MESSAGE;
      default:
        return 'Unexpected error';
    }
  }
}

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';