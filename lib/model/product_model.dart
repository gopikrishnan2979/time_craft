import 'package:time_craft/model/cart_model.dart';

class ProductModel {
  String id;
  List imagelist;
  String name;
  String discription;
  String smalldiscription;
  String brand;
  String gender;
  int discount;
  int price;
  bool isanalog;
  bool isWaterResistant;
  List varients;

  ProductModel(
      {required this.imagelist,
      required this.name,
      required this.discription,
      required this.smalldiscription,
      required this.brand,
      required this.gender,
      required this.discount,
      required this.price,
      required this.isWaterResistant,
      required this.isanalog,
      required this.id,
      required this.varients});

  // To cartModel converter
 CartModel toCartModelConverter({required int varientIndex, required int quantity}) {
    return CartModel(
        productId: id,
        price: price,
        quantity: quantity,
        varient: varients[varientIndex],
        name: name,
        imageLink: imagelist[0],
        totalprice: quantity * price);
  }
}

ProductModel productmodelMaker(var data) {
  return ProductModel(
      imagelist: data['imagelist'],
      id: data.id,
      name: data['name'],
      discription: data['discription'],
      smalldiscription: data['smalldiscription'],
      brand: data['brand'],
      gender: data['gender'],
      discount: data['discount'],
      price: data['price'],
      isWaterResistant: data['isWaterResistant'],
      isanalog: data['isAnalog'],
      varients: data['varients']);
}
