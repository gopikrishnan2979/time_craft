import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/product/widgets/product_delivery_and_details.dart';
import 'package:time_craft/view/screens/product/widgets/product_img_pageview.dart';
import 'package:time_craft/view/screens/product/widgets/product_name_to_discription_part.dart';
import 'package:time_craft/view/screens/product/widgets/product_varients_to_last.dart';

class ProductScrollingPart extends StatelessWidget {
  const ProductScrollingPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProductPageview(),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: kwidth * 0.08),
                      child: const ProductNameToDiscription(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: kwidth * 0.08),
                      child: const ProductDeliveryAndDetails(),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: kwidth * 0.08),
                      child: const ProductVarientsToLast(),
                    ),
                  ],
                ),
              ),
            );
  }
}