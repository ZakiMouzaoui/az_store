import 'package:az_store/features/shop/models/review_model.dart';
import 'package:az_store/utils/helpers/reviews_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class ReviewRepository extends GetxController {
  final _db = FirebaseFirestore.instance;

  Future<void> insertDummyReviews() async {
    try {
      double ratings = 0;
      final productRef = _db.collection("products").doc("1");
      final WriteBatch batch = _db.batch();
      int totalReviews = reviews.length;

      for (var review in reviews) {
        batch.set(productRef.collection("reviews").doc(), review.toJson());
        ratings += review.rating;
      }
      batch.update(productRef,
          {"rating": ratings / totalReviews, "totalReviews": totalReviews});
      await batch.commit();
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<List<ReviewModel>> fetchProductReviews(String productId) async {
    try {
      final snapshots = await _db
          .collection("products")
          .doc(productId)
          .collection("reviews")
          .orderBy("createdAt", descending: true)
          .get();
      return snapshots.docs.map((e) => ReviewModel.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<void> addReview(ReviewModel reviewModel, double oldRating, int totalReviews) async {
    try {
      final batch = _db.batch();
      final productRef = _db.collection("products").doc(reviewModel.productId);
      final newAvgRating = (oldRating * totalReviews + reviewModel.rating)/(totalReviews+1);
      batch.set(productRef.collection("reviews").doc(), reviewModel.toJson());
      //final oldRating = (await productRef.get()).get("rating");
      batch.update(productRef, {
        'totalReviews': FieldValue.increment(1),
        'rating': newAvgRating
      });
      await batch.commit();

    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }
}
