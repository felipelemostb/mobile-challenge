import 'dart:convert';

import 'customers_queue_model.dart';
import 'delivery_model.dart';
import 'in_office_delivery.dart';
import 'scango_model.dart';
import 'table_reservations_model.dart';
import 'takeaway_model.dart';

class ServicesModel {
  DeliveryModel delivery;
  TakeawayModel takeaway;
  TableReservationsModel tableReservations;
  CustomersQueueModel customersQueue;
  ScangoModel scango;
  InOfficeDelivery inOfficeDelivery;

  ServicesModel({
    required this.delivery,
    required this.takeaway,
    required this.tableReservations,
    required this.customersQueue,
    required this.scango,
    required this.inOfficeDelivery,
  });

  Map<String, dynamic> toMap() {
    return {
      "delivery": delivery.toMap(),
      "takeaway": takeaway.toMap(),
      "tableReservations": tableReservations.toMap(),
      "customersQueue": customersQueue.toMap(),
      "scango": scango.toMap(),
      "inOfficeDelivery": inOfficeDelivery.toMap(),
    };
  }

  String toJson() => jsonEncode(toMap());

  factory ServicesModel.fromMap(Map<String, dynamic> map) {
    return ServicesModel(
      delivery: DeliveryModel.fromMap(map["delivery"] ?? <String, dynamic>{}),
      takeaway: TakeawayModel.fromMap(map["takeaway"] ?? <String, dynamic>{}),
      tableReservations: TableReservationsModel.fromMap(
          map["tableReservations"] ?? <String, dynamic>{}),
      customersQueue: CustomersQueueModel.fromMap(
          map["customersQueue"] ?? <String, dynamic>{}),
      scango: ScangoModel.fromMap(map["scango"] ?? <String, dynamic>{}),
      inOfficeDelivery: InOfficeDelivery.fromMap(
          map["inOfficeDelivery"] ?? <String, dynamic>{}),
    );
  }

  factory ServicesModel.fromJson(String json) =>
      ServicesModel.fromMap(jsonDecode(json));

  @override
  String toString() {
    return 'Services(delivery: $delivery, takeaway: $takeaway, tableReservations: $tableReservations, customersQueue: $customersQueue, scango: $scango, inOfficeDelivery: $inOfficeDelivery)';
  }
}
