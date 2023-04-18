import 'package:mynotes/services/auth/auth_user.dart';

//We also need an AuthProvider, to allow us the possibilities to add different types of providers,such
//as google , twitter, apple..e.t.c
//So we're creating this AuthProvider in order to encapsulate other providers that we may add in the future

abstract class AuthProvider {
  Future<void> initialize();

  AuthUser? get currentUser;
  Future<AuthUser> login({
    required String email,
    required String password,
  });
  Future<AuthUser> createUser({
    required String email,
    required String password,
  });
  Future<void> logout();
  Future<void> sendEmailVerification();
  Future<void> sendPasswordReset({required String toEmail});
}
