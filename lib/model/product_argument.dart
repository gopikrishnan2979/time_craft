import 'package:cloud_firestore/cloud_firestore.dart';

class ProductArgument {
  String id;
  QueryDocumentSnapshot<Object?> data;
  ProductArgument({required this.data,required this.id});
}
