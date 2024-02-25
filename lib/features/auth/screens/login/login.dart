import 'package:az_store/features/auth/common_widgets/form_divider.dart';
import 'package:az_store/features/auth/common_widgets/social_buttons.dart';
import 'package:az_store/features/auth/screens/login/widgets/login_form.dart';
import 'package:az_store/features/auth/screens/login/widgets/login_header.dart';
import 'package:az_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const LoginHeader(),
              SizedBox(
                height: 32.h,
              ),
              const LoginForm(),
              SizedBox(
                height: 32.h,
              ),
              const FormDivider(dividerText: KTexts.orSignInWith),
              SizedBox(
                height: 32.h,
              ),
              const SocialButtons()
            ],
          ),
        ),
      ),
    );
  }
}
