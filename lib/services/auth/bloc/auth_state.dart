import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart' show immutable;
import 'package:mynotes/services/auth/auth_user.dart';

@immutable
abstract class AuthState {
  const AuthState();
}

//For example;  state where the user just opened the application
// and firebase is initializing, we can say it's loading
class AuthStateUninitialized extends AuthState {
  const AuthStateUninitialized();
}

//State of registering, registering may be successful or fail ,so it takes an exception
class AuthStateRegistering extends AuthState {
  final Exception? exception;
  const AuthStateRegistering(this.exception);
}

//state of logged in, and what do we need when we log in ?
//we need the current user; so we get this from our AuthUser class
class AuthStateLoggedIn extends AuthState {
  final AuthUser user;
  const AuthStateLoggedIn(this.user);
}

//state for when user needs to verify email
class AuthStateNeedsVerification extends AuthState {
  const AuthStateNeedsVerification();
}

//state for when user logout
class AuthStateLoggedOut extends AuthState with EquatableMixin {
  final Exception? exception;
  final bool isLoading;
  const AuthStateLoggedOut({
    required this.exception,
    required this.isLoading,
  });

  @override
  List<Object?> get props => [exception, isLoading];
}
