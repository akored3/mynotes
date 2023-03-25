import 'package:flutter/foundation.dart' show immutable;
import 'package:mynotes/services/auth/auth_user.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

//For example;  state where the user just opened the application
// and firebase is initializing, we can say it's loading
class AuthStateLoading extends AuthState {
  const AuthStateLoading();
}

//state of logged in, and what do we need when we log in ?
//we need the current user; so we get this from our AuthUser class
class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateLoggedIn(this.user);
}

//state for when an error occurs while logging in
class AuthStateLoginFailure extends AuthState {
  final Exception exception;
  const AuthStateLoginFailure(this.exception);
}

//state for when user needs to verify email
class AuthStateNeedsVerification extends AuthState {
  const AuthStateNeedsVerification();
}

//state for when user logout
class AuthStateLoggedOut extends AuthState {
  const AuthStateLoggedOut();
}

//state for logout error
class AuthStateLogoutFailure extends AuthState {
  final Exception exception;
  const AuthStateLogoutFailure(this.exception);
}
