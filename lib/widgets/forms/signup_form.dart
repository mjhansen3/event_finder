import 'package:event_finder/riverpod/riverpod.dart';
import 'package:event_finder/widgets/finder_checkbox.dart';
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
  final Function validateConfirmPassword;
  final TextEditingController emailController;
  final TextEditingController passwordController;
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
    required this.emailController,
    required this.passwordController,
    required this.validatePassword,
    required this.validateConfirmPassword,
    this.showPasswordButton,
    this.showConfirmPasswordButton,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    ScreenUtil.enableScale(enableWH: () => true, enableText: () => true);

    return Form(
      key: formKey,
      autovalidateMode: autoValidate,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Email',
            style: TextStyle(
              color: const Color(0xFF666666),
              fontSize: 16.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          TextFormField(
            controller: emailController,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(10.w, 8.5.h, 10.w, 8.5.h),
              hintText: "eg. someone@gmail.com",
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
              /*errorText: 'Requires a valid Email.',
              errorStyle: TextStyle(
                fontSize: 12.sp,
                fontFamily: 'Gilroy',
                fontWeight: FontWeight.w400,
                color: Colors.red,
              ),*/
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (e){},
            textInputAction: TextInputAction.next,
          ),
          SizedBox(
            height: 23.h,
          ),
          Text(
            'Password',
            style: TextStyle(
              color: const Color(0xFF666666),
              fontSize: 16.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          TextFormField(
            obscureText: ref.watch(riverpod).signupObscurePassword,
            obscuringCharacter: '•',
            controller: passwordController,
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(10.w, 8.5.h, 10.w, 8.5.h),
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
              suffixIcon: showPasswordButton,
            ),
            onSaved: (e){},
            keyboardType: TextInputType.text,
            textInputAction: TextInputAction.next,
          ),
          SizedBox(
            height: 23.h,
          ),
          Text(
            'Confirm Password',
            style: TextStyle(
              color: const Color(0xFF666666),
              fontSize: 16.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
            ),
          ),
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
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(10.w, 8.5.h, 10.w, 8.5.h),
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
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'I agree and accept the ',
                      style: TextStyle(
                        color: const Color(0xFF000000),
                        fontSize: 13.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    TextSpan(
                      text: 'terms of use.',
                      style: TextStyle(
                        color: const Color(0xFFFF7D0D),
                        fontSize: 13.sp,
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w500,
                      ),
                    )
                  ]
                )
              ),
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
}
