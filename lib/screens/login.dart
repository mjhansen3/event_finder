import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(430, 932));
    ScreenUtil.enableScale(enableWH: () => true, enableText: () => true);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: 430.w,
          height: 932.h,
          margin: EdgeInsets.only(left: 20.w, right: 20.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'lib/assets/images/Logo.png',
                width: 256.w,
                height: 86.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}