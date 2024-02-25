import 'package:az_store/data/repositories/category/category_repository.dart';
import 'package:az_store/features/shop/models/category_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();

  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
  Rx<bool> isCategoriesLoading = false.obs;

  final categoryRepository = Get.put(CategoryRepository());

  @override
  void onInit() {
    fetchCategories();
    super.onInit();
  }

  void fetchCategories() async {
    try {
      isCategoriesLoading.value = true;
      allCategories.assignAll(await categoryRepository.fetchCategories());
      featuredCategories.assignAll(allCategories.where((category) => category.parentId == null).toList());
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isCategoriesLoading.value = false;
    }
  }

  List<CategoryModel> fetchSubCategories(String categoryId){
    return allCategories.where((category) => category.parentId == categoryId).toList();
  }
}
