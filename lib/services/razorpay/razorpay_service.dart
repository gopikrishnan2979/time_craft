import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:time_craft/model/address_model.dart';
import 'package:time_craft/model/cart_model.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/model/order_model.dart';
import 'package:time_craft/services/firebase/order.dart';
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
    String paymentId = FirebaseInstanceModel.uid + uniqueId;
    String orderDiscription = '${FirebaseInstanceModel.uid}Order';
    Map<String, dynamic> options = {
      'key': _razorpaykey,
      'amount': totalPrice * 100,
      'currency': 'INR',
      'name': 'Timecraft',
      'description': orderDiscription,
      'retry': {'enabled': true, 'max_count': 1},
      'send_sms_hash': true,
      'prefill': {'contact': '7306062899', 'email': 'gopikrishnan2979@gmail.com'},
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
        userid: FirebaseInstanceModel.uid,
        address: address,
        orderStatus: 'Order Placed',
        orderPlacedDate: date,
        totalPrice: totalPrice);
    _razorpay.open(options);
  }

  //Payment is success
  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
        _snackBar(message: 'Payment Successful', color: const Color.fromARGB(149, 107, 255, 112)));

    OrderServices(_order, context: context).addOrder();
  }

  //Payment failed to proceed;
  void _handlePaymentError(PaymentFailureResponse response) {
    alertshower('Payment Failed', context);
  }

  //wallet payment selected
  void _handleExternalWallet(ExternalWalletResponse response) {
    ScaffoldMessenger.of(context).showSnackBar(
        _snackBar(message: 'Wallet selected', color: Color.fromARGB(149, 107, 255, 112)));
  }

// snackbar showing success
  SnackBar _snackBar({required String message, required Color color}) {
    return SnackBar(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 800),
        margin: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
        elevation: 15,
        content: Center(
          child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
              child: Text(
                message,
                style: GoogleFonts.ptSerif(color: white, fontSize: 16),
              )),
        ),
        backgroundColor: color);
  }

//alert showing error
  alertshower(String message, BuildContext context) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Alert'),
        content: Text(message),
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
