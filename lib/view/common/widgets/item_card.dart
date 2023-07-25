import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';

class ItemCard extends StatelessWidget {
  const ItemCard(
      {super.key,
      required this.productId,
      required this.imagepath,
      required this.discount,
      required this.price,
      required this.name,
      required this.smallDiscription});
  final String imagepath;
  final int discount;
  final int price;
  final String name;
  final String smallDiscription;
  final String productId;

  @override
  Widget build(BuildContext context) {
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
              Image.network(
                  width: kwidth * 0.5, height: khieght * 0.2, fit: BoxFit.cover, imagepath),
              Positioned(
                right: 0,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_border,
                    size: 28,
                    color: black,
                  ),
                ),
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
                  Text(name,
                      style: GoogleFonts.inter(
                        fontSize: 16,
                      )),
                  Text(smallDiscription, style: inter),
                  Row(
                    children: [
                      Text(
                        '$discount% OFF',
                        style: GoogleFonts.inter(color: Colors.green),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
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
