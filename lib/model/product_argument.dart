import 'package:cloud_firestore/cloud_firestore.dart';

class ProductArgument {
  QueryDocumentSnapshot<Object?> data;
  ProductArgument({required this.data});
}