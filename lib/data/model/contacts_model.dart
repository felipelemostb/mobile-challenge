import 'dart:convert';

class ContactsModel {
  String email;
  String phoneNumber;

  ContactsModel({
    required this.email,
    required this.phoneNumber,
  });

  Map<String, dynamic> toMap() {
    return {
      "email": email,
      "phoneNumber": phoneNumber,
    };
  }

  String toJson() => jsonEncode(toMap());

  factory ContactsModel.fromMap(Map<String, dynamic> map) {
    return ContactsModel(
      email: map["email"] ?? "",
      phoneNumber: map["phoneNumber"] ?? "",
    );
  }

  factory ContactsModel.fromJson(String json) =>
      ContactsModel.fromMap(jsonDecode(json));

  @override
  String toString() => 'Contacts(email: $email, phoneNumber: $phoneNumber)';
}
