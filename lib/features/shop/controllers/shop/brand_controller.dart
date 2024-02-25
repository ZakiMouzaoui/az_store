import 'package:az_store/data/repositories/brand/brand_repository.dart';
import 'package:az_store/features/shop/models/brand_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class BrandController extends GetxController{
  static BrandController get instance => Get.find();

  Rx<bool> isLoading = false.obs;
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;

  final brandRepo = Get.put(BrandRepository());

  @override
  void onInit() {
    fetchBrands();
    super.onInit();
  }

  void fetchBrands() async{
    try{
      isLoading.value = true;
      final brandsList = await brandRepo.fetchBrands();
      allBrands.assignAll(brandsList);
      featuredBrands.assignAll(allBrands.where((brand) => brand.isFeatured == true));
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
    finally{
      isLoading.value = false;
    }
  }

  List<BrandModel> fetchBrandsByCategory(String categoryId){
    return allBrands.where((brand) => brand.categoryIds.contains(categoryId)).toList();
  }
}