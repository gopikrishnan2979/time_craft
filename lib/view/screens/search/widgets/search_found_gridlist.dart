import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/item_card.dart';

class SearchFoundGrid extends StatelessWidget {
  const SearchFoundGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: khieght * 0.32,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              padding: const EdgeInsets.all(5),
              itemBuilder: (context, index) =>
                  ItemCard(imagepath: imgpath, discount: 70, price: 799),
              itemCount: 10,
            );
  }
}