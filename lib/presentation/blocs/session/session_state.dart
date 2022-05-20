part of 'session_bloc.dart';

@immutable
abstract class SessionState {
  const SessionState();
}

class SessionInitial extends SessionState {}
class SessionLoaded extends SessionState {
  final SessionModel sessionModel;
  const SessionLoaded({required this.sessionModel});
}
class SessionError extends SessionState {
  final String message;
  const SessionError({required this.message});
}
