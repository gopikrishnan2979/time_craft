import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/model/order_model.dart';
import 'package:time_craft/view/screens/checkout/order_placed.dart';

class OrderServices {
  final OrderModel _orderData;
  final BuildContext context;
  OrderServices(this._orderData, {required this.context});
  addOrder() async {
    try {
      await FirebaseInstances.order.add(_orderData.toMap()).then((value) async {
        await FirebaseInstances.userOrder.doc(value.id).set({'orderStatus': 'Order Placed'});
        if (context.mounted) Navigator.of(context).pushReplacementNamed(OrderPlaced.routename);
      });
    } on FirebaseException catch (e) {
      alertshower(e.message);
    }
  }

  alertshower(String? e) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alert'),
        content: Text(e ?? ''),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
