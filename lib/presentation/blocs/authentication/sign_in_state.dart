part of 'sign_in_bloc.dart';

@immutable
abstract class SignInState {
  const SignInState();
}

class SignInInitial extends SignInState {
  const SignInInitial();
}

class SignInLoading extends SignInState {
  const SignInLoading();
}

class SignInLoaded extends SignInState {
  final LoginModel loginModel;
  const SignInLoaded({required this.loginModel});
}

class SignInError extends SignInState {
  final String message;
  const SignInError({required this.message});
}
