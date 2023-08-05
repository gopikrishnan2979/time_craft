import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/checkout_address_controller.dart';
import 'package:time_craft/controller/payment_selector.dart';
import 'package:time_craft/model/checkout_model.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/model/order_model.dart';
import 'package:time_craft/services/firebase/order.dart';
import 'package:time_craft/services/razorpay/razorpay_service.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/checkout/widgets/address_part.dart';
import 'package:time_craft/view/screens/checkout/widgets/payment_part.dart';
import 'package:time_craft/view/screens/checkout/widgets/scrolling_part.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';

class CheckOutScrn extends StatelessWidget {
  CheckOutScrn({super.key, required this.checkoutData});
  final CheckoutModel checkoutData;
  static const String routename = '/Checkout';
  final RazorPayService razorPayService = RazorPayService();
  @override
  Widget build(BuildContext context) {
    razorPayService.razorpayInitialize(context);
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCom(title: 'Checkout'),
        body: Column(
          children: [
            const AddressPart(),
            ScrollingPart(datalist: checkoutData.itemlist),
            const PaymentPart(),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('TOTAL', style: interbold),
                Text('₹${checkoutData.totalPrice}', style: interbold),
              ],
            ),
            sizedboxwithheight(khieght * 0.01),
            placeOrderButton(context: context),
            sizedboxwithheight(khieght * 0.01),
          ],
        ),
      ),
    );
  }

  Widget placeOrderButton({required BuildContext context}) {
    return ElevatedButton(
      onPressed: () {
        orderPlacer(context);
      },
      style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(kwidth * 0.6, khieght * 0.01)),
          backgroundColor: const MaterialStatePropertyAll(black),
          foregroundColor: const MaterialStatePropertyAll(white),
          shape: const MaterialStatePropertyAll(ContinuousRectangleBorder())),
      child: const Text('PLACE ORDER'),
    );
  }

  orderPlacer(BuildContext context) {
    PaymentSelector payController = Provider.of<PaymentSelector>(context, listen: false);
    CheckoutAddControl addControl = Provider.of<CheckoutAddControl>(context, listen: false);

    if (addControl.address != null) {
      if (payController.israzorpay) {
        razorPayService.pay(
            totalPrice: checkoutData.totalPrice,
            address: addControl.address!,
            cartList: checkoutData.itemlist);
      } else {
        String date = DateTime.now().toString();
        OrderModel orderData = OrderModel(
            cartlist: checkoutData.itemlist,
            paymentId: 'COD',
            discription: '${FirebaseInstanceModel.uid}Order',
            address: addControl.address!,
            israzorpay: false,
            userid: FirebaseInstanceModel.uid,
            totalPrice: checkoutData.totalPrice,
            orderPlacedDate: date,
            orderStatus: 'Order Placed');
        OrderServices(orderData, context: context).addOrder();
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(snackBarDesign(text: 'Address not selected'));
    }
  }
}
