import 'package:az_store/data/repositories/auth/auth_repository.dart';
import 'package:az_store/features/auth/screens/forget_password/reset_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController{
  static ForgotPasswordController get instance => Get.find();

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController emailCtr = TextEditingController();

  Rx<bool> isLoading = false.obs;

  void sendResetLink() async{
    try{
      isLoading.value = true;
      if(key.currentState!.validate()){
        await AuthRepository.instance.sendPasswordResetLink(emailCtr.text);
        Get.off(()=>ResetPassword(email: emailCtr.text));
      }
      else{
        return;
      }
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
    finally{
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    emailCtr.dispose();
    super.dispose();
  }
}