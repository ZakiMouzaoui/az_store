import 'package:az_store/data/repositories/product/product_repository.dart';
import 'package:az_store/features/shop/models/category_model.dart';
import 'package:az_store/features/shop/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../screens/all_products/all_products.dart';

class ProductController extends GetxController{
  static ProductController get instance => Get.find();

  RxList<Product> featuredProducts = <Product>[].obs;
  RxList<Product> productsByCategory = <Product>[].obs;
  Rx<bool> isProductsByCategoryLoading = false.obs;

  final productRepo = Get.put(ProductRepository());

  Future<List<Product>> fetchFeaturedProducts({int? limit}) async{
    try{
      return productRepo.fetchFeaturedProducts(limit: limit);
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
      return [];
    }
  }

  Future<List<Product>> fetchProductsByCategory(String categoryId, {bool hasParentCategory=false, int limit=-1}) async{
    try{
      return productRepo.fetchProductsByCategory(categoryId,hasParentCategory: hasParentCategory, limit: limit);
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
      return [];
    }
  }

  Future<List<Product>>? fetchProductsByBrand(String brandId){
    try{
      return productRepo.fetchProductsByBrand(brandId);
    }
    catch(e){
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }

  void assignProductsByCategory(List<Product> newProducts){
    productsByCategory.assignAll(newProducts);
  }

  List<Product> filterProductsByBrand(List<Product> products, String brandId){
    return products.where((p) => p.brandId == brandId).toList();
  }

  void viewAllFeaturedProducts(){
    Get.to(() => const AllProducts(
        title: "Popular Products"), arguments: {
      "query": FirebaseFirestore.instance
          .collection("products")
          .where("isFeatured", isEqualTo: true)
          .orderBy("name"),
    });
  }

  void viewAllProductsByCategory(CategoryModel category){
    Get.to(() => AllProducts(
        title: category.name), arguments: {
      "query": FirebaseFirestore.instance
          .collection("products")
          .where("categoryId", isEqualTo: category.id)
          .orderBy("name"),
    });
  }
}