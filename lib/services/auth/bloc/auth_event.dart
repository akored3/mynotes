import 'package:flutter/foundation.dart' show immutable;

@immutable
abstract class AuthEvent {
  const AuthEvent();
}

//Event to initialize firebase
class AuthEventInitialize extends AuthEvent {
  const AuthEventInitialize();
}

//Event to send email verification
class AuthEventSendEmailVerification extends AuthEvent {
  const AuthEventSendEmailVerification();
}

//Event to login users
class AuthEventLogin extends AuthEvent {
  final String email;
  final String password;
  const AuthEventLogin(this.email, this.password);
}

//Event to register
class AuthEventRegister extends AuthEvent {
  final String email;
  final String password;
  const AuthEventRegister(this.email, this.password);
}

class AuthEventShouldRegister extends AuthEvent {
  const AuthEventShouldRegister();
}

//Event to logout users
class AuthEventLogout extends AuthEvent {
  const AuthEventLogout();
}
