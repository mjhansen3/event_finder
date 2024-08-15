import 'package:event_finder/services/api.dart';
import 'package:event_finder/widgets/forms/signup_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:validated/validated.dart' as validate;

import '../riverpod/riverpod.dart';
import '../widgets/buttons/finder_button.dart';

class SignupScreen extends ConsumerWidget {
  SignupScreen({super.key});

  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  final bool btnClicked = false;
  final bool validateSignupForm = false;

  String? _validateEmail(String value) {
    // If empty value, the isEmail function throw a error.
    // So I changed this function with try and catch.
    try {
      validate.isEmail(value);
    } catch (e) {
      return 'Requires a valid email address.';
    }

    return null;
  }

  String? _validatePassword(String value) {
    if (value.length < 6) {
      return 'The Password must be at least 6 characters.';
    }

    return null;
  }

  String? _validateConfirmPassword(String value, WidgetRef ref) {
    var password = ref.watch(riverpod).signupPasswordController.text;
    if (value.isEmpty) {
      return "Confirm Password required";
    } else if (value != password) {
      return "Confirm Password mismatch";
    }
    return null;
  }

  void _submitForm(WidgetRef ref, c) async {
    if (_signUpFormKey.currentState!.validate()) {
      _signUpFormKey.currentState?.save();
      var username = ref.watch(riverpod).signupEmailController.text.split('@')[0];

      var signupData = {
        "name": username,
        "email": ref.watch(riverpod).signupEmailController.text,
        "password": ref.watch(riverpod).signupPasswordController.text,
      };

      await Api.createUser(signupData);

      if (c.mounted) {
        Navigator.pushNamedAndRemoveUntil(
          c,
          '/home',
          (Route<dynamic> route) => false,
        );
     }
    } else {
      if (kDebugMode) {
        print("Form is not valid");
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 375.w,
          height: 812.h,
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: 126.h,
              ),
              Image.asset(
                'lib/assets/images/Logo.png',
                width: 180.w,
                height: 50.h,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 77.5.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enjoy your traveling",
                      style: TextStyle(
                        color: const Color(0xFF000000),
                        fontSize: 16.sp,
                        fontFamily: 'Marcellus',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 72.h,
              ),
              Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    color: const Color(0xFF000000),
                    fontSize: 30.sp,
                    fontFamily: 'Marcellus',
                  ),
                ),
              ),
              SizedBox(
                height: 51.h,
              ),
              SignUpForm(
                formKey: _signUpFormKey,
                onSavedEmail: (String value) {
                  ref.read(riverpod).signupEmailController.text = value;
                },
                onSavedPassword: (String value) {
                  ref.read(riverpod).signupPasswordController.text = value;
                },
                validateEmail: _validateEmail,
                validatePassword: _validatePassword,
                validateConfirmPassword: (value) =>
                    _validateConfirmPassword(value!, ref),
                autoValidate: AutovalidateMode.onUserInteraction,
                showPasswordButton: IconButton(
                  onPressed: () {
                    ref.read(riverpod).passwordVisibilitySignupForm();
                  },
                  icon: ref.watch(riverpod).signupObscurePassword
                  ? SvgPicture.asset(
                      "lib/assets/icons/show.svg",
                      width: 20.w,
                      height: 20.h,
                    )
                  : SvgPicture.asset(
                      "lib/assets/icons/hide.svg",
                      width: 20.w,
                      height: 20.h,
                    ),
                ),
                showConfirmPasswordButton: IconButton(
                  onPressed: () {
                    ref.read(riverpod).confirmPasswordVisibilitySignupForm();
                  },
                  icon: ref.watch(riverpod).signupObscureConfirmPassword
                  ? SvgPicture.asset(
                      "lib/assets/icons/show.svg",
                      width: 20.w,
                      height: 20.h,
                    )
                  : SvgPicture.asset(
                      "lib/assets/icons/hide.svg",
                      width: 20.w,
                      height: 20.h,
                    ),
                ),
                signUpButton: FinderButton(
                  onPressed: () => _submitForm(ref, context),
                  btnImageSVG: false,
                  hasBtnImage: false,
                  hasBtnText: true,
                  bgColor: const Color(0xFFFF7D0D),
                  hasElevation: true,
                  elevation: const Offset(0.0, 2.0),
                  elevationColor: const Color(0xFFFFD1AA),
                  btnText: 'Sign Up',
                  btnTextColor: const Color(0xFFFFFFFF),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
