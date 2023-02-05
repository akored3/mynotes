import 'package:flutter_test/flutter_test.dart';
import 'package:mynotes/services/auth/auth_exceptions.dart';
import 'package:mynotes/services/auth/auth_provider.dart';
import 'package:mynotes/services/auth/auth_user.dart';

void main() {
  // group('Mock Authentication', () {
  //   final provider = MockAuthProvider();
  //   test('Should not be initialized to begin with', () {
  //     expect(provider.isInitialized, false);
  //   });

  //   test('Cannot log out if not initialized', () {
  //     expect(
  //       provider.logout(),
  //       throwsA(const TypeMatcher<NotInitializedException>()),
  //     );
  //   });

  //   test('Should be able to be initialized', () async {
  //     await provider.initialize();
  //     expect(provider.isInitialized, true);
  //   });

  //   test('User should be null after initialization', () {
  //     expect(provider.currentUser, null);
  //   });

  //   test(
  //     'should be able to initialize after 2 seconds',
  //     () async {
  //       await provider.initialize();
  //       expect(provider.isInitialized, true);
  //     },
  //     timeout: const Timeout(Duration(seconds: 2)),
  //   );
  //   test('Create user should delegate to login function', () async {
  //     final badEmailUser = provider.createUser(
  //       email: 'foo@bar.com',
  //       password: 'foobar',
  //     );
  //     expect(badEmailUser,
  //         throwsA(const TypeMatcher<UserNotFoundAuthException>()));

  //     final badPasswordUser = provider.createUser(
  //       email: 'someone@bar.com',
  //       password: 'foobar',
  //     );
  //     expect(badPasswordUser,
  //         throwsA(const TypeMatcher<WrongPasswordAuthException>()));

  //     final user = await provider.createUser(
  //       email: 'foo',
  //       password: 'bar',
  //     );
  //     expect(provider.currentUser, user);
  //     expect(user.isEmailVerified, false);
  //   });
  // });
}

// class NotInitializedException implements Exception {}

// class MockAuthProvider implements AuthProvider {
//   AuthUser? _user;

//   var _isInitialized = false;

//   bool get isInitialized => _isInitialized;

//   @override
//   Future<AuthUser> createUser({
//     required String email,
//     required String password,
//   }) async {
//     if (!isInitialized) throw NotInitializedException();
//     //fake creating a user
//     Future.delayed(const Duration(seconds: 1));
//     return login(
//       email: email,
//       password: password,
//     );
//   }

//   @override
//   AuthUser? get currentUser => _user;

//   @override
//   Future<void> initialize() async {
//     await Future.delayed(const Duration(seconds: 1));
//     _isInitialized = true;
//   }

//   @override
//   Future<AuthUser> login({
//     required String email,
//     required String password,
//   }) {
//     if (!isInitialized) throw NotInitializedException();
//     //We're gonna bring in some fake functionalities just so we can write tests for them
//     if (email == 'foo@bar.com') throw UserNotFoundAuthException();
//     if (password == 'foobar') throw WrongPasswordAuthException();
//     const user = AuthUser(isEmailVerified: false);
//     _user = user;
//     return Future.value(user);
//   }

//   @override
//   Future<void> logout() async {
//     if (!isInitialized) throw NotInitializedException();
//     if (_user == null) throw UserNotFoundAuthException();
//     await Future.delayed(const Duration(seconds: 1));
//     _user = null;
//   }

//   @override
//   Future<void> sendEmailVerification() async {
//     if (!isInitialized) throw NotInitializedException();
//     final user = _user;
//     if (user == null) throw UserNotFoundAuthException();
//     const newUser = AuthUser(isEmailVerified: true);
//     _user = newUser;
//   }
// }

class NotInitializedException implements Exception {}

class MockAuthProvider implements AuthProvider {
  AuthUser? _user;

  var _isInitialized = false;

  bool get isInitialized => _isInitialized;

  @override
  Future<AuthUser> createUser({
    required String email,
    required String password,
  }) async {
    if (!isInitialized) throw NotInitializedException();
    await Future.delayed(const Duration(seconds: 1));
    return login(
      email: email,
      password: password,
    );
  }

  @override
  AuthUser? get currentUser => _user;

  @override
  Future<void> initialize() async {
    Future.delayed(const Duration(seconds: 1));
    _isInitialized = true;
  }

  @override
  Future<AuthUser> login({
    required String email,
    required String password,
  }) {
    if (!isInitialized) throw NotInitializedException();
    if (email == 'foo@bar.com') throw UserNotFoundAuthException();
    if (password == 'foobar') throw WrongPasswordAuthException();
    const user = AuthUser(isEmailVerified: false);
    _user = user;
    return Future.value(user);
  }

  @override
  Future<void> logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<void> sendEmailVerification() {
    // TODO: implement sendEmailVerification
    throw UnimplementedError();
  }
}