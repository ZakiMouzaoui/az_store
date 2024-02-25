import 'package:az_store/data/repositories/order/order_repository.dart';
import 'package:az_store/features/shop/models/order_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class OrderController extends GetxController{
  static OrderController get instance => Get.find();
  final orderRepo = Get.put(OrderRepository());

  Future<List<OrderModel>?> fetchUserOrders() async{
    try{
      return orderRepo.getUserOrders();
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }
}