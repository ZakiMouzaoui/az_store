import 'package:az_store/data/repositories/product/product_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../models/product_model.dart';

class AllProductsController extends GetxController{
  static AllProductsController get instance => Get.find();
  final productRepository = ProductRepository.instance;

  RxList<Product> fetchedProducts = <Product>[].obs;
  Rx<bool> isLoading = false.obs;
  Rx<String> sortingOption = "Name(A-Z)".obs;

  Query query = Get.arguments["query"];

  @override
  void onInit() {
    fetchProductsByQuery(query);
    super.onInit();
  }

  Future fetchProductsByQuery(Query query) async{
    try{
      isLoading.value = true;
      fetchedProducts.assignAll(await productRepository.fetchProductsByQuery(query));
    }
    catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
    finally{
      isLoading.value = false;
    }
  }

  void selectSortOption(String? sortOption) async{
    Query newQuery = FirebaseFirestore.instance.collection("products");
    final conditions = query.parameters["where"];
    newQuery = applyWhereConditions(newQuery, conditions);

    switch(sortOption){
      case "Name(A-Z)":
        newQuery = newQuery.orderBy("name");
        break;
      case "Name(Z-A)":
        newQuery = newQuery.orderBy("name", descending: true);
        break;
      case "Lower Price":
        newQuery = newQuery.orderBy("price");
        break;
      case "Higher Price":
        newQuery = newQuery.orderBy("price", descending: true);
        break;
    }
    if(sortingOption.value != sortOption){
      sortingOption.value = sortOption!;
      fetchProductsByQuery(newQuery);
    }
  }

  // Function to apply where conditions to a query
  Query applyWhereConditions(Query query, List<List<dynamic>> conditions) {
    Query updatedQuery = query;

    for (List<dynamic> condition in conditions) {
      FieldPath field = condition[0];
      String operator = condition[1];
      dynamic value = condition[2];

      switch (operator) {
        case "==":
          updatedQuery = updatedQuery.where(field, isEqualTo: value);
          break;
        case ">":
          updatedQuery = updatedQuery.where(field, isGreaterThan: value);
          break;
        case ">=":
          updatedQuery = updatedQuery.where(field, isGreaterThanOrEqualTo: value);
          break;
        case "<":
          updatedQuery = updatedQuery.where(field, isLessThan: value);
          break;
        case "<=":
          updatedQuery = updatedQuery.where(field, isLessThanOrEqualTo: value);
          break;
      // Add more cases for other operators as needed
      }
    }

    return updatedQuery;
  }
}