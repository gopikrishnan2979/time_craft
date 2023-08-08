import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/model/order_model.dart';

//Order screen controller which controls the order screen 
class OrderScrnController extends ChangeNotifier {
  List<OrderModel> cartlist = [];
  List<String> orderIdlist = [];

  // this method will provide all the order ids that has been stored for a particular user
  // so that the data can be easily fetched from the database with id
  getOrderIds() async {
    try {
      cartlist.clear();
      await FirebaseInstances.userOrder.get().then(
        (value) async {
          orderIdlist = value.docs.map((doc) => doc.id).toList();
          for (String orderId in orderIdlist) {
            await FirebaseInstances.order.doc(orderId).get().then(
              (value) {
                cartlist.add(OrderModel.fromMap(value));
              },
            );
          }
        },
      );
      notifyListeners();
    } catch (e) {
      return;
    }
  }
}
