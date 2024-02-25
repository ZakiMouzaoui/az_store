import 'package:az_store/data/repositories/product/product_repository.dart';
import 'package:az_store/features/shop/models/product_model.dart';
import 'package:az_store/utils/local_storage/storage_utility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class WishlistController extends GetxController{
  static WishlistController get instance => Get.find();
  RxList<String> wishlist = <String>[].obs;

  @override
  void onInit() {
    initWishlist();
    super.onInit();
  }

  void initWishlist() {
    final favorites = KLocalStorage.instance().readData("wishlist");
    wishlist.value = favorites != null ? List<String>.from(favorites) : [];
  }

  Future<List<Product>> getFavorites() async {
    try {
      if (wishlist.isEmpty) {
        return [];
      }
      return await ProductRepository.instance.fetchFavoriteProducts(wishlist);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
      return [];
    }
  }

  void toggleFavorite(String productId) {
    if (wishlist.contains(productId)) {
      removeFromWishlist(productId);
    } else {
      addToWishlist(productId);
    }
  }

  void addToWishlist(String productId) {
    wishlist.add(productId);
    updateWishlist();
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: "Product added to wishlist");
  }

  void removeFromWishlist(String productId) {
    wishlist.remove(productId);
    updateWishlist();
    Fluttertoast.cancel();
    Fluttertoast.showToast(msg: "Product removed from wishlist");
  }

  void updateWishlist() {
    KLocalStorage.instance().saveData("wishlist", wishlist);
  }
}