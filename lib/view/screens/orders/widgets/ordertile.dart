import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';

class OrderTile extends StatelessWidget {
  const OrderTile({super.key, required this.image, required this.orderId, required this.title,required this.orderStatus});
  final String image;
  final String title;
  final String orderId;
  final String orderStatus;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: kwidth * 0.2,
            height: kwidth * 0.2,
            child: Image.network(image, fit: BoxFit.fitHeight),
          ),
          SizedBox(
            width: kwidth * 0.4,
            height: kwidth * 0.2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(title), Text(orderId, overflow: TextOverflow.ellipsis), Text(orderStatus)],
            ),
          ),
          SizedBox(
            width: kwidth * 0.1,
            height: kwidth * 0.2,
            child: const Icon(
              Icons.navigate_next_outlined,
              size: 40,
            ),
          )
        ],
      ),
    );
  }
}
