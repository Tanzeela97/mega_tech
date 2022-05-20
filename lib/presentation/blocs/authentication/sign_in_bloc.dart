import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:megatech/source/core/failure.dart';
import 'package:megatech/source/model/login_model.dart';
import 'package:megatech/source/model/session_model.dart';
import 'package:megatech/source/repository/sign_in_repository.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

const String SERVER_FAILURE_MESSAGE = 'Server Failure';
const String CACHE_FAILURE_MESSAGE = 'Cache Failure';
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final ISignedInRepository iSignedInRepository;

  SignInBloc({required this.iSignedInRepository})
      : super(const SignInInitial()) {
    on<GetLogin>((event, emit) async {
      emit(const SignInLoading());
      final either =
          await iSignedInRepository.getLogin(event.name, event.password);
      emit(either.fold((failure) => const SignInError(message: SERVER_FAILURE_MESSAGE),
          (success) => SignInLoaded(loginModel: success)));
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
