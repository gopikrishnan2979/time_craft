import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/model/product_argument.dart';
import 'package:time_craft/view/common/widgets/loading.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/home/widgets/carousel_home.dart';
import 'package:time_craft/view/screens/product/product_details.dart';
import 'package:time_craft/view/common/widgets/item_card.dart';

class AllScreens extends StatelessWidget {
  const AllScreens({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 10.0),
            child: CarouselHome(),
          ),
          StreamBuilder(
            stream: FirebaseInstanceModel.products.snapshots(),
            builder: (context, snapshot) {
              if (snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return SizedBox(height: khieght * 0.5, child: const Loading());
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisExtent: khieght * 0.32,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5,
                ),
                padding: const EdgeInsets.only(
                  bottom: 5,
                  left: 5,
                  right: 5,
                ),
                itemBuilder: (context, index) => InkWell(
                  onTap: () {
                    Navigator.of(context).pushNamed(ProductDetails.routename,
                        arguments: ProductArgument(
                            data: snapshot.data!.docs[index], id: snapshot.data!.docs[index].id));
                  },
                  child: ItemCard(
                    productId: snapshot.data!.docs[index].id,
                    name: snapshot.data!.docs[index]['name'],
                    imagepath: snapshot.data!.docs[index]['imagelist'][0],
                    smallDiscription: snapshot.data!.docs[index]['smalldiscription'],
                    discount: snapshot.data!.docs[index]['discount'],
                    price: snapshot.data!.docs[index]['price'],
                  ),
                ),
                itemCount: snapshot.data!.docs.length,
              );
            },
          ),
          sizedboxwithheight(10)
        ],
      ),
    );
  }
}
