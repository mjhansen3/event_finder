import 'package:event_finder/screens/home.dart';
import 'package:event_finder/screens/login.dart';
import 'package:event_finder/screens/onboarding.dart';
import 'package:event_finder/screens/signup.dart';
import 'package:event_finder/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(
    const ProviderScope(
      child: EventFinder()
    )
  );
}

class EventFinder extends StatelessWidget {
  const EventFinder({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    ScreenUtil.enableScale(enableWH: () => true, enableText: () => true);
    
    return MaterialApp(
      title: 'Event Finder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF7D0D)),
        useMaterial3: true,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/onBoarding': (context) => const OnBoardingScreen(),
        '/logIn': (context) => const LoginScreen(),
        '/signUp': (context) => SignupScreen(),
        '/home': (context) => const HomeScreen(),
      }
    );
  }
}

