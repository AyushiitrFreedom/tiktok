import 'package:cloud_firestore/cloud_firestore.dart';

class myUser {
  String name ;
  String email;
  String  profilePhoto;
  String uid;

  myUser({
    required this.name,
    required this.email ,
    required this.profilePhoto ,
    required this.uid,

  }
  );

  // firebase understands data in form of map , and our app understands data in form of object of Class"user". so in the function below we are returning a map in which we will have data of our user(funciton type is map so we are returning a map only).

  Map<String , dynamic> toJson(){
    return{
      "name" : name,
      "email" : email,
      "profilePhoto" : profilePhoto,
      "uid" : uid,
    };
  }

  static myUser fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String ,dynamic>;
    return myUser(name: snapshot['name'], email: snapshot['emial'], profilePhoto: snapshot['profilePhoto'], uid: snapshot['uid']);
  }
}