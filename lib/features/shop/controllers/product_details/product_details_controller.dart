import 'package:az_store/features/shop/models/product_model.dart';
import 'package:get/get.dart';

class ProductDetailsController extends GetxController{
  ProductDetailsController({this.product});

  final Product? product;
  static ProductDetailsController get instance => Get.find();

  late RxList<SKU> skus;
  //RxList<SKU> filteredSkus = <SKU>[].obs;

  Rx<int> selectedImgIndex = 0.obs;
  RxMap selectedAttributes = {}.obs;
  late Rx<bool> isCheckoutEnabled = skus.isEmpty ? true.obs : false.obs;
  final Map<Map<String, String?>, bool> combinationCache = {};

  void initSKUs(){
    skus = (Get.arguments["product"] as Product).skus.obs;
    if(skus.isNotEmpty){
      isCheckoutEnabled.value = false;
    }
    else{
      isCheckoutEnabled.value = true;
    }
  }

  void selectImage(int index){
    selectedImgIndex.value = index;
  }

  void selectAttribute(String attributeName, String? attributeValue) {
    selectedAttributes[attributeName] = attributeValue;

    // Check if the current combination is valid
    isCheckoutEnabled.value = isCombinationValid();
  }

  bool isCombinationValid() {
    final key = Map<String, String?>.from(selectedAttributes);

    if (combinationCache.containsKey(key)) {
      return combinationCache[key]!;
    }

    final result = skus.any((sku) {
      return sku.variations.entries.every((entry) {
        return selectedAttributes[entry.key] == entry.value;
      }) && sku.stock > 0;
    });

    combinationCache[key] = result;

    return result;
  }

  bool isChipClickable(ProductAttributeModel attribute, String value) {
    if (selectedAttributes.isEmpty) {
      return true;
    }

    return isCombinationValid() &&
        skus.any((sku) => sku.variations[attribute.name] == value);
  }

  SKU? getSelectedSku() {
    if (!isCombinationValid()) {
      return null;
    }

    return skus.firstWhere((sku) {
      return sku.variations.entries.every((entry) {
        return selectedAttributes[entry.key] == entry.value;
      });
    });
  }

  void reset() {
    selectedAttributes.clear();
    isCheckoutEnabled.value = skus.isNotEmpty ?  false : true;
    skus.clear();
    selectedImgIndex.value = 0;
    combinationCache.clear();
  }
}