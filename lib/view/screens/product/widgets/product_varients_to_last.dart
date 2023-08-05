import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/product_varient_controller.dart';
import 'package:time_craft/view/core/styles.dart';

class ProductVarientsToLast extends StatelessWidget {
  const ProductVarientsToLast({super.key, required this.varients});
  final List varients;
  
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _titletext('Available varients'),
        sizedboxwithheight(khieght * 0.01),
        Consumer<VarientController>(
          builder: (context, varientController, child) {
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisExtent: khieght * 0.045,
                crossAxisSpacing: khieght * 0.005,
                mainAxisSpacing: khieght * 0.005,
              ),
              shrinkWrap: true,
              itemCount: varients.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Center(
                child: InkWell(
                  borderRadius: BorderRadius.circular(15),
                  onTap: () {
                    varientController.changeindex(index);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: index == varientController.selectedIdx
                          ? const Color.fromARGB(255, 151, 205, 255)
                          : black,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(varients[index], style: interwhite),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
        sizedboxwithheight(khieght * 0.02),
      ],
    );
  }

  Widget _titletext(String text) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      sizedboxwithheight(khieght * 0.01),
      Text(text, style: inter),
    ]);
  }
}
