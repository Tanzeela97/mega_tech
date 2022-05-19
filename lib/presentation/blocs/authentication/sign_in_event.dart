part of 'sign_in_bloc.dart';

@immutable
abstract class SignInEvent {
  const SignInEvent();
}

class GetLogin extends SignInEvent {
  final String name;
  final String password;

  const GetLogin({required this.name, required this.password});
}

class GetSession extends SignInEvent {
  const GetSession();
}
