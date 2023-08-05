import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseInstances {
  /// Firebase firestore instance
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  /// admin side data collection References
  static final CollectionReference products = firestore.collection('product');
  static final CollectionReference banners = firestore.collection('banners');
  static final CollectionReference brands = firestore.collection('brands');
  static final CollectionReference order = firestore.collection('orders');

  /// User Side Data Collection References
  static final CollectionReference user = firestore.collection('users');
  static final CollectionReference cart = firestore.collection('cart');
  static final CollectionReference wishlist = firestore.collection('wishlist');
  static final CollectionReference address = user.doc(FirebaseInstances.uid).collection('address');
  static final CollectionReference userOrder = user.doc(FirebaseInstances.uid).collection('orders');

  /// User id
  static String? uid;
  static String? userName;
  static String? userPhone;
  static String? userEmail;
}
