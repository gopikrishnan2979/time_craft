import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/wishlist_controllers/wishlist_controller.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/model/arg_models/product_scrn_arg.dart';
import 'package:time_craft/model/product_model.dart';
import 'package:time_craft/view/common/widgets/loading.dart';
import 'package:time_craft/view/common/widgets/network_error_widget.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/home/widgets/carousel_home.dart';
import 'package:time_craft/view/screens/product/product_details.dart';
import 'package:time_craft/view/common/widgets/item_card.dart';

class AllScreens extends StatelessWidget {
  const AllScreens({super.key});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0), child: CarouselHome()),
              StreamBuilder(
                stream: FirebaseInstances.products.snapshots(),
                builder: (context, snapshot) {
                  if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                    return SizedBox(height: khieght * 0.5, child: const Loading());
                  }
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: snapshot.data!.docs.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: khieght * 0.32,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    padding: const EdgeInsets.only(bottom: 5, left: 5, right: 5),
                    itemBuilder: (context, index) {
                      var data = snapshot.data!.docs[index];
                      return Consumer<WishlistController>(builder: (context, value, child) {
                        return InkWell(
                          onTap: () {
                            Navigator.of(context).pushNamed(
                              ProductDetails.routename,
                              arguments: ProductScrnArgument(data: productmodelMaker(data)),
                            );
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
                      });
                    },
                  );
                },
              ),
              sizedboxwithheight(10)
            ],
          ),
        ),
        const Positioned(child: NetworkErrorWidget())
      ],
    );
  }
}
