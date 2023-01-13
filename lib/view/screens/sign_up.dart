import 'package:flutter/material.dart';
import 'package:tiktok/view/widgets/text_input.dart';

class SignUp extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(children: [
              Container(
          height: 300,
          width: double.infinity,
          decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(30),
            image: DecorationImage(
                image: AssetImage("images/signup.png"),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 130,
              ),
              CircleAvatar(
                radius: 80,
                backgroundImage:
                    AssetImage("images/profile1.png"),
                backgroundColor: Color.fromARGB(255, 239, 237, 237),
              ),
             
            ],
          ),
              ),
              const SizedBox(
          height: 40.0,
              ),
              Container(
          child: TextInputFeild(
              controller: _usernameController,
              myicon: Icons.person,
              mylableText: "username",
              toHide: false),
          width: 300,
              ),const SizedBox(
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
                image: AssetImage("images/signup.png"), fit: BoxFit.cover),
          ),
          child: Center(
            child: Text(
              "Sign Up",
              style: TextStyle(fontSize: 35, color: Colors.white),
            ),
          ),
              ),
            ]),
        ));
  }
}
