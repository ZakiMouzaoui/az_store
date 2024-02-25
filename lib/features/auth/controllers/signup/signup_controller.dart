import 'package:az_store/data/repositories/auth/auth_repository.dart';
import 'package:az_store/data/repositories/user/user_repository.dart';
import 'package:az_store/features/auth/screens/signup/verify_email.dart';
import 'package:az_store/features/personalization/models/user_model.dart';
import 'package:az_store/utils/helpers/network_manager.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  static SignUpController get instance => Get.find();

  final GlobalKey<FormState> key = GlobalKey<FormState>();
  final TextEditingController firstNameCtr = TextEditingController();
  final TextEditingController lastNameCtr = TextEditingController();
  final TextEditingController emailCtr = TextEditingController();
  final TextEditingController phoneCtr = TextEditingController();
  final TextEditingController passwordCtr = TextEditingController();

  Rx<bool> isChecked = false.obs;
  Rx<bool> isFormSubmitted = false.obs;
  Rx<bool> showPassword = false.obs;
  Rx<bool> isLoading = false.obs;

  final _userRepository = UserRepository.instance;

  void toggleCheckbox() {
    isChecked.toggle();
  }

  void togglePassword() {
    showPassword.toggle();
  }

  Future<void> signup() async {
    try {
      isLoading.value = true;

      /// Check network connectivity
      final isConnected = await ConnectivityWrapper.instance.isConnected;
      if (!isConnected) {
        Fluttertoast.showToast(msg: "No internet connection");
        return;
      }

      /// Validate the form
      if (key.currentState!.validate()) {
        isFormSubmitted.value = true;

        if (!isChecked.value) {
          Fluttertoast.showToast(
              msg: "Please accept the terms of use and policy");
          return;
        }
      }
      else{
        return;
      }

      /// Creating the firebase user
      final userCredential = await AuthRepository.instance
          .createUserWithEmailAndPassword(emailCtr.text, passwordCtr.text);

      final UserModel userModel = UserModel(
          id: userCredential.user!.uid,
          firstName: firstNameCtr.text,
          lastName: lastNameCtr.text,
          displayName: '${firstNameCtr.text.capitalize} ${lastNameCtr.text.capitalize}',
          phoneNumber: phoneCtr.text,
          email: emailCtr.text,
          profilePicture: ""
      );

      await _userRepository.createUser(userModel);
      Get.to(()=> VerifyEmail(email: emailCtr.text,));

    } catch (e) {
      Fluttertoast.showToast(msg: e as String);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void dispose() {
    firstNameCtr.dispose();
    lastNameCtr.dispose();
    emailCtr.dispose();
    phoneCtr.dispose();
    passwordCtr.dispose();
    super.dispose();
  }
}
