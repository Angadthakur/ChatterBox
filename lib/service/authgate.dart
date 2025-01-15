import 'package:chatter_box/pages/home.dart';
import 'package:chatter_box/pages/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Authgate extends StatelessWidget {
  const Authgate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //If user is logged in
          if (snapshot.hasData) {
            return const Home();
          }

          //user not logged in 
          else {
            return LoginPage();
          }
        },
      ),
    );
  }
}
