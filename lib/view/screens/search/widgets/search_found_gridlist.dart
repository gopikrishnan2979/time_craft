import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/search_controller.dart';
import 'package:time_craft/model/arg_models/product_scrn_arg.dart';
import 'package:time_craft/model/product_model.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/item_card.dart';
import 'package:time_craft/view/screens/product/product_details.dart';

class SearchFoundGrid extends StatelessWidget {
  final CollectionReference allproduct = FirebaseFirestore.instance.collection('product');
  SearchFoundGrid({super.key});

  @override
  Widget build(BuildContext context) {
    SearchProvider searchValue = Provider.of<SearchProvider>(context, listen: false);
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: khieght * 0.32,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      padding: const EdgeInsets.all(5),
      itemCount: searchValue.searchlist.length,
      itemBuilder: (context, index) {
        var data = searchValue.searchlist[index];
        return InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(ProductDetails.routename,
                arguments: ProductScrnArgument(data: productmodelMaker(data)));
          },
          child: ItemCard(
            productId: data.id,
            name: data['name'],
            imagepath: data['imagelist'][0],
            smallDiscription: data['smalldiscription'],
            discount: data['discount'],
            price: data['price'],
          ),
        );
      },
    );
  }
}
