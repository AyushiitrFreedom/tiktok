import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:tiktok/constants.dart';

class TextInputFeild extends StatelessWidget {
  final TextEditingController controller;
  final IconData myicon;
  final String mylableText;
  final bool toHide;
  const TextInputFeild({super.key, required this.controller, required this.myicon, required this.mylableText, required this.toHide});

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: toHide,
      controller: controller,
      decoration: InputDecoration(
        icon: Icon(myicon),
        labelText: mylableText,
        // enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(color: borderColor)),
        // focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(5),borderSide: const BorderSide(color: borderColor)),
      ),
    );
  }
}