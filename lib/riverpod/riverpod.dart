import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'riverpod_model.dart';

final riverpod = ChangeNotifierProvider<RiverpodModel>((ref) {
  return RiverpodModel(
    loginObscurePassword: true,
    signupObscurePassword: true,
    signupObscureConfirmPassword: true,
    signupEmailController: TextEditingController(),
    signupPasswordController: TextEditingController(),
  );
});
