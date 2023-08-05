import 'package:flutter/material.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';
import 'package:time_craft/view/core/styles.dart';

class ProductPageview extends StatelessWidget {
  const ProductPageview({super.key, required this.imagelist});
  final List imagelist;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: khieght * 0.5,
      width: double.infinity,
      child: PageView.builder(
        itemCount: imagelist.length,
        itemBuilder: (context, index) => SizedBox(
          width: double.infinity,
          child: Image.network(
            imagelist[index],
            fit: BoxFit.fitHeight,
            errorBuilder: (context, error, stackTrace) => errorShower(),
          ),
        ),
      ),
    );
  }
}
