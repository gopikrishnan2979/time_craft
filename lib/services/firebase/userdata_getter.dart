import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_craft/model/firebase_instance_model.dart';

//collect user data from the database as the user enters
Future<bool> collectUserData({required String uid}) async {
  try {
    return await FirebaseInstances.user.doc(uid).get().then((value) {
      FirebaseInstances.userName = value['name'];
      FirebaseInstances.userPhone = value['phone'];
      FirebaseInstances.userEmail = value['email'];
      return true;
    });
  } on FirebaseException catch(_)  {
    return false;
  }
}
