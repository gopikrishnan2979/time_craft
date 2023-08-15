import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/model/order_model.dart';

class OrderServices {
  final OrderModel _orderData;
  OrderServices(this._orderData);
  Future<String?> addOrder() async {
    try {
      return await FirebaseInstances.order.add(_orderData.toMap()).then((value) async {
        return await FirebaseInstances.userOrder
            .doc(value.id)
            .set({'orderStatus': 'Order Placed'}).then((value) => null);
      });
    } on FirebaseException catch (e) {
      return e.message ?? '';
    }
  }
}
