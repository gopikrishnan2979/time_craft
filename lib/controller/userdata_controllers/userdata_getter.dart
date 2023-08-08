import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';

//collect user data from the database as the user enters
Future<void> collectUserData(BuildContext context, {required String uid}) async {
  try {
    await FirebaseInstances.user.doc(uid).get().then((value) {
      FirebaseInstances.userName = value['name'];
      FirebaseInstances.userPhone = value['phone'];
      FirebaseInstances.userEmail = value['email'];
    });
  } on FirebaseException catch (e) {
    alertshower(text: e.message, context: context);
  }
}
