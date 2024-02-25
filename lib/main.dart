import 'package:az_store/data/repositories/auth/auth_repository.dart';
import 'package:az_store/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:az_store/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async{
  /// Widgets binding
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// Getx storage
  await GetStorage.init();

  /// Await splash screen
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  /// Firebase initialization
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((_) {
    Get.put(AuthRepository());
  });

  /// Initialize stripe public key
  Stripe.publishableKey = 'pk_test_51Ncr3mHk05O5rHvm9eJ8Y4H3cCZRejf7s7pmYOQFDtoKPD1QSAMQJFAnZn5Y8PSwVxHtE0CEEIKD8Q3s9aKzqcJx00Cbb49hj4';
  //Stripe.merchantIdentifier = 'merchant_id';
  await Stripe.instance.applySettings();

  runApp(const App());
}