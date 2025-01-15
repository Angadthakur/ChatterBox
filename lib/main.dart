import 'package:chatter_box/pages/chat.dart';
import 'package:chatter_box/pages/forgotpass.dart';
import 'package:chatter_box/pages/home.dart';
import 'package:chatter_box/pages/login.dart';
import 'package:chatter_box/pages/signup.dart';
import 'package:chatter_box/service/authgate.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        title: 'Chatter Box',
        debugShowCheckedModeBanner: false,
        home: LoginPage(),
      );
    });
  }
}

