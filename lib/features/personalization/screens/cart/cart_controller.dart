import 'package:az_store/features/shop/controllers/product_details/product_details_controller.dart';
import 'package:az_store/features/shop/models/cart_item_model.dart';
import 'package:az_store/features/shop/models/product_model.dart';
import 'package:az_store/features/shop/screens/cart/cart.dart';
import 'package:az_store/utils/local_storage/storage_utility.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CartController extends GetxController{
  static CartController get instance => Get.find();

  final productController = ProductDetailsController.instance;

  Rx<int> totalCartItems = 0.obs;
  Rx<double> totalCartPrice = 0.0.obs;
  Rx<int> selectedProductQuantity = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;

  CartController(){
    loadCartItems();
  }

  void addItemToCart(Product product, {bool? addOne, bool? singleVariant}){
    SKU? sku;
    double price;

    if(singleVariant == null){
      sku =  productController.getSelectedSku();
    }
    price = sku != null ? sku.price * (1-product.discountPercent!/100) : product.price * (1-product.discountPercent!/100);

    final cartItem = CartItemModel(
        productId: product.id,
        name: product.name,
        quantity: addOne != null ? 1 : selectedProductQuantity.value,
        price: price,
        brandName: product.brandName,
        image: product.images[0],
        sku: sku?.id,
        variation: sku?.variations
    );

    final index = getItemIndex(product, sku);
    if(index != -1){
      if(addOne != null){
        cartItems[index].quantity++;
      }
      else {
        cartItems[index].quantity = selectedProductQuantity.value;
      }
    }
    else{
      cartItems.add(cartItem);
    }
    updateCart();
    Get.to(()=>const Cart());
    Fluttertoast.showToast(msg: "Product added to cart successfully");
  }

  int getItemIndex(Product product, SKU? sku){
    return cartItems.indexWhere((element) => element.productId == product.id && element.sku == sku?.id);
  }

  void addOrRemoveOneItem(CartItemModel cartItem, {bool add=true}){
    int index = cartItems.indexWhere((element) => element.productId == cartItem.productId && element.sku == cartItem.sku);
    if(add){
      cartItems[index].quantity++;
    }
    else{
      if(cartItems[index].quantity > 1){
        cartItems[index].quantity--;

      }
      else{
        cartItems.removeAt(index);
      }
    }
    updateCart();
    cartItems.refresh();
  }

  void updateCart(){
    double totalPrice = 0;
    int totalItems = 0;

    for(var item in cartItems){
      totalPrice += item.price * item.quantity;
      totalItems += item.quantity;
    }
    totalCartPrice.value = totalPrice;
    totalCartItems.value = totalItems;

    saveCartItems();
    update();
  }

  void changeQuantity({bool add=true}){
    if(add){
      selectedProductQuantity.value++;
    }
    else{
      if(selectedProductQuantity.value != 0){
        selectedProductQuantity.value--;
      }
    }
  }

  void saveCartItems(){
    final cartItemsJson = cartItems.map((element) => element.toJson()).toList();
    KLocalStorage.instance().saveData("cartItems", cartItemsJson);
  }

  void loadCartItems(){
    final items = KLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if(items != null){
      cartItems.assignAll(items.map((e) => CartItemModel.fromJson(e)));
      updateCart();
    }
  }

  int getProductQuantityInCart(String productId){
    return cartItems.where((item) => item.productId == productId).fold(0, (previousValue, element) => previousValue+element.quantity);
  }

  /*
  int getProductVariationQuantityInCart(String productId, String sku){
    return cartItems.firstWhere((item) => item.productId == productId && item.sku == sku).fold(0, (previousValue, element) => previousValue+element.quantity);
  }
   */

  void clearCart(){
    cartItems.clear();
    totalCartItems.value = 0;
    KLocalStorage.instance().removeData("cartItems");
  }
}