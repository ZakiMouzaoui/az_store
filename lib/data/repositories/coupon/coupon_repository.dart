import 'package:az_store/data/repositories/auth/auth_repository.dart';
import 'package:az_store/features/personalization/models/order_coupon_model.dart';
import 'package:az_store/features/shop/models/coupon_model.dart';
import 'package:az_store/utils/helpers/coupons_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CouponRepository extends GetxController {
  static CouponRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> addCoupons() async {
    try {
      for (var coupon in coupons) {
        await _db.collection("coupons").doc().set(coupon.toJson());
      }
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<List<OrderCouponModel>> fetchMyCoupons() async{
    try{
      final userId = AuthRepository.instance.authUser!.uid;
      final snapshots = await _db.collection("users").doc(userId).collection("myCoupons").get();
      return snapshots.docs.map((e) => OrderCouponModel.fromSnapshot(e)).toList();
    }on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<CouponModel?> getCouponByCode(String code) async {
    try {
      final snapshots = await _db
          .collection("coupons")
          .where("code", isEqualTo: code)
          .where('expirationDate', isGreaterThan: Timestamp.now())
          .limit(1)
          .get();

      if (snapshots.docs.isNotEmpty) {
        return CouponModel.fromSnapshot(snapshots.docs.first);
      }
      return null;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }
}
