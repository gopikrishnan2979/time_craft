import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/common/widgets/item_card.dart';
import 'package:time_craft/view/screens/product/product_details.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  static const String routename = '/Wishlist';

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCom(title: 'Wishlist'),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: khieght * 0.32,
              crossAxisSpacing: 5,
              mainAxisSpacing: 5),
          itemBuilder: (context, index) => InkWell(
            onTap: () {
              Navigator.of(context).pushNamed(ProductDetails.routename);
            },
            child: const ItemCard(
                imagepath:
                    'https://img.tatacliq.com/images/i11/437Wx649H/MP000000017555695_437Wx649H_202305151743161.jpeg',
                discount: 80,
                price: 699),
          ),
          padding: const EdgeInsets.all(8),
          itemCount: 7,
        ),
      ),
    );
  }
}
