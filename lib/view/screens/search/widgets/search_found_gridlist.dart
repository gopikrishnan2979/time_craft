import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/search_controller.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/item_card.dart';

class SearchFoundGrid extends StatelessWidget {
  SearchFoundGrid({super.key});
  final CollectionReference allproduct = FirebaseFirestore.instance.collection('product');
  @override
  Widget build(BuildContext context) {
    SearchProvider value = Provider.of<SearchProvider>(context, listen: false);
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: khieght * 0.32,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5),
      padding: const EdgeInsets.all(5),
      itemBuilder: (context, index) {
        return ItemCard(
          productId: value.searchlist[index].id,
          name: value.searchlist[index]['name'],
          imagepath: value.searchlist[index]['imagelist'][0],
          smallDiscription: value.searchlist[index]['smalldiscription'],
          discount: value.searchlist[index]['discount'],
          price: value.searchlist[index]['price'],
        );
      },
      itemCount: value.searchlist.length,
    );
  }
}
