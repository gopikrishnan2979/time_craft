import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/cart_controllers/cart_controller.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';
import 'package:time_craft/view/core/styles.dart';

class CartTile extends StatelessWidget {
  const CartTile({super.key, required this.index});
  final int index;
  @override
  Widget build(BuildContext context) {
    CartController cartController = Provider.of<CartController>(context, listen: false);
    return Row(
      children: [
        SizedBox(
            height: 80,
            width: 80,
            child: Image.network(
              cartController.cartList[index].imageLink!,
              fit: BoxFit.fitHeight,
              errorBuilder: (context, error, stackTrace) => errorShower(),
            )),
        SizedBox(width: kwidth * 0.06),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(cartController.cartList[index].name!, style: GoogleFonts.inter(fontSize: 16)),
            Text('₹${cartController.cartList[index].totalprice}', style: inter),
            Text('Color: ${cartController.cartList[index].varient}', style: inter),
          ],
        ),
        Expanded(child: SizedBox(width: kwidth * 0.1)),
        Column(
          children: [
            SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  incAndDecButton(context: context, index: index),
                  Text(
                    '${cartController.cartList[index].quantity}',
                    style: GoogleFonts.inter(fontSize: 20),
                  ),
                  incAndDecButton(context: context, index: index, isInc: true)
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Provider.of<CartController>(context, listen: false)
                    .productDeleteConfirmation(index: index, context: context);
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(black)),
              child: Text('DELETE', style: interwhitebold),
            )
          ],
        ),
      ],
    );
  }

  Widget incAndDecButton({required BuildContext context, required int index, bool isInc = false}) {
    return InkWell(
      onTap: () {
        CartController controller = Provider.of<CartController>(context, listen: false);
        if (isInc) {
          controller.productQtyInc(index: index, context: context);
        } else {
          controller.productQtyDec(index: index, context: context);
        }
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.5),
        child: ColoredBox(
          color: black,
          child: SizedBox(
            width: 25,
            height: 25,
            child: Icon(
              isInc ? Icons.add : Icons.remove,
              color: white,
              size: 20,
            ),
          ),
        ),
      ),
    );
  }
}
