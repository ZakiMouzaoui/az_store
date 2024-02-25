import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/brand_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class BrandRepository extends GetxController{
  static BrandRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> insertBrands()async {
    try{
      final List<BrandModel> brands = [
        BrandModel(id: "1", name: "Apple", isFeatured: true, categoryIds: ["1", "9"], isActive: true),
        BrandModel(id: "2", name: "Samsung", categoryIds: ["1"], isActive: true),
        BrandModel(id: "3", name: "LG", isFeatured: true, categoryIds: ["1"], isActive: true),
        BrandModel(id: "4", name: "Sony", isFeatured: true, categoryIds: ["1"], isActive: true),
        BrandModel(id: "5", name: "Microsoft", categoryIds: ["1"], isActive: true),
        BrandModel(id: "6", name: "HP", categoryIds: ["1"], isActive: true),
        BrandModel(id: "7", name: "Dell", categoryIds: ["1"], isActive: true),
        BrandModel(id: "8", name: "Lenovo", categoryIds: ["1"], isActive: true),
        BrandModel(id: "9", name: "Nike", isFeatured: true, categoryIds: ["5"], isActive: true),
        BrandModel(id: "10", name: "Adidas", isFeatured: true, categoryIds: ["5"], isActive: true),
        BrandModel(id: "11", name: "Puma", categoryIds: ["5"], isActive: true),
        BrandModel(id: "12", name: "Levi's", categoryIds: ["2"], isActive: true),
        BrandModel(id: "14", name: "Gucci", isFeatured: true, categoryIds: ["2"], isActive: true),
        BrandModel(id: "15", name: "Calvin Klein", categoryIds: ["2"], isActive: true),
        BrandModel(id: "19", name: "Zara", isFeatured: true, categoryIds: ["2"], isActive: true),
        BrandModel(id: "20", name: "H&M", categoryIds: ["2"], isActive: true),
        BrandModel(id: "21", name: "Forever 21", categoryIds: ["2"], isActive: true),
        BrandModel(id: "22", name: "Uniqlo", categoryIds: ["2"], isActive: true),
        BrandModel(id: "23", name: "IKEA", categoryIds: ["3"], isActive: true),
        BrandModel(id: "24", name: "Pottery Barn", categoryIds: ["3"], isActive: true),
        BrandModel(id: "25", name: "Crate & Barrel", categoryIds: ["3"], isActive: true),
        BrandModel(id: "26", name: "Target Home", categoryIds: ["3"], isActive: true),
        BrandModel(id: "27", name: "Penguin Books", categoryIds: ["4"], isActive: true),
        BrandModel(id: "28", name: "HarperCollins", categoryIds: ["4"], isActive: true),
        BrandModel(id: "29", name: "Random House", categoryIds: ["4"], isActive: true),
        BrandModel(id: "30", name: "Scholastic", categoryIds: ["4"], isActive: true),
        BrandModel(id: "31", name: "L'Oréal", categoryIds: ["6"], isActive: true),
        BrandModel(id: "32", name: "Maybelline", categoryIds: ["6"], isActive: true),
        BrandModel(id: "33", name: "Estée Lauder", categoryIds: ["6"], isActive: true),
        BrandModel(id: "34", name: "MAC Cosmetics", categoryIds: ["6"], isActive: true),
        BrandModel(id: "35", name: "LEGO", categoryIds: ["7"], isActive: true),
        BrandModel(id: "36", name: "Hasbro", categoryIds: ["7"], isActive: true),
        BrandModel(id: "37", name: "Mattel", categoryIds: ["7"], isActive: true),
        BrandModel(id: "38", name: "Fisher-Price", categoryIds: ["7"], isActive: true),
      ];
      for (var brand in brands){
        await _db.collection("brands").doc(brand.id).set(brand.toJson());
      }
    }on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<List<BrandModel>> fetchBrands() async{
    try{
      final snapshots = await _db.collection("brands").get();
      return snapshots.docs.map((doc) => BrandModel.fromSnapshot(doc)).toList();
    }on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }
}