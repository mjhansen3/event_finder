import 'package:event_finder/widgets/forms/signup_form.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:validated/validated.dart' as validate;

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<SignupScreen> {
  final GlobalKey<FormState> _signUpFormKey = GlobalKey<FormState>();

  bool btnClicked = false;
  bool validateSignupForm = false;

  String? _validateEmail(String value) {
    if (value.isEmpty) {
      return "The email address is required.";
    } else {
      try {
        validate.isEmail(value);
      } catch (e) {
        return 'The email address must be a valid email address.';
      }
    }

    return null;
  }

  submit() async {
    setState(() {
      validateSignupForm = true;
    });

    if (_signUpFormKey.currentState!.validate()) {
      _signUpFormKey.currentState?.save(); // Save our form now.
    } else {
      if (kDebugMode) {
        print("error");
      }
      setState(() {
        validateSignupForm = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    ScreenUtil.enableScale(enableWH: () => true, enableText: () => true);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

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
                onSavedEmail: () {}, 
                validateEmail: _validateEmail, 
                autoValidate: AutovalidateMode.onUserInteraction,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
