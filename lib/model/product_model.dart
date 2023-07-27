class ProductModel {
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
      required this.varients});
}

ProductModel productmodelMaker(var data) {
    return ProductModel(
        imagelist: data['imagelist'],
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
