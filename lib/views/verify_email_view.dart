import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

class VerifyEmailView extends StatefulWidget {
  const VerifyEmailView({super.key});

  @override
  State<VerifyEmailView> createState() => _VerifyEmailViewState();
}

class _VerifyEmailViewState extends State<VerifyEmailView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Verify Email'),
      ),
      body: Column(
        children: [
          const Text('Please verify your email address'),
          TextButton(
            onPressed: () async {
              final user = FirebaseAuth.instance.currentUser;
              try {
                await user?.sendEmailVerification();
                devtools.log(user.toString());
              } on FirebaseAuthException catch (e) {
                // TODO
                devtools.log('something happened');
                devtools.log(e.toString());
              }
            },
            child: const Text('Send email Verification'),
          ),
        ],
      ),
    );
  }
}
