import 'package:firebase_auth/firebase_auth.dart' show User;
import 'package:flutter/foundation.dart';

//We shouldn't expose FirebaseUser to the UI ,
//We need to create our own user which abstracts away the functionality that a current FirebaseUser has

@immutable
class AuthUser {
  final bool isEmailVerified;

  const AuthUser(this.isEmailVerified);
  //We need a factory constructor that creates our AuthUser from FirebaseUser
  //Hence all the properties of FirebaseUser are available to our AuthUser😎
  factory AuthUser.fromFirebase(User user) => AuthUser(user.emailVerified);
}
