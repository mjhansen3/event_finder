import 'package:event_finder/riverpod/riverpod.dart';
import 'package:event_finder/widgets/finder_checkbox.dart';
import 'package:event_finder/widgets/form_label.dart';
import 'package:event_finder/widgets/terms_use_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends ConsumerWidget {
  final Function onSavedEmail;
  final Function onSavedPassword;
  final Widget signUpButton;
  final AutovalidateMode autoValidate;
  final Key formKey;
  final Function validateEmail;
  final Function validatePassword;
  final Function? validateConfirmPassword;
  final Widget? showPasswordButton;
  final Widget? showConfirmPasswordButton;

  const SignUpForm({
    super.key,
    required this.formKey,
    required this.onSavedEmail,
    required this.onSavedPassword,
    required this.signUpButton,
    required this.validateEmail,
    required this.autoValidate,
    required this.validatePassword,
    this.validateConfirmPassword,
    this.showPasswordButton,
    this.showConfirmPasswordButton,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          formLabel("Email"),
          SizedBox(
            height: 5.h,
          ),
          TextFormField(
            controller: ref.watch(riverpod).signupEmailController,
            textCapitalization: TextCapitalization.none,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w400,
            ),
            decoration: _inputDecoration(
              'eg. someone@somewhere.com',
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (e){},
            textInputAction: TextInputAction.next,
          ),
          SizedBox(
            height: 23.h,
          ),
          formLabel("Password"),
          SizedBox(
            height: 5.h,
          ),
          TextFormField(
            obscureText: ref.watch(riverpod).signupObscurePassword,
            obscuringCharacter: '•',
            controller: ref.watch(riverpod).signupPasswordController,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w400,
            ),
            decoration: _inputDecoration(
              '', 
              suffixIcon: showPasswordButton,
            ),
            onSaved: (e){},
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(
            height: 23.h,
          ),
          formLabel("Confirm Password"),
          SizedBox(
            height: 5.h,
          ),
          TextFormField(
            obscureText: ref.read(riverpod).signupObscureConfirmPassword,
            obscuringCharacter: '•',
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w400,
            ),
            decoration: _inputDecoration(
              '', 
              suffixIcon: showConfirmPasswordButton,
            ),
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.done,
          ),
          SizedBox(
            height: 15.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const FinderCheckbox(
                activeColor: Color.fromARGB(145, 255, 229, 208), 
                checkColor: Color(0xFFFF7D0D),
                radius: 4.0
              ),
              SizedBox(
                width: 5.w,
              ),
              termsOfUseText(),
            ],
          ),
          SizedBox(
            height: 17.h,
          ),
          signUpButton,
        ],
      ),
    );
  } 
  
  // Helper methods for common UI elements
  InputDecoration _inputDecoration(String? hintText, {Widget? suffixIcon}) {
    return InputDecoration(
      isDense: true,
      contentPadding: EdgeInsets.fromLTRB(10.w, 8.5.h, 10.w, 8.5.h),
      hintText: hintText,
      hintStyle: TextStyle(
        fontSize: 16.sp,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w400,
        color: const Color(0xAA666666),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0.w),
        borderSide: BorderSide(
          color: const Color(0xFFFF7D0D),
          width: 1.25.w,
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0.w),
        borderSide: BorderSide(
          color: const Color(0xFFEEEEEE),
          width: 1.25.w,
        ),
      ),
      suffixIcon: suffixIcon,
    );
  }
}
