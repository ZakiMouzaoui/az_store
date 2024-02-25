import 'package:az_store/data/repositories/auth/auth_repository.dart';
import 'package:az_store/features/personalization/models/address_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class AddressRepository extends GetxController{
  static AddressRepository get instance => Get.find();

  final auth = AuthRepository.instance;
  final CollectionReference _usersCollection = FirebaseFirestore.instance.collection('users');

  Future<List<AddressModel>> fetchUserAddresses() async{
    try{
      final userId = auth.authUser!.uid;
      final snapshots = await FirebaseFirestore.instance.collection("users").doc(userId).collection("addresses").get();
      return snapshots.docs.map((e) => AddressModel.fromSnapshot(e)).toList();
    }on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<String> addAddress(AddressModel addressModel) async{
    try{
      final userId = auth.authUser!.uid;
      final newAddress = _usersCollection.doc(userId).collection("addresses").doc();
      await newAddress.set(addressModel.toJson());
      return newAddress.id;

    }on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<void> setDefaultAddress(String? addressId) async{
    try{
      final batch = FirebaseFirestore.instance.batch();
      final userId = auth.authUser!.uid;
      final allAddresses = await _usersCollection.doc(userId).collection("addresses").get();
      for (final doc in allAddresses.docs) {
        batch.update(
          _usersCollection.doc(userId).collection('addresses').doc(doc.id),
          {'isDefaultAddress': false},
        );
      }
      batch.update(
        _usersCollection.doc(userId).collection('addresses').doc(addressId),
        {'isDefaultAddress': true},
      );
      await batch.commit();

    }on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<void> deleteAddress(String addressId) async{
    try{
      final batch = FirebaseFirestore.instance.batch();
      final userId = auth.authUser!.uid;
      batch.delete(_usersCollection.doc(userId).collection('addresses').doc(addressId));
      // Check if the deleted address was the default one
      final deletedAddress = await _usersCollection
          .doc(userId)
          .collection('addresses')
          .doc(addressId)
          .get();
      final isDefault = deletedAddress['isDefaultAddress'];

      // If it was default, set the first remaining address as default
      if (isDefault) {
        final remainingAddresses = await _usersCollection
            .doc(userId)
            .collection('addresses')
            .where(FieldPath.documentId ,isNotEqualTo: addressId)
            .limit(1)
            .get();

        if (remainingAddresses.docs.isNotEmpty) {
          batch.update(
            _usersCollection
                .doc(userId)
                .collection('addresses')
                .doc(remainingAddresses.docs.first.id),
            {'isDefaultAddress': true},
          );
        }
      }
      await batch.commit();
    }on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }
}
