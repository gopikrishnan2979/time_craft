import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/item_card.dart';
import 'package:time_craft/view/screens/product/product_details.dart';

class KidsScreen extends StatelessWidget {
  const KidsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: khieght * 0.32,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) => InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(ProductDetails.routename);
        },
        child: ItemCard(imagepath: imgpath, discount: 70, price: 799),
      ),
      itemCount: 4,
    );
  }
}
