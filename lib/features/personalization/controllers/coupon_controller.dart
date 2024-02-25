import 'package:az_store/data/repositories/coupon/coupon_repository.dart';
import 'package:az_store/features/personalization/models/order_coupon_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CouponController extends GetxController{
  final couponRepo = Get.put(CouponRepository());

  Future<List<OrderCouponModel>?> fetchMyCoupons() async{
    try{
      return couponRepo.fetchMyCoupons();
    }
    catch(e){
      Fluttertoast.showToast(msg: e.toString());
      return null;
    }
  }
}