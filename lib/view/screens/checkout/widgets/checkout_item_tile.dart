import 'package:flutter/material.dart';
import 'package:time_craft/model/cart_model.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';
import 'package:time_craft/view/core/styles.dart';

class CheckoutItemTile extends StatelessWidget {
  const CheckoutItemTile({super.key, required this.data});
  final CartModel data;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: khieght * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: khieght * 0.1,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(khieght * 0.01),
              border: Border.all(color: Colors.grey),
              image: DecorationImage(
                fit: BoxFit.fitHeight,
                onError: (exception, stackTrace) => errorShower(),
                image: NetworkImage(data.imageLink!),
              ),
            ),
          ),
          SizedBox(
            width: kwidth * 0.4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.name!, style: inter),
                Text("₹${data.price}/qty", style: interbold),
                Text(data.varient!, style: inter)
              ],
            ),
          ),
          Container(
            height: khieght * 0.024,
            width: kwidth * 0.128,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(kwidth * 0.05),
              border: Border.all(),
            ),
            child: Center(
              child: Text('${data.quantity}', style: interbold),
            ),
          )
        ],
      ),
    );
  }
}
