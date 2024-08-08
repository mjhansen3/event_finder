import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class RiverpodModel extends ChangeNotifier {
  bool signupObscurePassword;
  bool signupObscureConfirmPassword;
  bool loginObscurePassword;

  RiverpodModel({
    required this.signupObscurePassword,
    required this.signupObscureConfirmPassword,
    required this.loginObscurePassword,
  });

  // show login password: on LoginForm
  void passwordVisibilityLoginForm() {
    loginObscurePassword = !loginObscurePassword;
    notifyListeners();

    if (kDebugMode) {
      print("Hide Password: $loginObscurePassword");
    }
  }

  // show signup password: on SignupForm
  void passwordVisibilitySignupForm() {
    signupObscurePassword = !signupObscurePassword;
    notifyListeners();

    if (kDebugMode) {
      print("Hide Password: $signupObscurePassword");
    }
  }

  // show confirm password: on SignupForm
  void confirmPasswordVisibilitySignupForm() {
    signupObscureConfirmPassword = !signupObscureConfirmPassword;
    notifyListeners();

    if (kDebugMode) {
      print("Hide Confirm Password: $signupObscureConfirmPassword");
    }
  }
}