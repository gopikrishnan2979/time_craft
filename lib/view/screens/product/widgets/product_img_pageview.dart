import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';

class ProductPageview extends StatelessWidget {
  const ProductPageview({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: khieght * 0.5,
      width: double.infinity,
      child: PageView.builder(
        itemBuilder: (context, index) => SizedBox(
          width: double.infinity,
          child: Image.network(
            imgpath,
            fit: BoxFit.fitHeight,
          ),
        ),
        itemCount: 3,
      ),
    );
  }
}
