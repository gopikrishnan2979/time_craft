import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/wishlist_controllers/wishlist_controller.dart';
import 'package:time_craft/model/arg_models/product_scrn_arg.dart';
import 'package:time_craft/view/common/widgets/notification_widgets.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/product/widgets/qty_alert.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/screens/product/widgets/scrolling_part.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.arg});
  final ProductScrnArgument arg;

  static const routename = '/Product';
  @override
  Widget build(BuildContext context) {
    WishlistController wishlistCon = Provider.of<WishlistController>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        appBar: AppbarCom(
          title: 'Product',
          action: [
            Padding(
              padding: EdgeInsets.only(right: kwidth * 0.03),
              child: Consumer<WishlistController>(builder: (context, wishlistController, child) {
                return IconButton(
                  onPressed: () async {
                    if (wishlistController.wishlist.contains(arg.data.id)) {
                      String? error = await wishlistCon.remove(productId: arg.data.id);
                      if (context.mounted) {
                        if (error == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBarDesign(text: 'Removed from wishlist', color: removingColor));
                        } else {
                          alertshower(text: error, context: context);
                        }
                      }
                    } else {
                      String? error = await wishlistCon.add(productId: arg.data.id);
                      if (context.mounted) {
                        if (error == null) {
                          ScaffoldMessenger.of(context).showSnackBar(
                              snackBarDesign(text: 'Added to wishlist', color: addingColor));
                        } else {
                          alertshower(text: error, context: context);
                        }
                      }
                    }
                  },
                  icon: Icon(
                    wishlistController.wishlist.contains(arg.data.id)
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
        body: Column(
          children: [
            ProductScrollingPart(data: arg),
            SizedBox(
              height: khieght * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      qtyAlert(context: context, isToCart: false);
                    },
                    style: _buttonstyle(),
                    child: _buttonchild('BUY NOW'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      qtyAlert(context: context, isToCart: true);
                    },
                    style: _buttonstyle(),
                    child: _buttonchild('ADD TO CART'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  qtyAlert({required BuildContext context, required bool isToCart}) {
    showDialog(
      context: context,
      builder: (_) => QtyAlert(data: arg.data, isToCart: isToCart, ctx: context),
    );
  }

  ButtonStyle _buttonstyle() {
    return ButtonStyle(
      backgroundColor: const MaterialStatePropertyAll(black),
      foregroundColor: const MaterialStatePropertyAll(white),
      shape: MaterialStatePropertyAll(
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }

  Widget _buttonchild(String text) {
    return SizedBox(
      height: khieght * 0.06,
      width: kwidth * 0.27,
      child: Center(
        child: Text(text, style: interwhitebold),
      ),
    );
  }
}
