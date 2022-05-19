import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:megatech/source/model/login_model.dart';
import 'package:megatech/source/repository/sign_in_repository.dart';
import 'package:meta/meta.dart';

part 'sign_in_event.dart';

part 'sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignedInRepository signedInRepository;

  SignInBloc({required this.signedInRepository})
      : super(const SignInInitial()) {
    on<GetLogin>((event, emit) async {
      emit(const SignInLoading());
      final either =
          await signedInRepository.getLogin(event.name, event.password);
      emit(either.fold((failure) =>const SignInError(message: ''),
          (success) => SignInLoaded(loginModel: success)));
    });

    on<GetSession>((event, emit) {});
  }
}
