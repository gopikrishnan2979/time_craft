import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/model/order_model.dart';

class OrderScrnController extends ChangeNotifier {
  List<OrderModel> cartlist = [];
  List<String> orderIdlist = [];
  getOrderIds() async {
    cartlist.clear();
    await FirebaseInstanceModel.userOrder.get().then((value) async {
      orderIdlist = value.docs.map((doc) => doc.id).toList();
      for (String orderId in orderIdlist) {
        await FirebaseInstanceModel.order.doc(orderId).get().then((value) {
          cartlist.add(OrderModel.fromMap(value));
        });
      }
    });
    log(cartlist.toString());
    notifyListeners();
  }
}