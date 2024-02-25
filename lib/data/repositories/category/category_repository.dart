import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../features/shop/models/category_model.dart';
import '../../../utils/exceptions/firebase_exceptions.dart';
import '../../../utils/exceptions/format_exceptions.dart';
import '../../../utils/exceptions/platform_exceptions.dart';

class CategoryRepository extends GetxController{
  static CategoryRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> insertCategories()async {
    try{
      final categories = [
        CategoryModel(
          id: "1",
          name: "Electronics",
          icon: "electronics_icon.png",
          isFeatured: true,
          parentId: null,
          promoBanner: "https://example.com/electronics_promo_banner.jpg",
        ),
        CategoryModel(
          id: "2",
          name: "Clothing",
          icon: "clothing_icon.png",
          isFeatured: true,
          parentId: null,
          promoBanner: "https://example.com/clothing_promo_banner.jpg",
        ),
        CategoryModel(
          id: "3",
          name: "Home",
          icon: "home_icon.png",
          isFeatured: true,
          parentId: null,
          promoBanner: "https://example.com/home_promo_banner.jpg",
        ),
        CategoryModel(
          id: "4",
          name: "Books",
          icon: "books_icon.png",
          isFeatured: false,
          parentId: null,
          promoBanner: null,
        ),
        CategoryModel(
          id: "5",
          name: "Sports",
          icon: "sports_icon.png",
          isFeatured: true,
          parentId: null,
          promoBanner: "https://example.com/sports_promo_banner.jpg",
        ),
        CategoryModel(
          id: "6",
          name: "Beauty",
          icon: "beauty_icon.png",
          isFeatured: false,
          parentId: null,
          promoBanner: null,
        ),
        CategoryModel(
          id: "7",
          name: "Toys",
          icon: "toys_icon.png",
          isFeatured: true,
          parentId: null,
          promoBanner: "https://example.com/toys_promo_banner.jpg",
        ),
        CategoryModel(
          id: "8",
          name: "Auto",
          icon: "auto_icon.png",
          isFeatured: false,
          parentId: null,
          promoBanner: null,
        ),
        CategoryModel(
          id: "9",
          name: "Smartphones",
          icon: "smartphones_icon.png",
          isFeatured: true,
          parentId: "1",
          promoBanner: "https://example.com/smartphones_promo_banner.jpg",
        ),
        CategoryModel(
          id: "10",
          name: "Laptops",
          icon: "laptops_icon.png",
          isFeatured: false,
          parentId: "1",
          promoBanner: null,
        ),
        CategoryModel(
          id: "11",
          name: "Headphones",
          icon: "headphones_icon.png",
          isFeatured: true,
          parentId: "1",
          promoBanner: "https://example.com/headphones_promo_banner.jpg",
        ),
        CategoryModel(
          id: "12",
          name: "Men's Apparel",
          icon: "mens_apparel_icon.png",
          isFeatured: true,
          parentId: "2",
          promoBanner: "https://example.com/mens_apparel_promo_banner.jpg",
        ),
        CategoryModel(
          id: "13",
          name: "Women's Apparel",
          icon: "womens_apparel_icon.png",
          isFeatured: false,
          parentId: "2",
          promoBanner: null,
        ),
        CategoryModel(
          id: "14",
          name: "Kids' Clothing",
          icon: "kids_clothing_icon.png",
          isFeatured: true,
          parentId: "2",
          promoBanner: "https://example.com/kids_clothing_promo_banner.jpg",
        ),
        CategoryModel(
          id: "15",
          name: "Kitchen Appliances",
          icon: "kitchen_appliances_icon.png",
          isFeatured: true,
          parentId: "3",
          promoBanner: "https://example.com/kitchen_appliances_promo_banner.jpg",
        ),
        CategoryModel(
          id: "16",
          name: "Furniture",
          icon: "furniture_icon.png",
          isFeatured: false,
          parentId: "3",
          promoBanner: null,
        ),
        CategoryModel(
          id: "17",
          name: "Bedding",
          icon: "bedding_icon.png",
          isFeatured: true,
          parentId: "3",
          promoBanner: "https://example.com/bedding_promo_banner.jpg",
        ),
        CategoryModel(
          id: "18",
          name: "Science Fiction Books",
          icon: "sci_fi_books_icon.png",
          isFeatured: true,
          parentId: "4",
          promoBanner: "https://example.com/sci_fi_books_promo_banner.jpg",
        ),
        CategoryModel(
          id: "19",
          name: "Mystery Novels",
          icon: "mystery_novels_icon.png",
          isFeatured: false,
          parentId: "4",
          promoBanner: null,
        ),
        CategoryModel(
          id: "20",
          name: "Biographies",
          icon: "biographies_icon.png",
          isFeatured: true,
          parentId: "4",
          promoBanner: "https://example.com/biographies_promo_banner.jpg",
        ),
        CategoryModel(
          id: "21",
          name: "Outdoor Sports Gear",
          icon: "outdoor_sports_gear_icon.png",
          isFeatured: true,
          parentId: "5",
          promoBanner: "https://example.com/outdoor_sports_gear_promo_banner.jpg",
        ),
        CategoryModel(
          id: "22",
          name: "Fitness Equipment",
          icon: "fitness_equipment_icon.png",
          isFeatured: false,
          parentId: "5",
          promoBanner: null,
        ),
        CategoryModel(
          id: "23",
          name: "Camping Gear",
          icon: "camping_gear_icon.png",
          isFeatured: true,
          parentId: "5",
          promoBanner: "https://example.com/camping_gear_promo_banner.jpg",
        ),
        CategoryModel(
          id: "24",
          name: "Skin Care",
          icon: "skin_care_icon.png",
          isFeatured: true,
          parentId: "6",
          promoBanner: "https://example.com/skin_care_products_promo_banner.jpg",
        ),
        CategoryModel(
          id: "25",
          name: "Makeup",
          icon: "makeup_icon.png",
          isFeatured: false,
          parentId: "6",
          promoBanner: null,
        ),
        CategoryModel(
          id: "26",
          name: "Hair Care",
          icon: "hair_care_icon.png",
          isFeatured: true,
          parentId: "6",
          promoBanner: "https://example.com/hair_care_promo_banner.jpg",
        ),
        CategoryModel(
          id: "27",
          name: "Educational Toys",
          icon: "educational_toys_icon.png",
          isFeatured: true,
          parentId: "7",
          promoBanner: "https://example.com/educational_toys_promo_banner.jpg",
        ),
        CategoryModel(
          id: "28",
          name: "Board Games",
          icon: "board_games_icon.png",
          isFeatured: false,
          parentId: "7",
          promoBanner: null,
        ),
        CategoryModel(
          id: "29",
          name: "Puzzles",
          icon: "puzzles_icon.png",
          isFeatured: true,
          parentId: "7",
          promoBanner: "https://example.com/puzzles_promo_banner.jpg",
        ),
        CategoryModel(
          id: "30",
          name: "Car Parts",
          icon: "car_parts_icon.png",
          isFeatured: true,
          parentId: "8",
          promoBanner: "https://example.com/car_parts_promo_banner.jpg",
        ),
      ];
      for (var category in categories){
        await _db.collection("categories").doc(category.id).set(category.toJson());
      }
    }on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<List<CategoryModel>> fetchCategories() async{
    try{
      final snapshots = await _db.collection("categories").get();
      return snapshots.docs.map((doc) => CategoryModel.fromSnapshot(doc)).toList();
    }on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }
}