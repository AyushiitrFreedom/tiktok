
import 'package:flutter/material.dart';
import 'package:tiktok/view/screens/auth/login_screen.dart';
import 'package:tiktok/view/screens/sign_up.dart';
import 'constants.dart';

void main() async{
  // firebase core ke liye ye do line likhni padti hai , isliye likhi hai . #yaad rkhna

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: SignUp()
    );
  }
}

