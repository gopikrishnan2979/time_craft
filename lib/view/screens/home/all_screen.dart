import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/home/widgets/carousel_home.dart';
import 'package:time_craft/view/screens/product/product_details.dart';
import 'package:time_craft/view/common/widgets/item_card.dart';

class AllScreens extends StatelessWidget {
  const AllScreens({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: CarouselHome(),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: khieght * 0.32,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
            itemBuilder: (context, index) => InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(ProductDetails.routename);
              },
              child: ItemCard(imagepath: imgpath, discount: 70, price: 799),
            ),
            itemCount: 10,
          ),
          sizedboxwithheight(10)
        ],
      ),
    );
  }
}
