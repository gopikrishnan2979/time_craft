class AddressModel {
  String localAddress;
  String city;
  String district;
  String state;
  String pincode;
  String landmark;
  AddressModel(
      {required this.localAddress,
      required this.city,
      required this.district,
      required this.state,
      required this.pincode,
      required this.landmark});

  AddressModel.fromData({required data})
      : localAddress = data['localAddress'],
        city = data['city'],
        district = data['district'],
        state = data['state'],
        pincode = data['pincode'],
        landmark = data['landmark'];

  Map<String, dynamic> toMap() {
    return {
      'localAddress': localAddress,
      'city': city,
      'district': district,
      'state': state,
      'pincode': pincode,
      'landmark': landmark
    };
  }

}
