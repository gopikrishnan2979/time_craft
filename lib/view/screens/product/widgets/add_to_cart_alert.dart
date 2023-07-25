import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/product/qty_controller.dart';
import 'package:time_craft/controller/product/varient_controller.dart';
import 'package:time_craft/services/firebase/cart.dart';
import 'package:time_craft/view/core/styles.dart';

class AddToCartAlert extends StatelessWidget {
  const AddToCartAlert(
      {super.key,
      required this.name,
      required this.price,
      required this.ctx,
      required this.varientList,
      required this.productId});

  final String name;
  final String productId;
  final int price;
  final BuildContext ctx;
  final List varientList;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'ADD TO CART',
        style: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      contentPadding: EdgeInsets.symmetric(horizontal: kwidth * 0.1, vertical: khieght * 0.01),
      content: ChangeNotifierProvider.value(
        value: Provider.of<QtyController>(ctx),
        child: SizedBox(
          height: khieght * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(name, style: interbold),
              Row(
                children: [
                  Text('QTY  :', style: inter),
                  SizedBox(width: kwidth * 0.05),
                  Consumer<QtyController>(builder: (context, value, child) {
                    return SizedBox(
                      width: kwidth * 0.2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          incAndDecButton(icon: Icons.remove, controller: value),
                          Text('${value.qty}', style: GoogleFonts.inter(fontSize: 20)),
                          incAndDecButton(icon: Icons.add, isAdd: true, controller: value)
                        ],
                      ),
                    );
                  })
                ],
              ),
              Row(
                children: [
                  Text('Cost :', style: inter),
                  Consumer<QtyController>(
                    builder: (context, value, child) {
                      return Text(' ₹${price * value.qty}', style: inter);
                    },
                  )
                ],
              ),
              addtocartbutton(
                context: context,
                price: price,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //increment and decrement button
  
  Widget incAndDecButton(
      {required IconData icon, required QtyController controller, bool isAdd = false}) {
    return InkWell(
      onTap: () {
        if (isAdd) {
          controller.incrementQty();
        } else {
          controller.decrementQty();
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(khieght * 0.0125),
        child: ColoredBox(
          color: black,
          child: SizedBox(
            width: khieght * 0.025,
            height: khieght * 0.025,
            child: Icon(
              icon,
              color: white,
              size: khieght * 0.02,
            ),
          ),
        ),
      ),
    );
  }

  //adding to cart button

  Widget addtocartbutton({required BuildContext context, required int price}) {
    return ElevatedButton(
      onPressed: () {
        QtyController qtyController = Provider.of<QtyController>(ctx, listen: false);
        VarientController vntController = Provider.of<VarientController>(ctx, listen: false);
        CartService(context: ctx).addToCart(
            productId: productId,
            varient: varientList[vntController.selectedIdx],
            qty: qtyController.qty,
            price: price);
        Navigator.of(context).pop();
      },
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(Size(kwidth * 0.5, khieght * 0.02)),
        backgroundColor: const MaterialStatePropertyAll(black),
        shape: const MaterialStatePropertyAll(ContinuousRectangleBorder()),
      ),
      child: Text('Add to cart', style: interwhitebold),
    );
  }
}
