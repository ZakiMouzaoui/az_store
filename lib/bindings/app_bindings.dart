import 'package:az_store/data/repositories/user/user_repository.dart';
import 'package:az_store/features/shop/controllers/product_details/product_details_controller.dart';
import 'package:get/get.dart';

class AppBindings implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => UserRepository(), fenix: true);
    Get.put(ProductDetailsController());
  }
}