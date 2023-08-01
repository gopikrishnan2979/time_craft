import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/checkout_address_controller.dart';
import 'package:time_craft/model/address_model.dart';
import 'package:time_craft/model/arg_models/address_scrn_arg.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/address/address_scrn.dart';

class AddressPart extends StatelessWidget {
  const AddressPart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutAddControl>(
      builder: (context, addController, child) {
        AddressModel? address = addController.address;
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: kwidth * 0.05, vertical: khieght * 0.02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Shipping Address', style: interbold),
              sizedboxwithheight(khieght * 0.01),
              InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed(AddressScrn.routename,
                      arguments: AddressScrnArg(checkoutAddControl: addController));
                },
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: kwidth * 0.05),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(khieght * 0.01),
                      border: Border.all(color: Colors.grey)),
                  height: khieght * 0.15,
                  width: kwidth * 0.9,
                  child: address == null ? addressIsEmpty() : addressIsNotEmpty(address: address),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget addressIsEmpty() {
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.add_location_alt_outlined, color: Colors.grey),
          Text('Add location', style: GoogleFonts.inter(color: Colors.grey))
        ],
      ),
    );
  }

  Widget addressIsNotEmpty({required AddressModel address}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('${address.localAddress},'),
        Text('${address.city},${address.district},'),
        Text('${address.state},'),
        Text('Pin:${address.pincode}'),
        address.landmark != 'no landmark'
            ? Text('landmark:${address.landmark}', overflow: TextOverflow.ellipsis)
            : const SizedBox(),
      ],
    );
  }
}
