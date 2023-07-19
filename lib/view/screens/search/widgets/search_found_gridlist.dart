import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/item_card.dart';

class SearchFoundGrid extends StatelessWidget {
  SearchFoundGrid({super.key});
  final CollectionReference allproduct = FirebaseFirestore.instance.collection('product');
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: allproduct.snapshots(),
        builder: (context, snapshot) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: khieght * 0.32,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            padding: const EdgeInsets.all(5),
            itemBuilder: (context, index) => ItemCard(
              name: snapshot.data!.docs[index]['name'],
              imagepath: snapshot.data!.docs[index]['imagelist'][0],
              smallDiscription: snapshot.data!.docs[index]['smalldiscription'],
              discount: snapshot.data!.docs[index]['discount'],
              price: snapshot.data!.docs[index]['price'],
            ),
            itemCount: 10,
          );
        });
  }
}
