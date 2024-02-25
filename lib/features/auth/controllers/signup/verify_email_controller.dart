import 'dart:async';

import 'package:az_store/data/repositories/auth/auth_repository.dart';
import 'package:az_store/features/auth/screens/login/login.dart';
import 'package:az_store/features/auth/screens/signup/verify_success.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class VerifyEmailController extends GetxController{
  static VerifyEmailController get instance => Get.find();

  final authRepository = AuthRepository.instance;
  Rx<bool> isLoading = false.obs;

  @override
  void onInit() {
    sendEmailVerification();
    setRedirectTimer();
    super.onInit();
  }

  Future<void> sendEmailVerification()async{
    try{
      await authRepository.sendEmailVerification();
    }catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void setRedirectTimer()async{
    Timer.periodic(const Duration(seconds: 1), (timer)async {
      final currentUser = authRepository.auth.currentUser;
      if(currentUser != null){
        await currentUser.reload();
        if(authRepository.auth.currentUser!.emailVerified){
          Get.offAll(()=>const VerifySuccess());
          timer.cancel();
        }
      }
      else{
        timer.cancel();
      }

    });
  }

  void resendEmail() async{
    try{
      isLoading.value = true;
      await sendEmailVerification();
    }
    catch(e){
      Fluttertoast.showToast(msg: e.toString());
    }
    finally{
      isLoading.value = false;
    }
  }

  void signOut(){
    authRepository.signOut();
    Get.offAll(()=>const Login());
  }
}