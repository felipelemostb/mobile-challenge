import 'dart:convert';

class AddressInfoModel {
  String address;
  String city;
  String country;

  AddressInfoModel({
    required this.address,
    required this.city,
    required this.country,
  });

  Map<String, dynamic> toMap() {
    return {
      "address": address,
      "city": city,
      "country": country,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory AddressInfoModel.fromMap(Map<String, dynamic> map) {
    return AddressInfoModel(
      address: map["address"] ?? "",
      city: map["city"] ?? "",
      country: map["country"] ?? "",
    );
  }

  factory AddressInfoModel.fromJson(String json) =>
      AddressInfoModel.fromMap(jsonDecode(json));

  @override
  String toString() =>
      'AddressInfo(address: $address, city: $city, country: $country)';
}
