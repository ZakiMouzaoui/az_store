import 'package:az_store/data/repositories/auth/auth_repository.dart';
import 'package:az_store/features/personalization/models/order_coupon_model.dart';
import 'package:az_store/features/shop/models/order_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class OrderRepository extends GetxController{
  static OrderRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  final currentUser = AuthRepository.instance.authUser;

  Future<List<OrderModel>> getUserOrders() async{
    try{
      final snapshots = await _db.collection("users").doc(currentUser!.uid).collection("orders").orderBy("orderDate", descending: true).get();
      return snapshots.docs.map((e) => OrderModel.fromSnapshot(e)).toList();
    }on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<OrderModel> fetchOrderDetails(String orderId) async{
    try{
      return OrderModel.fromSnapshot(await _db.collection("users").doc(currentUser!.uid).collection("orders").doc(orderId).get());
    }on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<void> placeOrder(OrderModel order) async{
    try{
      WriteBatch batch = _db.batch();
      DocumentReference userRef = _db.collection("users").doc(currentUser!.uid);
      DocumentReference orderRef = userRef.collection("orders").doc();
      batch.set(orderRef, order.toJson());

      for (var cartItem in order.items) {
        DocumentReference productRef = _db.collection('products').doc(cartItem.productId);
        batch.update(productRef, {'stock': FieldValue.increment(-cartItem.quantity)});

        /*
        if (cartItem.sku != null) {
          var skuPath = 'skus.${cartItem.sku}.stock';
          batch.update(productRef, {skuPath: FieldValue.increment(-cartItem.quantity)});
        }
         */

      }
      if (order.couponCode != null) {
        QuerySnapshot couponQuery = await _db.collection('coupons').where('code', isEqualTo: order.couponCode).get();

        if (couponQuery.docs.isNotEmpty) {
          DocumentReference couponRef = couponQuery.docs.first.reference;
          batch.update(couponRef,
              {
                'currentUsageCount': FieldValue.increment(1),
                'usedBy': FieldValue.arrayUnion([currentUser!.uid])
              }
          );
          final couponDoc = couponQuery.docs.first;

          OrderCouponModel orderCouponModel = OrderCouponModel(
              id: couponRef.id,
              code: couponDoc["code"],
              discountPercent: couponDoc["percentage"],
              orderTrackingCode: order.trackingCode
          );
          batch.set(userRef.collection("myCoupons").doc(), orderCouponModel.toJson());
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