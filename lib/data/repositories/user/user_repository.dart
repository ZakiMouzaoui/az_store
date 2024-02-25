import 'dart:io';

import 'package:az_store/data/repositories/auth/auth_repository.dart';
import 'package:az_store/utils/exceptions/firebase_exceptions.dart';
import 'package:az_store/utils/exceptions/platform_exceptions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../features/personalization/models/user_model.dart';
import '../../../utils/exceptions/firebase_auth_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';

class UserRepository extends GetxController{
  static UserRepository get instance => Get.find();

  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final authUser = AuthRepository.instance.authUser;

  Future<void> createUser(UserModel user)async {
    try{
      _db.collection("users").doc(user.id).set(user.toJson());
    }on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<UserModel> fetchUserDetails() async{
    try{
      final documentSnapshot = await _db.collection("users").doc(authUser!.uid).get();
      if(documentSnapshot.exists){
        return UserModel.fromSnapshot(documentSnapshot);
      }
      return UserModel.empty();

    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<void> updateUserInfo(Map<String, dynamic> data) async{
    try{
      await _db.collection("users").doc(authUser!.uid).update(data);
    }on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<void> removeUserRecord(String id)async{
    try{
      await _db.collection("users").doc(id).delete();
    }
    on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<String> uploadImage(String path, XFile image) async{
    try{
      final ref = FirebaseStorage.instance.ref(path).child(image.name);
      await ref.putFile(File(image.path));
      return await ref.getDownloadURL();
    }
    on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }
}


