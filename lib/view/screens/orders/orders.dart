import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/order_controllers/order_scrn_controller.dart';
import 'package:time_craft/model/arg_models/order_details_arg.dart';
import 'package:time_craft/model/order_model.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/screens/order_details/order_details.dart';
import 'package:time_craft/view/screens/orders/widgets/ordertile.dart';

class MyOrders extends StatelessWidget {
  const MyOrders({super.key});
  static const String routename = '/Orders';
  final String cartImage =
      'https://firebasestorage.googleapis.com/v0/b/time-craft-fe519.appspot.com/o/images%2Fappimage%2Fpngfind.com-cart-icon-png-1434681.png?alt=media&token=4094a936-d5ce-463e-8c3c-cbffdd8bc8b8';

  @override
  Widget build(BuildContext context) {
    Provider.of<OrderScrnController>(context, listen: false).getOrderIds();
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCom(title: 'Orders'),
        body: Consumer<OrderScrnController>(builder: (context, orderController, child) {
          List<OrderModel> orderlist = orderController.cartlist;
          var orderIdList = orderController.orderIdlist;
          int cartCount = 0;
          return ListView.separated(
            itemBuilder: (context, index) {
              OrderModel data = orderlist[index];
              var cartlist = data.cartlist!;
              bool isCartOrder = cartlist.length > 1;
              return InkWell(
                onTap: () {
                  final arg = OrderDetailsArg(order: orderlist[index], orderId: orderIdList[index]);
                  Navigator.of(context).pushNamed(OrderDetails.routename, arguments: arg);
                },
                child: OrderTile(
                  image: isCartOrder ? cartImage : cartlist[0].imageLink!,
                  orderId: orderIdList[index],
                  orderStatus: orderlist[index].orderStatus!,
                  title: isCartOrder ? 'CartOrder${++cartCount}' : '${cartlist[0].name}',
                ),
              );
            },
            separatorBuilder: (context, index) => const Divider(),
            itemCount: orderlist.length,
          );
        }),
      ),
    );
  }
}
