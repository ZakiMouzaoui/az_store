import 'package:az_store/data/repositories/user/user_repository.dart';
import 'package:az_store/features/personalization/models/user_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class UserController extends GetxController{
  static UserController get instance => Get.find();

  Rx<UserModel> userModel = UserModel.empty().obs;

  Rx<bool> isProfileLoading = false.obs;

  @override
  void onInit() {
    fetchUserData();
    super.onInit();
  }

  void fetchUserData()async{
    try{
      isProfileLoading.value = true;
      final user = await UserRepository.instance.fetchUserDetails();
      userModel.value = user;
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
    finally{
      isProfileLoading.value = false;
    }
  }
}