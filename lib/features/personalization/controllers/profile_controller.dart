import 'package:az_store/data/repositories/auth/auth_repository.dart';
import 'package:az_store/data/repositories/user/user_repository.dart';
import 'package:az_store/features/auth/screens/login/login.dart';
import 'package:az_store/features/personalization/controllers/user_controller.dart';
import 'package:az_store/features/personalization/models/user_model.dart';
import 'package:az_store/features/personalization/screens/profile/widgets/delete_account_dialog.dart';
import 'package:az_store/features/personalization/screens/profile/widgets/re_authenticate_form.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl_phone_field/phone_number.dart';

class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  final controller = UserController.instance;
  late UserModel user = controller.userModel.value;

  final GlobalKey<FormState> key = GlobalKey<FormState>();

  late final TextEditingController firstNameCtr =
      TextEditingController(text: user.firstName);
  late final TextEditingController lastNameCtr =
      TextEditingController(text: user.lastName);
  late final TextEditingController phoneNumberCtr =
      TextEditingController(text: user.phoneNumber);

  final TextEditingController oldPwdCtr = TextEditingController();
  final TextEditingController newPwdCtr = TextEditingController();
  final TextEditingController confirmPwdCtr = TextEditingController();
  final TextEditingController verifyEmailCtr = TextEditingController();
  final TextEditingController verifyPwdCtr = TextEditingController();

  Rx<bool> showCurrentPassword = false.obs;
  Rx<bool> showNewPassword = false.obs;
  Rx<bool> showConfirmationPassword = false.obs;
  Rx<bool> showVerifyPassword = false.obs;

  Rx<bool> isLoading = false.obs;
  Rx<bool> isProfileImgLoading = false.obs;

  final authRepository = AuthRepository.instance;
  final userRepository = UserRepository.instance;

  void togglePassword(Rx<bool> password) {
    password.toggle();
  }

  void changePersonalInfo() async {
    try {
      isLoading.value = true;
      final String displayName =
          '${firstNameCtr.text.capitalize} ${lastNameCtr.text.capitalize}';

      if (key.currentState!.validate()) {
        final normalizedPhoneNumber = PhoneNumber(
                countryISOCode: 'DZ',
                countryCode: '+213',
                number: phoneNumberCtr.text.startsWith("0")
                    ? phoneNumberCtr.text.substring(1)
                    : phoneNumberCtr.text)
            .completeNumber;

        /// Update the user collection in firebase
        await userRepository.updateUserInfo({
          "firstName": firstNameCtr.text,
          "lastName": lastNameCtr.text,
          "phoneNumber": normalizedPhoneNumber,
          "displayName": displayName
        });

        /// Update the user state
        controller.userModel.update((user) {
          user?.firstName = firstNameCtr.text;
          user?.lastName = lastNameCtr.text;
          user?.phoneNumber = normalizedPhoneNumber;
          user?.displayName = displayName;
        });

        Get.back();
      } else {
        return;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void changePassword() async {
    try {
      if (key.currentState!.validate()) {
        isLoading.value = true;

        await AuthRepository.instance
            .changePassword(oldPwdCtr.text, newPwdCtr.text);
        Get.offAll(() => const Login());
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void logout() async {
    await AuthRepository.instance.signOut();
    Get.offAll(() => const Login());
  }

  void showDeleteAccountDialog() {
    showDialog(
        context: Get.overlayContext!,
        builder: (_) => DeleteAccountDialog(
              onConfirm: deleteUserAccount,
            ));
  }

  void deleteUserAccount() async {
    try {
      final provider =
          authRepository.authUser!.providerData.map((e) => e.providerId).first;

      if (provider.isNotEmpty) {
        /// Google provider
        if (provider == "google.com") {
          await authRepository.signInWithGoogle();
          await authRepository.deleteAccount();
        }

        /// Email and password provider
        if (provider == "password") {
          Get.back(closeOverlays: true);
          Get.to(() => const ReAuthenticateLogin());
        }
        Get.offAll(() => const Login());
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    }
  }

  void reAuthenticateEmailAndPassword() async {
    try {
      isLoading.value = true;
      if (key.currentState!.validate()) {
        await authRepository.reauthenticateWithEmailAndPassword(
            verifyEmailCtr.text, verifyPwdCtr.text);
        await authRepository.deleteAccount();
        Get.offAll(() => const Login());
      } else {
        return;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void changeProfilePicture() async {
    try {
      final pickedImage =
          await ImagePicker().pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        isProfileImgLoading.value = true;
        final url = await userRepository.uploadImage(
            "images/profile/${authRepository.authUser!.uid}", pickedImage);
        await userRepository.updateUserInfo({'profilePicture': url});
        controller.userModel.update((val) {
          val?.profilePicture = url;
        });
      }
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      isProfileImgLoading.value = false;
    }
  }

  @override
  void dispose() {
    firstNameCtr.dispose();
    lastNameCtr.dispose();
    phoneNumberCtr.dispose();
    oldPwdCtr.dispose();
    newPwdCtr.dispose();
    super.dispose();
  }
}
