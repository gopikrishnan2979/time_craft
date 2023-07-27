import 'package:time_craft/controller/wishlist_icon_controller.dart';
import 'package:time_craft/model/product_model.dart';

class ProductArgument {
  String id;
  ProductModel data;
  WishlistIconController iconController;
  ProductArgument({required this.data, required this.id,required this.iconController});
}
