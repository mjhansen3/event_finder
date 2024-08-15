import 'package:event_finder/screens/home.dart';
import 'package:event_finder/screens/login.dart';
import 'package:event_finder/screens/onboarding.dart';
import 'package:event_finder/screens/signup.dart';
import 'package:event_finder/screens/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    const ProviderScope(
      child: EventFinder()
    )
  );
}

class EventFinder extends ConsumerWidget {
  const EventFinder({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    ScreenUtil.enableScale(enableWH: () => true, enableText: () => true);

    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    
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

