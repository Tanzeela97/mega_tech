part of 'session_bloc.dart';

@immutable
abstract class SessionEvent {
  const SessionEvent();
}

class GetSession extends SessionEvent {
  const GetSession();
}
