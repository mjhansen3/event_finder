import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'home.dart';

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
          fit: BoxFit.fill),
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
    /*Timer(const Duration(seconds: 3), const HomeScreen() as void Function());*/
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(640, 1136));
    ScreenUtil.enableScale(enableWH: () => true, enableText: () => true);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          background,
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'lib/assets/images/Logo.png',
                width: 400.w,
                height: 125.h,
              ),
              /*SizedBox(height: 15.h),*/
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Enjoy your traveling",
                      style: TextStyle(
                        color: const Color(0xFF000000),
                        fontSize: 28.sp,
                        fontFamily: 'EventFinder',
                        /*fontWeight: FontWeight.w700,*/
                        letterSpacing: 1.0,
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