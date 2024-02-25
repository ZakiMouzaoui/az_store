import 'package:az_store/common/widgets/navigation_menu.dart';
import 'package:az_store/data/repositories/user/user_repository.dart';
import 'package:az_store/features/auth/screens/login/login.dart';
import 'package:az_store/features/auth/screens/on_boarding/on_boarding.dart';
import 'package:az_store/features/auth/screens/signup/verify_email.dart';
import 'package:az_store/utils/exceptions/firebase_auth_exceptions.dart';
import 'package:az_store/utils/exceptions/firebase_exceptions.dart';
import 'package:az_store/utils/exceptions/format_exceptions.dart';
import 'package:az_store/utils/exceptions/platform_exceptions.dart';
import 'package:az_store/utils/local_storage/storage_utility.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository extends GetxController {
  static AuthRepository get instance => Get.find();

  final _deviceStorage = GetStorage();
  final auth = FirebaseAuth.instance;
  User? get authUser => auth.currentUser;

  @override
  void onReady() {
    FlutterNativeSplash.remove();
    redirect();
  }

  void redirect() async {
    final currentUser = auth.currentUser;

    if (currentUser != null) {
      if (currentUser.emailVerified) {
        await KLocalStorage.init(currentUser.uid);
        Get.to(() => const NavigationMenu());
      } else {
        Get.to(() => VerifyEmail(
              email: currentUser.email,
            ));
      }
    } else {
      _deviceStorage.writeIfNull("showOnBoarding", true);
      _deviceStorage.read("showOnBoarding") != true
          ? Get.off(() => const Login())
          : Get.off(() => const OnBoarding());
    }
  }

  void completeOnBoarding() {
    _deviceStorage.write("showOnBoarding", false);
  }

  Future<UserCredential> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      return await auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<void> sendEmailVerification() async {
    try {
      await auth.currentUser!.sendEmailVerification();
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      await KLocalStorage.init(credential.user!.uid);
      return credential;
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<UserCredential> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      final userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
      await KLocalStorage.init(userCredential.user!.uid);
      return userCredential;

    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    try {
      final LoginResult loginResult = await FacebookAuth.instance.login();
      final OAuthCredential facebookAuthCredential =
          FacebookAuthProvider.credential(loginResult.accessToken!.token);
      return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<void> sendPasswordResetLink(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<void> reauthenticateWithEmailAndPassword(
      String email, String password) async {
    try {
      if(authUser != null){
        final credential =
        EmailAuthProvider.credential(email: email, password: password);
        await authUser!.reauthenticateWithCredential(credential);
      }

    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<void> changePassword(
      String currentPassword, String newPassword) async {
    try {
      await reauthenticateWithEmailAndPassword(
              authUser!.email!, currentPassword)
          .then((value) => authUser?.updatePassword(newPassword));
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<void> signOut() async {
    try {
      final providerId = authUser!.providerData[0].providerId;
      await auth.signOut();

      if(providerId == "google.com"){
        await GoogleSignIn().signOut();
      }
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }

  Future<void> deleteAccount() async {
    try {
      await UserRepository.instance.removeUserRecord(authUser!.uid);
      await authUser!.delete();
    } on FirebaseAuthException catch (e) {
      throw KFirebaseAuthException(e.code).message;
    } on FirebaseException catch (e) {
      throw KFirebaseException(e.code).message;
    } on FormatException catch (e) {
      throw KFormatException(e.message).message;
    } on PlatformException catch (e) {
      throw KPlatformException(e.code).message;
    }
  }
}
