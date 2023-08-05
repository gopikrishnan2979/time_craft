import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/product_qty_controller.dart';
import 'package:time_craft/controller/product_varient_controller.dart';
import 'package:time_craft/model/checkout_model.dart';
import 'package:time_craft/model/product_model.dart';
import 'package:time_craft/services/firebase/cart.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/checkout/checkout.dart';

class QtyAlert extends StatelessWidget {
  final bool isToCart;
  final BuildContext ctx;
  final ProductModel data;
  const QtyAlert({super.key, required this.ctx, required this.isToCart, required this.data});

  @override
  Widget build(BuildContext context) {
    Provider.of<QtyController>(ctx, listen: false).qty = 1;
    return AlertDialog(
      title: Text('ADD TO CART', style: inter16bold),
      contentPadding: EdgeInsets.symmetric(horizontal: kwidth * 0.1, vertical: khieght * 0.01),
      content: ChangeNotifierProvider.value(
        value: Provider.of<QtyController>(ctx, listen: false),
        child: SizedBox(
          height: khieght * 0.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(data.name, style: interbold),
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
                      return Text(' ₹${data.price * value.qty}', style: inter);
                    },
                  )
                ],
              ),
              confirmButton(context: context, isToCart: isToCart),
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
            child: Icon(icon, color: white, size: khieght * 0.02),
          ),
        ),
      ),
    );
  }

  //adding to cart button

  Widget confirmButton({required BuildContext context, required bool isToCart}) {
    return ElevatedButton(
      onPressed: () {
        if (isToCart) {
          addToCart(context: context);
        } else {
          buyNow(context: context);
        }
      },
      style: ButtonStyle(
        fixedSize: MaterialStatePropertyAll(Size(kwidth * 0.5, khieght * 0.02)),
        backgroundColor: const MaterialStatePropertyAll(black),
        shape: const MaterialStatePropertyAll(ContinuousRectangleBorder()),
      ),
      child: Text(isToCart ? 'Add to cart' : 'Buy Now', style: interwhitebold),
    );
  }

  addToCart({required BuildContext context}) {
    QtyController qtyController = Provider.of<QtyController>(ctx, listen: false);
    VarientController vntController = Provider.of<VarientController>(ctx, listen: false);
    int varientIndex = vntController.selectedIdx;
    String varient = data.varients[varientIndex];
    int qty = qtyController.qty;
    CartService(context: ctx).addToCart(
      productId: data.id,
      varient: varient,
      qty: qty,
      price: data.price,
      name: data.name,
      imageLink: data.imagelist[0],
    );
    Navigator.of(context).pop();
  }

  buyNow({required BuildContext context}) {
    QtyController qtyController = Provider.of<QtyController>(ctx, listen: false);
    VarientController vntController = Provider.of<VarientController>(ctx, listen: false);
    int qty = qtyController.qty;
    int varientIndex = vntController.selectedIdx;
    Navigator.of(context).pop();
    Navigator.of(ctx).pushNamed(
      CheckOutScrn.routename,
      arguments: CheckoutModel(
        itemlist: [
          data.toCartModelConverter(varientIndex: varientIndex, quantity: qty),
        ],
        totalPrice: (data.price * qtyController.qty),
      ),
    );
  }
}
