import 'dart:io';
import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:tiktok/model/video.dart';
import 'package:uuid/uuid.dart';
import 'package:video_compress/video_compress.dart';


class videoUploadController extends GetxController{
  static videoUploadController instance = Get.find();
  var uuid = Uuid();

  Future<String> _uploadVideoToStorage(String videoId , String videoPath) async{
    Reference reference = FirebaseStorage.instance.ref().child('videos').child(videoId);
    UploadTask uploadTask = reference.putFile(await _compressVideo(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;

  } 

  Future<File> _getThumb(String videoPath) async{
    final thumbnail = await VideoCompress.getFileThumbnail(videoPath);
    return thumbnail;
  }

  Future<String> _uploadVideoThumbToStorage(String Id , String videoPath)async{
    Reference reference = FirebaseStorage.instance.ref().child('Thumbnail').child(Id);
    UploadTask uploadTask = reference.putFile(await _getThumb(videoPath));
    TaskSnapshot snapshot = await uploadTask;
    String downloadUrl = await snapshot.ref.getDownloadURL();
    return downloadUrl;
  }
  uploadVideo(String songName , String caption , String videoPath)async{
    String uid = FirebaseAuth.instance.currentUser!.uid;
    DocumentSnapshot userDoc = await FirebaseFirestore.instance.collection('users').doc(uid).get();
    String id = uuid.v1();
    String videoUrl = await _uploadVideoToStorage(id , videoPath);

    String thumbnail = await _uploadVideoThumbToStorage(id , videoPath);

    Video video = Video(username: (userDoc.data()! as Map<String , dynamic>)['name'], uid: uid, thumbnail: thumbnail, caption: caption, commentsCount: 0, id: id, likes: [], profilePic: (userDoc.data()! as Map<String , dynamic>)['profilePhoto'], shareCount: 0, songName: songName, videoUrl: videoUrl);
    await FirebaseFirestore.instance.collection('videos').doc(id).set(video.toJson());
    Get.snackbar("Video Uplauded","Thank you for using");
    Get.back();
  }

  _compressVideo(String videoPath) async{
    final compressVideo  = await VideoCompress.compressVideo(videoPath,quality: VideoQuality.MediumQuality);
    return compressVideo!.file;
  }
}