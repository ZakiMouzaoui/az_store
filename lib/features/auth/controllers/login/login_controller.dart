import 'package:az_store/common/widgets/navigation_menu.dart';
import 'package:az_store/data/repositories/auth/auth_repository.dart';
import 'package:az_store/data/repositories/user/user_repository.dart';
import 'package:az_store/features/auth/screens/signup/verify_email.dart';
import 'package:az_store/features/personalization/models/user_model.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController{
  static LoginController get instance => Get.find();
  final authRepository = AuthRepository.instance;

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  late final TextEditingController emailCtr = TextEditingController(text: _deviceStorage.read("email") ?? "");
  late final TextEditingController passwordCtr = TextEditingController(text: _deviceStorage.read("password") ?? "");

  final _deviceStorage = GetStorage();
  Rx<bool> isLoading = false.obs;
  late Rx<bool> rememberMe = _deviceStorage.hasData("email") ? true.obs : false.obs;
  Rx<bool> showPassword = false.obs;

  void togglePassword(){
    showPassword.toggle();
  }

  void toggleRememberMe(){
    rememberMe.toggle();
  }

  Future<void> signInWithEmailAndPassword() async{
    try{
      isLoading.value = true;

      /// Check network connectivity
      final isConnected = await ConnectivityWrapper.instance.isConnected;
      if (!isConnected) {
        Fluttertoast.showToast(msg: "No internet connection");
        return;
      }

      /// Validate the form
      if(key.currentState!.validate()){
        final userCredential = await authRepository.signInWithEmailAndPassword(emailCtr.text, passwordCtr.text);

        if(userCredential.user!.emailVerified){
          Get.off(()=>const NavigationMenu());
        }
        else{
          Get.to(()=>VerifyEmail(email: emailCtr.text));
        }

        if(rememberMe.value){
          _deviceStorage.write('email', emailCtr.text);
          _deviceStorage.write('password', passwordCtr.text);
        }
        else{
          _deviceStorage.remove("email");
          _deviceStorage.remove("password");
        }
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

  Future<void> singInWithGoogle() async{
    try{
      final userCredential = await authRepository.signInWithGoogle();
      final bool isNewUser = userCredential.additionalUserInfo!.isNewUser;
      if(isNewUser){
        final userModel = UserModel(
            id: userCredential.user!.uid,
            email: userCredential.user!.email!,
            profilePicture: userCredential.user!.photoURL ?? '',
            firstName: '',
            lastName: '',
            phoneNumber: '',
            displayName: userCredential.user!.displayName!
        );
        await UserRepository.instance.createUser(userModel);
      }
      Get.offAll(()=>const NavigationMenu());
    }catch(e){
      Fluttertoast.showToast(msg: "Action cancelled by the user");
    }
    finally{
      isLoading.value = false;
    }
  }

  Future<void> singInWithFacebook() async{
    try{
      //final userCredential = await authRepository.signInWithFacebook();
      /*
      final userModel = UserModel(
          id: userCredential.user!.uid,
          firstName: "",
          lastName: "",
          phoneNumber: "",
          email: userCredential.user!.email!,
          username: userCredential.user!.email!.split("@")[0]
      );
      await UserRepository.instance.createUser(userModel);
       */
      Get.offAll(()=>const NavigationMenu());

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
    passwordCtr.dispose();
    super.dispose();
  }
}