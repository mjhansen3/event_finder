import 'dart:async';

import 'package:event_finder/riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  late SharedPreferences prefs;

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

  @override
  void initState() {
    super.initState();

    // Delay for 3 seconds and navigate to the Home screen
    Future.delayed(const Duration(seconds: 3), () async {
      prefs = await SharedPreferences.getInstance();
      ref.watch(riverpod).completedOnboarding =
          prefs.getBool('completedOnboarding') ?? false;

      if (mounted) {
        final hasCompletedOnboarding =
            ref.watch(riverpod).completedOnboarding;
            debugPrint('Onboarding Status: $hasCompletedOnboarding');

        if (hasCompletedOnboarding == true) {
          debugPrint('Navigate to Login Screen');
          Navigator.of(context).pushReplacementNamed('/logIn');
        } else {
          debugPrint('Navigate to Onboarding Screen');
          Navigator.of(context).pushReplacementNamed('/onBoarding');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
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