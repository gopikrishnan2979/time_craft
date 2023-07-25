import 'package:flutter/material.dart';
import 'package:time_craft/model/firebase_instance_model.dart';
import 'package:time_craft/view/common/widgets/loading.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/cart/widgets/cart_tile.dart';

class CartItems extends StatelessWidget {
  const CartItems({super.key});

  @override
  Widget build(BuildContext context) {
    bool isempty = true;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //first widget

          StreamBuilder(
              stream: FirebaseInstanceModel.cart
                  .doc(FirebaseInstanceModel.uid)
                  .collection('usercart')
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.data == null) {
                  return const Loading();
                }
                if (snapshot.data!.docs.isEmpty) {
                  isempty = true;
                  return SizedBox(
                      height: khieght * 0.7,
                      child: const Center(child: Text('No product in cart')));
                }
                isempty = false;
                return ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return CartTile(
                        docId: snapshot.data!.docs[index]['productId'],
                        qty: snapshot.data!.docs[index]['qty'],
                        varient: snapshot.data!.docs[index]['varient'],
                      );
                    },
                    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                    separatorBuilder: (context, index) => const Divider(),
                    itemCount: snapshot.data!.docs.length);
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: isempty
                ? const SizedBox()
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      sizedboxwithheight(khieght * 0.2),
                      Text(
                        'PRICE DETAILS',
                        style: inter,
                      ),
                      const Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'SUBTOTAL',
                                style: inter,
                              ),
                              Text('DELIVERY FEE', style: inter)
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [Text('₹1598', style: inter), Text('₹0.00', style: inter)],
                          )
                        ],
                      ),
                      sizedboxwithheight(20),
                      Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: kwidth * 0.05),
                          child: Container(
                            height: 50,
                            color: black,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: kwidth * 0.08),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Total',
                                    style: interwhitebold,
                                  ),
                                  Text('₹1598', style: interwhitebold)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      sizedboxwithheight(30)
                    ],
                  ),
          ),
        ],
      ),
    );
  }
}
