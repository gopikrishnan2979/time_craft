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
                  incAndDecButton(
                    onTap: () async {
                      String? error = await cartController.productQtyDec(index: index);
                      if (error != null && context.mounted) {
                        alertshower(context: context, text: error.toString());
                      }
                    },
                  ),
                  Text(
                    '${cartController.cartList[index].quantity}',
                    style: GoogleFonts.inter(fontSize: 20),
                  ),
                  incAndDecButton(
                    onTap: () async {
                      String? error = await cartController.productQtyInc(index: index);
                      if (error != null && context.mounted) {
                        alertshower(context: context, text: error.toString());
                      }
                    },
                    isInc: true,
                  )
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (_) => _deleteConfirmation(
                    context: context,
                    cartController: cartController,
                  ),
                );
              },
              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll(black)),
              child: Text('DELETE', style: interwhitebold),
            )
          ],
        ),
      ],
    );
  }

  Widget incAndDecButton({bool isInc = false, required Function() onTap}) {
    return InkWell(
      onTap: onTap,
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

  _deleteConfirmation({required BuildContext context, required CartController cartController}) {
    return AlertDialog(
      title: Row(
        children: [
          const Icon(Icons.warning_amber_rounded, color: Colors.red),
          Text(
            'Delete',
            style: GoogleFonts.inter(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      content: const Text('Are you sure, Delete this item'),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Cancel', style: interbold),
        ),
        TextButton(
          onPressed: () async {
            String? error = await cartController.productDelete(index: index);
            if (context.mounted) {
              if (error == null) {
                ScaffoldMessenger.of(context).showSnackBar(
                    snackBarDesign(text: 'Item Deleted From Cart', color: removingColor));
              } else {
                alertshower(text: error, context: context);
              }
              Navigator.of(context).pop();
            }
          },
          child: Text(
            'Delete',
            style: GoogleFonts.inter(
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
