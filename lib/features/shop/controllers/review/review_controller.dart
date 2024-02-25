import 'package:az_store/data/repositories/review/review_repository.dart';
import 'package:az_store/features/shop/models/review_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ReviewController extends GetxController{
  final repository = Get.put(ReviewRepository());

  Future<List<ReviewModel>> fetchProductReviews(String productId) async{
    try{
      return repository.fetchProductReviews(productId);
    }
    catch(e){
      Fluttertoast.showToast(msg: e.toString());
      return [];
    }
  }
}