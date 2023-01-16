import 'dart:io';
import 'package:tiktok/controller/video_upload_controller.dart';
import 'package:tiktok/view/widgets/text_input.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class addCaiptionScreen extends StatefulWidget {
  File videofile;
  String videopath;
  addCaiptionScreen(
      {super.key, required this.videofile, required this.videopath});

  @override
  State<addCaiptionScreen> createState() => _addCaiptionScreenState();
}

class _addCaiptionScreenState extends State<addCaiptionScreen> {
  late VideoPlayerController videoPlayerController;
  videoUploadController videoUploadcontroller =    Get.put(videoUploadController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      videoPlayerController = VideoPlayerController.file(widget.videofile);
      videoPlayerController.initialize();
      videoPlayerController.play();
      videoPlayerController.setLooping(true);
      videoPlayerController.setVolume(0.7);
    });
  }

  TextEditingController _musicController = TextEditingController();
  TextEditingController _captionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 1.5,
            child: VideoPlayer(videoPlayerController),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                TextInputFeild(
                    controller: _musicController,
                    myicon: Icons.music_note,
                    mylableText: "music",
                    toHide: false),
                SizedBox(
                  height: 20,
                ),
                TextInputFeild(
                    controller: _captionController,
                    myicon: Icons.closed_caption,
                    mylableText: "caption",
                    toHide: false),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(onPressed: (() {
                  videoUploadcontroller.uploadVideo(_musicController.text, _captionController.text, widget.videopath);
                }), child: Text("Upload"))
              ],
            ),
          )
        ],
      ),
    );
  }
}
