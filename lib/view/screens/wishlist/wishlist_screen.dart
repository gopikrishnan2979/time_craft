import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/wishlist_controller.dart';
import 'package:time_craft/controller/wishlist_icon_controller.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/model/product_argument.dart';
import 'package:time_craft/model/product_model.dart';
import 'package:time_craft/view/common/widgets/loading.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/common/widgets/item_card.dart';
import 'package:time_craft/view/screens/product/product_details.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});
  static const String routename = '/Wishlist';

  @override
  Widget build(BuildContext context) {
    WishlistController wishlistCon = Provider.of<WishlistController>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: const AppbarCom(title: 'Wishlist'),
        body: Consumer<WishlistController>(builder: (context, wishlistCon, child) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: khieght * 0.32,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5),
            itemBuilder: (context, index) => StreamBuilder(
                stream: FirebaseInstanceModel.products.doc(wishlistCon.wishlist[index]).snapshots(),
                builder: (context, itemsnapshot) {
                  if (itemsnapshot.data == null) {
                    return const Loading();
                  }
                  late WishlistIconController iconController;
                  return ChangeNotifierProvider(
                    create: (context) {
                      iconController = WishlistIconController(
                          isInWishlist: wishlistCon.wishlist.contains(itemsnapshot.data!.id),
                          productid: itemsnapshot.data!.id);
                      return iconController;
                    },
                    child: InkWell(
                      onTap: () {
                        var data = itemsnapshot.data!;
                        Navigator.of(context).pushNamed(ProductDetails.routename,
                            arguments: ProductArgument(
                                iconController: iconController,
                                data: productmodelMaker(data),
                                id: itemsnapshot.data!.id));
                      },
                      child: ItemCard(
                        productId: itemsnapshot.data!.id,
                        name: itemsnapshot.data!['name'],
                        imagepath: itemsnapshot.data!['imagelist'][0],
                        smallDiscription: itemsnapshot.data!['smalldiscription'],
                        discount: itemsnapshot.data!['discount'],
                        price: itemsnapshot.data!['price'],
                      ),
                    ),
                  );
                }),
            padding: const EdgeInsets.all(8),
            itemCount: wishlistCon.wishlist.length,
          );
        }),
      ),
    );
  }
}
