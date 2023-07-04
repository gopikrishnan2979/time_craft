import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/checkout/widgets/address_adding.dart';
import 'package:time_craft/view/screens/checkout/widgets/checkout_item_tile.dart';

class ScrollingPart extends StatelessWidget {
  const ScrollingPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: kwidth * 0.05, vertical: khieght * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Shipping Address',
                style: interbold,
              ),
              sizedboxwithheight(khieght * 0.01),
              InkWell(
                onTap: () {
                  _addAddress(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(khieght * 0.01),
                      border: Border.all(
                        color: Colors.grey,
                      )),
                  height: khieght * 0.15,
                  child: Center(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.add_location_alt_outlined,
                          color: Colors.grey,
                        ),
                        Text(
                          'Add location',
                          style: GoogleFonts.inter(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              sizedboxwithheight(khieght * 0.01),
              Text(
                'Order list',
                style: interbold,
              ),
              sizedboxwithheight(khieght * 0.01),
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) => const CheckoutItemTile(),
                separatorBuilder: (context, index) => const Divider(),
                itemCount: 2,
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<dynamic> _addAddress(BuildContext context) {
    return showModalBottomSheet(
        useSafeArea: true,
        context: context,
        constraints: BoxConstraints(minWidth: kwidth),
        isScrollControlled: true,
        backgroundColor: black,
        builder: (context) {
          return const AddressAdding();
        });
  }
}
