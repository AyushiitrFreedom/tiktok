import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/view/screens/addCaiption_screen.dart';

class addVideoScreen extends StatelessWidget {
  const addVideoScreen({super.key});

  videoPick(ImageSource src,context) async{
    final video =  await ImagePicker().pickVideo(source: src);
    Navigator.push(context, MaterialPageRoute(builder: ((context) => addCaiptionScreen(videofile: File(video!.path), videopath: video.path))));
  }

  showDailogOption(BuildContext context ){
    return showDialog(context: context, builder: ((context) => 
    SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: () => videoPick(ImageSource.gallery,context),
          child: Text("gallary"),
        ),
        SimpleDialogOption(
          onPressed: ()=> videoPick(ImageSource.camera,context),
          child: Text("Camera"),
        ),
        SimpleDialogOption(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text("Close"),
        ),
      ],
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () => showDailogOption(context),
          child: Text("Add Video"),
          
        ),
      ),
    );
  }
}