import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/wishlist_controller.dart';
import 'package:time_craft/view/core/styles.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {super.key,
      required this.productId,
      required this.imagepath,
      required this.discount,
      required this.price,
      required this.name,
      required this.smallDiscription,
      this.isfromwishlist = false});
  final String imagepath;
  final int discount;
  final int price;
  final String name;
  final String smallDiscription;
  final String productId;
  final bool isfromwishlist;

  @override
  Widget build(BuildContext context) {
    WishlistController wishlistCon = Provider.of<WishlistController>(context, listen: false);
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.grey,
          ),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 1.0,
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              SizedBox(
                width: kwidth * 0.5,
                height: khieght * 0.2,
                child: Image.network(
                  width: kwidth * 0.5,
                  height: khieght * 0.2,
                  fit: BoxFit.fitHeight,
                  imagepath,
                  errorBuilder: (context, error, stackTrace) => errorShower(),
                ),
              ),
              Positioned(
                right: 0,
                child: Consumer<WishlistController>(builder: (context, wishlistcontroller, child) {
                  return IconButton(
                    onPressed: () {
                      if (wishlistcontroller.wishlist.contains(productId)) {
                        wishlistCon.remove(productId: productId, context: context);
                      } else {
                        wishlistCon.add(productId: productId, context: context);
                      }
                    },
                    icon: Icon(
                      wishlistcontroller.wishlist.contains(productId)
                          ? Icons.favorite
                          : Icons.favorite_border,
                      size: 28,
                      color: black,
                    ),
                  );
                }),
              )
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(name, style: GoogleFonts.inter(fontSize: 16)),
                  Text(smallDiscription, overflow: TextOverflow.ellipsis, style: inter),
                  Row(
                    children: [
                      Text('$discount% OFF', style: GoogleFonts.inter(color: Colors.green)),
                      const SizedBox(width: 30),
                      Text('₹$price')
                    ],
                  ),
                  Text('Delivery in 5 days', style: GoogleFonts.inter(fontSize: 10)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
