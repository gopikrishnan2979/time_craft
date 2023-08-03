import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:order_tracker_zen/order_tracker_zen.dart';
import 'package:time_craft/model/order_model.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/checkout/widgets/checkout_item_tile.dart';

class OrderDetails extends StatelessWidget {
  const OrderDetails({super.key, required this.orderDetails, required this.orderId});
  final OrderModel orderDetails;
  final String orderId;
  static const String routename = '/Orderdetails';
  @override
  Widget build(BuildContext context) {
    String payment = orderDetails.israzorpay! ? 'Razorpay' : 'Cash on Delivery';
    return SafeArea(
        child: Scaffold(
      appBar: const AppbarCom(title: 'Order Details'),
      body: ListView(
        padding: EdgeInsets.all(kwidth * 0.05),
        children: [
          Row(
            children: [
              const Icon(Icons.shopping_cart_outlined),
              Text('ITEMS', style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold)),
            ],
          ),
          sizedboxwithheight(khieght * 0.008),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: orderDetails.cartlist!.length,
            itemBuilder: (context, index) => CheckoutItemTile(data: orderDetails.cartlist![index]),
            separatorBuilder: (context, index) => const Divider(),
          ),
          sizedboxwithheight(khieght * 0.05),
          Text(
            'Order ID: $orderId',
            style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          sizedboxwithheight(khieght * 0.008),
          Text(
            'Total Price: ${orderDetails.totalPrice}',
            style: orderText,
          ),
          sizedboxwithheight(khieght * 0.008),
          Text(
            'Payment Method: $payment',
            style: orderText,
          ),
          sizedboxwithheight(khieght * 0.008),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Delivering Address :',
                style: orderText,
              ),
              SizedBox(
                width: kwidth * 0.5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${orderDetails.address!.localAddress},',
                      style: orderText,
                    ),
                    Text(
                      '${orderDetails.address!.city},${orderDetails.address!.district},',
                      style: orderText,
                    ),
                    Text(
                      '${orderDetails.address!.state},',
                      style: orderText,
                    ),
                    Text(
                      'Pin:${orderDetails.address!.pincode}',
                      style: orderText,
                    ),
                    orderDetails.address!.landmark != 'no landmark'
                        ? Text(
                            'landmark:${orderDetails.address!.landmark}',
                            style: orderText,
                            overflow: TextOverflow.ellipsis,
                          )
                        : const SizedBox(),
                  ],
                ),
              )
            ],
          ),
          sizedboxwithheight(khieght * 0.05),
          OrderTrackerZen(
              tracker_data: tracker(
                  status: orderDetails.orderStatus!,
                  orderdate: orderDetails.orderPlacedDate,
                  shippedDate: orderDetails.shippingDate,
                  outForDeliveryDate: orderDetails.outForDeliveryDate,
                  deliveryDate: orderDetails.deliveryDate))
        ],
      ),
    ));
  }

  List<TrackerData> tracker({
    required String status,
    required String? orderdate,
    required String? shippedDate,
    required String? outForDeliveryDate,
    required String? deliveryDate,
  }) {
    List<TrackerData> trackerdata = [];

    trackerdata.add(trackerMaker(
        title: 'Order Placed', date: orderdate!, displaytext: 'Your order is placed on'));
    if (shippedDate != 'Not setted') {
      trackerdata.add(trackerMaker(
          title: 'Order Shipped', date: shippedDate!, displaytext: 'Your order is shipped on'));
    }
    if (outForDeliveryDate != 'Not setted') {
      trackerdata.add(trackerMaker(
          title: 'Out For Delivery',
          date: outForDeliveryDate!,
          displaytext: 'Your order is out for delivery on'));
    }
    if (deliveryDate != 'Not setted') {
      trackerdata.add(trackerMaker(
          title: 'Order Delivered',
          date: deliveryDate!,
          displaytext: 'Your order is succussfully delivered'));
    }
    return trackerdata;
  }

  trackerMaker({required String title, required String date, required displaytext}) {
    return TrackerData(
        title: title,
        date: date.substring(0, 10),
        tracker_details: [TrackerDetails(title: displaytext, datetime: date.substring(0, 16))]);
  }
}
