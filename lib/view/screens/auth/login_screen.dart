import 'package:flutter/material.dart';
import 'package:tiktok/view/widgets/text_input.dart';

class LoginScreen extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Image.asset("images/loginimg.png"),
      Text(
        "Hello",
        textAlign: TextAlign.center,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50.0),
      ),
      SizedBox(
        height: 7.0,
      ),
      Text(
        "Sign into your account",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Color.fromARGB(255, 163, 162, 162),
          fontSize: 20.0,
          letterSpacing: 2.0,
        ),
      ),
      const SizedBox(
        height: 40.0,
      ),
      Container(
        child: TextInputFeild(
            controller: _emailController,
            myicon: Icons.email,
            mylableText: "email",
            toHide: false),
        width: 300,
      ),
      const SizedBox(
        height: 40.0,
      ),
      Container(
        child: TextInputFeild(
            controller: _passwordController,
            myicon: Icons.password,
            mylableText: "password",
            toHide: true),
        width: 300,
      ),
      const SizedBox(
        height: 40.0,
      ),
      Container(
        height: 70,
        width: 200,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          image: DecorationImage(
              image: AssetImage("images/signup.png"),
              fit: BoxFit.cover),
        ),
        child: Center(
          child: Text(
            "log in",
            style: TextStyle(fontSize: 35, color: Colors.white),
          ),
        ),
      ),
    ]));
  }
}
