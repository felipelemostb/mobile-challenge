import 'dart:convert';

import 'package:mobile_challenge/data/model/cuisines_model.dart';

import 'address_info_model.dart';
import 'contacts_model.dart';
import 'currency_info_model.dart';
import 'image_model.dart';
import 'location_model.dart';
import 'payments_info_model.dart';
import 'services_model.dart';
import 'subscriptions_model.dart';

class DocsModel {
  SubscriptionsModel subscriptions;
  ServicesModel service;
  PaymentsInfoModel paymentsInfo;
  AddressInfoModel addressInfo;
  ContactsModel contacts;
  LocationModel location;
  ImageModel image;
  List<CuisinesModel> cuisines;
  List<dynamic> additionalInfo;
  String id;
  String name;
  String company;
  int capacity;
  String mealType;
  String createdAt;
  String updatedAt;
  int v;
  String currencyCode;
  String languageCode;
  String timezone;
  String languageInfo;
  CurrencyInfoModel currencyInfo;
  String countryCode;

  DocsModel({
    required this.subscriptions,
    required this.service,
    required this.paymentsInfo,
    required this.addressInfo,
    required this.contacts,
    required this.location,
    required this.image,
    required this.cuisines,
    required this.additionalInfo,
    required this.id,
    required this.name,
    required this.company,
    required this.capacity,
    required this.mealType,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.currencyCode,
    required this.languageCode,
    required this.timezone,
    required this.languageInfo,
    required this.currencyInfo,
    required this.countryCode,
  });

  Map<String, dynamic> toMap() {
    return {
      "subscriptions": subscriptions.toMap(),
      "services": service.toMap(),
      "paymentsInfo": paymentsInfo.toMap(),
      "addressInfo": addressInfo.toMap(),
      "contacts": contacts.toMap(),
      "location": location.toMap(),
      "Image": image.toMap(),
      "cuisines": cuisines.map((e) => e.toMap()),
      "additionalInfo": additionalInfo,
      "_id": id,
      "name": name,
      "company": company,
      "capacity": capacity,
      "mealType": mealType,
      "createdAt": createdAt,
      "updatedAt": updatedAt,
      "__v": v,
      "currencyCode": currencyCode,
      "languageCode": languageCode,
      "timezone": timezone,
      "languageInfo": languageInfo,
      "currencyInfo": currencyInfo.toMap(),
      "countryCode": countryCode,
    };
  }

  factory DocsModel.fromMap(Map<String, dynamic> map) {
    return DocsModel(
      subscriptions: SubscriptionsModel.fromMap(
          map["subscriptions"] ?? <String, dynamic>{}),
      service: ServicesModel.fromMap(map["services"] ?? <String, dynamic>{}),
      paymentsInfo:
          PaymentsInfoModel.fromMap(map["paymentsInfo"] ?? <String, dynamic>{}),
      addressInfo:
          AddressInfoModel.fromMap(map["addressInfo"] ?? <String, dynamic>{}),
      contacts: ContactsModel.fromMap(map["contacts"] ?? <String, dynamic>{}),
      location: LocationModel.fromMap(map["location"] ?? <String, dynamic>{}),
      image: ImageModel.fromMap(map["image"] ?? <String, dynamic>{}),
      cuisines: List.from(map["cuisines"] ?? <dynamic>[])
          .map((e) => CuisinesModel.fromMap(e))
          .toList(),
      additionalInfo: List<dynamic>.from(map["additionalInfo"] ?? <dynamic>[]),
      id: map["_id"] ?? "",
      name: map["name"] ?? "",
      company: map["company"] ?? "",
      capacity: map["capacity"] ?? 0,
      mealType: map["mealType"] ?? "",
      createdAt: map["createdAt"] ?? "",
      updatedAt: map["updatedAt"] ?? "",
      v: map["__v"] ?? 0,
      currencyCode: map["currencyCode"] ?? "",
      languageCode: map["languageCode"] ?? "",
      timezone: map["timezone"] ?? "",
      languageInfo: map["languageInfo"] ?? "",
      currencyInfo:
          CurrencyInfoModel.fromMap(map["currencyInfo"] ?? <String, dynamic>{}),
      countryCode: map["countryCode"] ?? "",
    );
  }

  factory DocsModel.fromJson(String json) =>
      DocsModel.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Docs(subscriptions: $subscriptions, service: $service, paymentsInfo: $paymentsInfo, addressInfo: $addressInfo, contacts: $contacts, location: $location, image: $image, cuisines: $cuisines, additionalInfo: $additionalInfo, id: $id, name: $name, company: $company, capacity: $capacity, mealType: $mealType, createdAt: $createdAt, updatedAt: $updatedAt, v: $v, currencyCode: $currencyCode, languageCode: $languageCode, timezone: $timezone, languageInfo: $languageInfo, currencyInfo: $currencyInfo, countryCode: $countryCode)';
  }
}
