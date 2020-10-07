import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class DatabaseService {
<<<<<<< HEAD
  setSearchParam(String name) {
    String temp = "";
      temp = temp + name[0];

    return temp;
  }
  final String uid;

  DatabaseService({this.uid});

  final CollectionReference userCollection = Firestore.instance.collection(
      'Users');

  Future updateUserData(String name, String Bio) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'Bio': Bio,
      'caseSearch': setSearchParam(name),
    });
  }
}
=======

  final String uid;
  DatabaseService({this.uid});

  final CollectionReference  userCollection = Firestore.instance.collection('Users');

  Future updateUserData(String name,String Bio) async{
    return await userCollection.document(uid).setData({
      'name' : name,
      'Bio' : Bio,
    });
  }
}
>>>>>>> 9bdd33cbc51afd6421542c38486b167d71f52154
