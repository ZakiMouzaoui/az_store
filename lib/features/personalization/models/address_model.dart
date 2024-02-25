import 'package:cloud_firestore/cloud_firestore.dart';

class AddressModel {
  String? id;
  final String street;
  final String city;
  final String phoneNumber;
  final String postalCode;
  bool isDefaultAddress;

  AddressModel(
      {this.id,
      required this.street,
      required this.city,
      required this.phoneNumber,
      required this.postalCode,
      this.isDefaultAddress = true});

  factory AddressModel.empty() {
    return AddressModel(
        id: '', street: '', city: '', phoneNumber: '', postalCode: '');
  }

  Map<String, dynamic> toJson() {
    return {
      "street": street,
      "city": city,
      "phoneNumber": phoneNumber,
      "postalCode": postalCode,
      "isDefaultAddress": isDefaultAddress
    };
  }

  factory AddressModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> snapshot) {
    return AddressModel(
        id: snapshot.id,
        street: snapshot["street"],
        city: snapshot["city"],
        phoneNumber: snapshot["phoneNumber"],
        postalCode: snapshot["postalCode"],
        isDefaultAddress: snapshot["isDefaultAddress"]);
  }

  factory AddressModel.fromJson(Map<String, dynamic> json){
    return AddressModel(
        street: json["street"],
        city: json["city"],
        phoneNumber: json["phoneNumber"],
        postalCode: json["postalCode"]
    );
  }

  @override
  String toString() => '$street, $city, $postalCode';
}
