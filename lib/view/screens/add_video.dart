import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class addVideoScreen extends StatelessWidget {
  const addVideoScreen({super.key});

  videoPick(ImageSource src) async{
    final video =  await ImagePicker().pickVideo(source: src);
  }

  showDailogOption(BuildContext context ){
    return showDialog(context: context, builder: ((context) => 
    SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: () => videoPick(ImageSource.gallery),
          child: Text("gallary"),
        ),
        SimpleDialogOption(
          onPressed: ()=> videoPick(ImageSource.camera),
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