import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controller/auth_controller.dart';
import 'package:tiktok/view/screens/auth/login_screen.dart';
import 'package:tiktok/view/screens/auth/sign_up.dart';
import 'constants.dart';

void main() async{
  // firebase core ke liye ye do line likhni padti hai , isliye likhi hai . #yaad rkhna
  WidgetsFlutterBinding.ensureInitialized();
  await  Firebase.initializeApp().then((value) => Get.put(AuthController()));
 
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor
      ),
      home: SignUpScreen()
    );
  }
}

