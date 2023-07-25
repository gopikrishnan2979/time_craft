import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/model/product_argument.dart';
import 'package:time_craft/view/common/widgets/loading.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/item_card.dart';
import 'package:time_craft/view/screens/product/product_details.dart';

class WomenScreens extends StatelessWidget {
  const WomenScreens({super.key});
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseInstanceModel.products.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Loading();
          }
          List<QueryDocumentSnapshot<Object?>> data = snapshot.data!.docs
              .where((element) => element['gender'] == 'Women' || element['gender'] == 'All')
              .toList();
          if (data.isEmpty) {
            return const Loading();
          }
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: khieght * 0.32,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            padding: const EdgeInsets.all(5),
            itemBuilder: (context, index) => InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(ProductDetails.routename,
                      arguments: ProductArgument(data: data[index], id: data[index].id));
                },
                child: ItemCard(
                  productId: data[index].id,
                  name: data[index]['name'],
                  imagepath: data[index]['imagelist'][0],
                  smallDiscription: data[index]['smalldiscription'],
                  discount: data[index]['discount'],
                  price: data[index]['price'],
                )),
            itemCount: data.length,
          );
        });
  }
}
