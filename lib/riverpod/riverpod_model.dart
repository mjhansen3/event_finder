import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class RiverpodModel extends ChangeNotifier {
  bool signupObscurePassword;
  bool signupObscureConfirmPassword;
  bool loginObscurePassword;
  late TextEditingController signupEmailController;
  late TextEditingController signupPasswordController;
  late SharedPreferences prefs;
  late bool completedOnboarding;

  // Onboarding state managed by this model
  // bool _hasCompletedOnboarding = false;

  // bool get hasCompletedOnboarding => _hasCompletedOnboarding;

  RiverpodModel({
    required this.signupObscurePassword,
    required this.signupObscureConfirmPassword,
    required this.loginObscurePassword,
    required this.signupEmailController,
    required this.signupPasswordController,
  }) {
    loadPreferences();
  }
  
  // Asynchronous method to load preferences
  Future<void> loadPreferences() async {
    prefs = await SharedPreferences.getInstance();
    completedOnboarding = prefs.getBool('completedOnboarding')!;
    

    debugPrint('Loaded Preferences!');
    debugPrint('Loaded Onboarding Status: $completedOnboarding');
  }

  // Method to set onboarding completed flag
  void completeOnboarding() async {
    prefs = await SharedPreferences.getInstance();
    completedOnboarding = await prefs.setBool('completedOnboarding', true);
    notifyListeners();

    debugPrint('Onboarding Status Saved');
  }

  // show login password: on LoginForm
  void passwordVisibilityLoginForm() {
    loginObscurePassword = !loginObscurePassword;
    notifyListeners();

    debugPrint('Hide Password: $loginObscurePassword');
  }

  // show signup password: on SignupForm
  void passwordVisibilitySignupForm() {
    signupObscurePassword = !signupObscurePassword;
    notifyListeners();

    debugPrint('Hide Password: $signupObscurePassword');
  }

  // show confirm password: on SignupForm
  void confirmPasswordVisibilitySignupForm() {
    signupObscureConfirmPassword = !signupObscureConfirmPassword;
    notifyListeners();

    debugPrint('Hide Confirm Password: $signupObscureConfirmPassword');
  }
}