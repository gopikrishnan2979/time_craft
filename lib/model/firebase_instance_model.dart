import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseInstanceModel {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;
  static final CollectionReference products = firestore.collection('product');
  static final CollectionReference banners = firestore.collection('banners');
  static final CollectionReference brands = firestore.collection('brands');

  static final CollectionReference cart = firestore.collection('cart');
  static late String uid;
}
