import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/product/varient_controller.dart';
import 'package:time_craft/model/product_argument.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/product/widgets/product_delivery_and_details.dart';
import 'package:time_craft/view/screens/product/widgets/product_img_pageview.dart';
import 'package:time_craft/view/screens/product/widgets/product_name_to_discription_part.dart';
import 'package:time_craft/view/screens/product/widgets/product_varients_to_last.dart';

class ProductScrollingPart extends StatelessWidget {
  const ProductScrollingPart({super.key, required this.data});
  final ProductArgument data;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductPageview(imagelist: data.data['imagelist']),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kwidth * 0.08),
              child: ProductNameToDiscription(
                discount: data.data['discount'],
                discription: data.data['discription'],
                name: data.data['name'],
                price: data.data['price'],
                smallDiscription: data.data['smalldiscription'],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kwidth * 0.08),
              child: ProductDeliveryAndDetails(
                  isAnalog: data.data['isAnalog'], isWaterResistant: data.data['isWaterResistant']),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kwidth * 0.08),
              child: ChangeNotifierProvider(
                create: (context) => VarientController(),
                child: ProductVarientsToLast(
                  varients: data.data['varients'],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
