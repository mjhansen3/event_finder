import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final background = Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
          "lib/assets/images/splash_screen.png",
        ),
        fit: BoxFit.fill,
      ),
    ),
  );

  /*void splashTimeOut() {
    var user = StoreProvider.of<AppState>(context).state.userState != null
        ? StoreProvider.of<AppState>(context).state.userState["user"]
        : null;
    if (user != null && user["verified"] == true) {
      Navigator.pushReplacementNamed(context, '/homeCalendar');
    } else if (user != null && user["verified"] == false) {
      Navigator.pushReplacementNamed(context, '/emailVerifyScreen');
    } else {
      Navigator.pushReplacementNamed(context, '/getStarted');
    }
  }*/

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Navigator.pushReplacementNamed(context, '/onBoarding'));
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    ScreenUtil.enableScale(enableWH: () => true, enableText: () => true);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          background,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 75.h),
              Image.asset(
                'lib/assets/images/Logo.png',
                width: 250.w,
                height: 50.h,
              ),
              SizedBox(height: 10.h),
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
                        /*fontWeight: FontWeight.w700,
                        letterSpacing: 1.0,*/
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 200.h)
            ],
          )
        ],
      ),
    );
  }
}