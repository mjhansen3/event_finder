import 'package:event_finder/forms/loginForm.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:validated/validated.dart' as validate;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _logInFormKey = GlobalKey<FormState>();

  bool btnClicked = false;
  bool validateLoginForm = false;
  
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
      validateLoginForm = true;
    });

    if (_logInFormKey.currentState!.validate()) {
      _logInFormKey.currentState?.save(); // Save our form now.
    } else {
      if (kDebugMode) {
        print("error");
      }
      setState(() {
        validateLoginForm = false;
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
              SizedBox(height: 126.h,),
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
                  "Log In",
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
              LogInForm(
                formKey: _logInFormKey,
                autoValidate: AutovalidateMode.onUserInteraction,
                validateEmail: _validateEmail,
                onSavedEmail: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}