import 'package:event_finder/screens/login.dart';
import 'package:event_finder/screens/onboarding.dart';
import 'package:event_finder/screens/signup.dart';
import 'package:event_finder/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    const ProviderScope(
      child: EventFinder()
    )
  );
}

class EventFinder extends StatelessWidget {
  const EventFinder({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Event Finder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFFF7D0D)),
        useMaterial3: true,
      ),
      home: const SplashScreen(),
      routes: <String, WidgetBuilder>{
        '/onBoarding': (context) => const OnBoardingScreen(),
        '/logIn': (context) => const LoginScreen(),
        '/signUp': (context) => SignupScreen(),
      }
    );
  }
}

