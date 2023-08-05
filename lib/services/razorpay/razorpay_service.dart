import 'package:flutter/material.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:time_craft/model/address_model.dart';
import 'package:time_craft/model/cart_model.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/model/order_model.dart';
import 'package:time_craft/services/firebase/order.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:uuid/uuid.dart';

class RazorPayService {
  RazorPayService();
  final _razorpay = Razorpay();
  final _razorpaykey = 'rzp_test_R6qbZi0qLTSDz3';
  late BuildContext context;
  late OrderModel _order;

  //initialization of razorpay
  razorpayInitialize(BuildContext context) {
    this.context = context;
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

//unique id creator
  String createUuid() {
    const uuid = Uuid();
    return uuid.v4();
  }

//paying the order
  pay({required int totalPrice, required List<CartModel> cartList, required AddressModel address}) {
    String uniqueId = createUuid();
    String paymentId = FirebaseInstances.uid! + uniqueId;
    String orderDiscription = '${FirebaseInstances.uid}Order';
    Map<String, dynamic> options = {
      'key': _razorpaykey,
      'amount': totalPrice * 100,
      'currency': 'INR',
      'name': 'Timecraft',
      'description': orderDiscription,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': FirebaseInstances.userPhone, 'email': 'gopikrishnan2979@gmail.com'},
      'external': {
        'wallets': ['paytm']
      }
    };
    String date = DateTime.now().toString();
    _order = OrderModel(
      cartlist: cartList,
      paymentId: paymentId,
      discription: orderDiscription,
      israzorpay: true,
      userid: FirebaseInstances.uid,
      address: address,
      orderStatus: 'Order Placed',
      orderPlacedDate: date,
      totalPrice: totalPrice,
      phone: FirebaseInstances.userPhone,
    );
    _razorpay.open(options);
  }

  //Payment is success
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context)
        .showSnackBar(snackBarDesign(text: 'Payment Successful', color: addingColor));

    OrderServices(_order, context: context).addOrder();
  }

  //Payment failed to proceed;
  void _handlePaymentError(PaymentFailureResponse response) {
    ScaffoldMessenger.of(context)
        .showSnackBar(snackBarDesign(text: 'Payment failed', color: removingColor));
  }

  //wallet payment selected
  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context)
        .showSnackBar(snackBarDesign(text: 'Wallet selected', color: addingColor));
  }
}
