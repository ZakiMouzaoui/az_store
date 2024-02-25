import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String id;
  String firstName;
  String lastName;
  String displayName;
  String phoneNumber;
  final String email;
  String profilePicture;
  String? defaultAddressId;

  UserModel(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.displayName,
      required this.phoneNumber,
      required this.email,
      required this.profilePicture,
        this.defaultAddressId
      });

  factory UserModel.empty() => UserModel(
      id: "",
      firstName: "",
      lastName: "",
      phoneNumber: "",
      email: "",
      displayName: "",
      profilePicture: "",
      defaultAddressId: ""
  );

  String generateUserName() {
    String baseUsername = '${firstName.toLowerCase()}_${lastName.toLowerCase()}';
    String timestampSuffix = DateTime.now().millisecondsSinceEpoch.remainder(10000).toString();
    return '$baseUsername$timestampSuffix';
  }

  String get generateUsername => generateUserName();

  Map<String, dynamic> toJson() => {
    "id": id,
    "firstName": firstName,
    "lastName": lastName,
    "displayName": displayName,
    "email": email,
    "phoneNumber": phoneNumber,
    "profilePicture": profilePicture,
    "defaultAddressId": defaultAddressId
  };

  static UserModel fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot) {
    Map<String, dynamic>? data = snapshot.data();
    return UserModel(
      id: snapshot.id,
      firstName: data?["firstName"],
      lastName: data?["lastName"],
      email: data?["email"],
      displayName: data?["displayName"],
      phoneNumber: data?["phoneNumber"],
      profilePicture: data?["profilePicture"],
      defaultAddressId: data?["defaultAddressId"]
    );
  }
}

