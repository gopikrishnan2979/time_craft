import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/model/arg_models/product_scrn_arg.dart';
import 'package:time_craft/model/product_model.dart';
import 'package:time_craft/view/common/widgets/loading.dart';
import 'package:time_craft/view/common/widgets/network_error_widget.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/item_card.dart';
import 'package:time_craft/view/screens/product/product_details.dart';

class KidsScreen extends StatelessWidget {
  const KidsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        StreamBuilder(
          stream: FirebaseInstanceModel.products.snapshots(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return const Loading();
            }
            List<QueryDocumentSnapshot<Object?>> datalist = snapshot.data!.docs
                .where((element) => element['gender'] == 'Kid' || element['gender'] == 'All')
                .toList();
            if (datalist.isEmpty) {
              return const Loading();
            }

            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: khieght * 0.32,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              padding: const EdgeInsets.all(5),
              itemCount: datalist.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    var data = datalist[index];
                    Navigator.of(context).pushNamed(
                      ProductDetails.routename,
                      arguments: ProductScrnArgument(data: productmodelMaker(data)),
                    );
                  },
                  child: ItemCard(
                    productId: datalist[index].id,
                    name: datalist[index]['name'],
                    imagepath: datalist[index]['imagelist'][0],
                    smallDiscription: datalist[index]['smalldiscription'],
                    discount: datalist[index]['discount'],
                    price: datalist[index]['price'],
                  ),
                );
              },
            );
          },
        ),
        const Positioned(child: NetworkErrorWidget())
      ],
    );
  }
}
