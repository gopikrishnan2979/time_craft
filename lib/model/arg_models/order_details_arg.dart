import 'package:time_craft/model/order_model.dart';

//order details arguments as used generating route system

class OrderDetailsArg {
  OrderModel order;
  String orderId;
  OrderDetailsArg({required this.order,required this.orderId});
}
