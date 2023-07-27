import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/wishlist_controller.dart';
import 'package:time_craft/controller/wishlist_icon_controller.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/model/product_argument.dart';
import 'package:time_craft/model/product_model.dart';
import 'package:time_craft/view/common/widgets/loading.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/item_card.dart';
import 'package:time_craft/view/screens/product/product_details.dart';

class MensScreen extends StatelessWidget {
  const MensScreen({super.key});

  @override
  Widget build(BuildContext context) {
    WishlistController wishlistCon = Provider.of<WishlistController>(context, listen: false);
    return StreamBuilder(
        stream: FirebaseInstanceModel.products.snapshots(),
        builder: (context, snapshot) {
          if (snapshot.data == null) {
            return const Loading();
          }
          List<QueryDocumentSnapshot<Object?>> datalist = snapshot.data!.docs
              .where((element) => element['gender'] == 'Men' || element['gender'] == 'All')
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
            itemBuilder: (context, index) {
              late WishlistIconController iconController;
              return ChangeNotifierProvider(
                create: (context) {
                  iconController = WishlistIconController(
                      isInWishlist: wishlistCon.wishlist.contains(datalist[index].id),
                      productid: datalist[index].id);
                  return iconController;
                },
                child: InkWell(
                  onTap: () {
                    var data = datalist[index];
                    Navigator.of(context).pushNamed(ProductDetails.routename,
                        arguments: ProductArgument(
                            data: productmodelMaker(data),
                            id: datalist[index].id,
                            iconController: iconController));
                  },
                  child: ItemCard(
                    productId: datalist[index].id,
                    name: datalist[index]['name'],
                    imagepath: datalist[index]['imagelist'][0],
                    smallDiscription: datalist[index]['smalldiscription'],
                    discount: datalist[index]['discount'],
                    price: datalist[index]['price'],
                  ),
                ),
              );
            },
            itemCount: datalist.length,
          );
        });
  }
}
