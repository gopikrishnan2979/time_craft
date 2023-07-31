class CartModel {
  String? productId;
  String? name;
  String? imageLink;
  int? price;
  int? totalprice;
  String? varient;
  int? quantity;
  String? cartProductId;
  CartModel({
    this.productId,
    this.cartProductId,
    this.price,
    this.quantity,
    this.varient,
    this.name,
    this.imageLink,
    this.totalprice,
  });

  CartModel.fromData({required data}) {
    cartProductId = data.id;
    price = data['price'] as int;
    productId = data['productId'];
    quantity = data['qty'] as int;
    varient = data['varient'];
    name = data['name'];
    imageLink = data['imageLink'];
    totalprice = (price ?? 0) * (quantity ?? 0);
  }

  CartModel.fromMap({required Map data}){
   cartProductId = data['cartProductId'];
    price = data['price'] as int;
    productId = data['productId'];
    quantity = data['quantity'] as int;
    varient = data['varient'];
    name = data['name'];
    imageLink = data['imageLink'];
    totalprice = data['totalPrice']as int; 
  }
  Map<String,dynamic> toMap() {
    return {
    'cartProductId':cartProductId,
    'price':price ,
    'productId':productId ,
    'quantity':quantity ,
    'varient':varient ,
    'name':name,
    'imageLink':imageLink ,
    'totalPrice':totalprice ,
    };
  }
}
