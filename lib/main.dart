import 'package:chatter_box/pages/home.dart';
import 'package:chatter_box/pages/login.dart';
import 'package:chatter_box/pages/signup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chatter Box',
      debugShowCheckedModeBanner: false,

      home: LoginPage(),
    );

    
  }
}