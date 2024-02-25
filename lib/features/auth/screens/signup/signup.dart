import 'package:az_store/features/auth/screens/signup/widgets/signup_form.dart';
import 'package:az_store/features/auth/screens/signup/widgets/signup_header.dart';
import 'package:az_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common_widgets/form_divider.dart';
import '../../common_widgets/social_buttons.dart';


class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SignupHeader(),
              SizedBox(
                height: 32.h,
              ),
              const SignupForm(),
              SizedBox(
                height: 32.h,
              ),
              const FormDivider(dividerText: KTexts.orSignUpWith),
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
