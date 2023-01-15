import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tiktok/model/user.dart';
import 'package:tiktok/view/screens/auth/login_screen.dart';
import 'package:tiktok/view/screens/auth/sign_up.dart';

import '../view/screens/home.dart';





class AuthController extends GetxController {
  static AuthController instance = Get.find();
  File? img;
  void pickImage() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    this.img = File(image!.path);
  }
  void SignUp(
      String username, String email, String password, File? image) async {
    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
   String downloadUrl =  await _uploadProPic(image!);
   myUser user = myUser(name: username, email: email, profilePhoto: downloadUrl, uid: credential.user!.uid);
   await FirebaseFirestore.instance.collection('users').doc(credential.user!.uid).set(user.toJson());


  }

  Future<String> _uploadProPic(File image) async{
     Reference reference = FirebaseStorage.instance
        .ref()
        .child('profilePics').child(FirebaseAuth.instance.currentUser!.uid);
    UploadTask uploadTask = reference.putFile(image);
    TaskSnapshot snapshot = await uploadTask;
    String imageUrl = await snapshot.ref.getDownloadURL();
    return (imageUrl);
  }

  void Login(String email , String password) async{
    await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  }

  // checking if user is logged in or logged out
  late Rx<User?> _user;
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user = Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialView);
  }

  _setInitialView(User? user){
    if (user==null) {
      Get.offAll(()=> LoginScreen());
    } else {
      Get.offAll(()=> Home());
    }
  }
}
