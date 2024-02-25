import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/product_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';
import '../../../utils/helpers/products_list.dart';

class ProductRepository extends GetxController {
  static ProductRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;
  get db => _db;

  Future<void> insertProducts() async {
    try {
      for (var product in products) {
        await _db.collection("products").doc().set(product.toJson());
      }
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<List<Product>> fetchFeaturedProducts(
      {int? limit, String? orderBy}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshots;
      if (limit != null) {
        snapshots = await _db
            .collection("products")
            .where("isFeatured", isEqualTo: true)
            .orderBy(orderBy ?? "name", descending: false)
            .limit(limit)
            .get();
      } else {
        snapshots = await _db
            .collection("products")
            .where("isFeatured", isEqualTo: true)
            .get();
      }

      return snapshots.docs.map((e) => Product.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<List<Product>> fetchProductsByCategory(String categoryId,
      {bool hasParentCategory = false, int limit = -1}) async {
    try {
      QuerySnapshot<Map<String, dynamic>> snapshots;

      if (hasParentCategory) {
        snapshots = await _db
            .collection("products")
            .where("parentCategoryId", isEqualTo: categoryId)
            .limit(limit)
            .get();
      } else {
        snapshots = await _db
            .collection("products")
            .where("categoryId", isEqualTo: categoryId)
            .get();
      }
      return snapshots.docs.map((e) => Product.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<List<Product>> fetchProductsByCategoryAndBrand(
      String categoryId, String brandId) async {
    try {
      final snapshots = await _db
          .collection("products")
          .where("categoryId", isEqualTo: categoryId)
          .where("brandId", isEqualTo: brandId)
          .get();
      return snapshots.docs.map((e) => Product.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<List<Product>> fetchProductsByBrand(String brandId) async {
    try {
      final snapshots = await _db
          .collection("products")
          .where("brandId", isEqualTo: brandId)
          .get();
      return snapshots.docs.map((e) => Product.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<List<Product>> fetchProductsByQuery(Query query) async {
    try {
      final querySnapshot =
          await query.get() as QuerySnapshot<Map<String, dynamic>>;

      return querySnapshot.docs.map((e) => Product.fromSnapshot(e)).toList();
    } on FirebaseException catch (e) {
      print(e);
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<List<Product>> fetchFavoriteProducts(List<String> productIds) async {
    try {
      if (productIds.isEmpty) {
        return [];
      }
      final querySnapshot = await _db
          .collection("products")
          .where(FieldPath.documentId, whereIn: productIds)
          .get();
      return List.from(querySnapshot.docs.map((e) => Product.fromSnapshot(e)));
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<void> updateProductSkus() async {
    final skus = [
      SKU(
        id: "iphone-13-pro-max-silver-128gb",
        description: "iPhone 13 Pro Max - Silver 128GB",
        stock: 50,
        price: 1099.99,
        image: "iphone_13_pro_max_silver_128gb.png",
        variations: {
          "Color": "#C0C0C0",
          "Storage": "128GB",
        },
      ),
      SKU(
        id: "iphone-13-pro-max-space-gray-256gb",
        description: "iPhone 13 Pro Max - Space Gray 256GB",
        stock: 40,
        price: 1199.99,
        image: "iphone_13_pro_max_space_gray_256gb.png",
        variations: {
          "Color": "#222222",
          "Storage": "256GB",
        },
      ),
      SKU(
        id: "iphone-13-pro-max-gold-512gb",
        description: "iPhone 13 Pro Max - Gold 512GB",
        stock: 30,
        price: 1299.99,
        image: "iphone_13_pro_max_gold_512gb.png",
        variations: {
          "Color": "#FFD700",
          "Storage": "512GB",
        },
      ),
      SKU(
        id: "iphone-13-pro-max-silver-512gb",
        description: "iPhone 13 Pro Max - Silver 512GB",
        stock: 25,
        price: 1299.99,
        image: "iphone_13_pro_max_silver_512gb.png",
        variations: {
          "Color": "#C0C0C0",
          "Storage": "512GB",
        },
      ),
      SKU(
        id: "iphone-13-pro-max-space-gray-1tb",
        description: "iPhone 13 Pro Max - Space Gray 1TB",
        stock: 20,
        price: 1399.99,
        image: "iphone_13_pro_max_space_gray_1tb.png",
        variations: {
          "Color": "#222222",
          "Storage": "1TB",
        },
      )
    ];
    try {
      await _db
          .collection("products")
          .doc("1")
          .update({"skus": skus.map((e) => e.toJson())});
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }
}
