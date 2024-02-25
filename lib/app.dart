import 'package:az_store/bindings/app_bindings.dart';
import 'package:az_store/features/auth/screens/on_boarding/on_boarding.dart';
import 'package:az_store/features/personalization/controllers/settings_controller.dart';
import 'package:connectivity_wrapper/connectivity_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:az_store/utils/constants/text_strings.dart';
import 'package:az_store/utils/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final settingsController = Get.put(SettingsController());

    return ScreenUtilInit(
      designSize: Size(size.width, size.height),
      builder: (_,child)=> ConnectivityAppWrapper(
        app: Obx(
          () => GetMaterialApp(
            title: KTexts.appName,
            themeMode: settingsController.themeMode.value,
            theme: TAppTheme.lightTheme,
            darkTheme: TAppTheme.darkTheme,
            debugShowCheckedModeBanner: false,
            initialBinding: AppBindings(),
            home: const OnBoarding(),
          ),
        ),
      ),
    );
  }
}
