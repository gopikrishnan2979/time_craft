import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:time_craft/controller/wishlist_controller.dart';
import 'package:time_craft/controller/wishlist_icon_controller.dart';
import 'package:time_craft/model/checkout_model.dart';
import 'package:time_craft/model/product_argument.dart';
import 'package:time_craft/view/core/styles.dart';
import 'package:time_craft/view/screens/checkout/checkout.dart';
import 'package:time_craft/view/screens/product/widgets/add_to_cart_alert.dart';
import 'package:time_craft/view/common/widgets/appbar.dart';
import 'package:time_craft/view/screens/product/widgets/scrolling_part.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.data});
  final ProductArgument data;

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
              child: ChangeNotifierProvider.value(
                value:data.iconController,
                child:
                    Consumer<WishlistIconController>(builder: (context, iconcontroller, child) {
                  return IconButton(
                    onPressed: () {
                      if (iconcontroller.isInWishlist) {
                        wishlistCon.remove(data.id);
                      } else {
                        wishlistCon.add(data.id);
                      }
                      iconcontroller.toggle(context);
                    },
                    icon: Icon(
                      iconcontroller.isInWishlist ? Icons.favorite : Icons.favorite_border,
                      size: 28,
                      color: black,
                    ),
                  );
                }),
              ),
            )
          ],
        ),
        body: Column(
          children: [
            ProductScrollingPart(data: data),
            SizedBox(
              height: khieght * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      String varient = '';
                      Navigator.of(context).pushNamed(
                        CheckOutScrn.routename,
                        arguments: CheckoutModel(
                          itemlist: [data.id],
                          selectedColor: varient,
                          isfromProductDetails: true,
                        ),
                      );
                    },
                    style: _buttonstyle(),
                    child: _buttonchild('BUY NOW'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (c) => AddToCartAlert(
                            name: data.data.name,
                            price: data.data.price,
                            varientList: data.data.varients,
                            productId: data.id,
                            ctx: context),
                      );
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
