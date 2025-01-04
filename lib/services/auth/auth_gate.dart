import 'package:app/pages/home_page.dart';
import 'package:app/services/auth/login_or_registre.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapShot) {
            if (snapShot.hasData) {
              return const HomePage();
            } else {
              return LoginOrRegistre();
            }
          }),
    );
  }
}
