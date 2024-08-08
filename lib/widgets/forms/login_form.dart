import 'package:event_finder/riverpod/riverpod.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoginForm extends ConsumerWidget {
  final Function onSavedEmail;
  final Widget loginButton;
  final Widget? socialLoginButton;
  final bool hasSocialLogin;
  final AutovalidateMode autoValidate;
  final Key formKey;
  final Function validateEmail;

  const LoginForm({
    super.key,
    required this.formKey,
    required this.onSavedEmail,
    required this.loginButton,
    this.socialLoginButton,
    required this.hasSocialLogin,
    required this.validateEmail,
    required this.autoValidate,
  }) : assert(
            hasSocialLogin == false || socialLoginButton != null,
            'If hasSocialLogin is true, socialLoginButton must be provided.'); 

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
            onSaved: onSavedEmail(),
            //textInputAction: TextInputAction.next,
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
            obscureText: ref.watch(riverpod).loginObscurePassword,
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
              suffixIcon: IconButton(
                onPressed: () {
                  ref.read(riverpod).passwordVisibilityLoginForm();
                },
                icon: ref.watch(riverpod).loginObscurePassword
                ? SvgPicture.asset(
                  "lib/assets/icons/show.svg",
                  width: 20.w,
                  height: 20.h,
                )
                : SvgPicture.asset(
                  "lib/assets/icons/hide.svg",
                  width: 20.w,
                  height: 20.h,
                ),
              ),
            ),
            keyboardType: TextInputType.visiblePassword,
            onSaved: onSavedEmail(),
            //textInputAction: TextInputAction.next,
          ),
          SizedBox(
            height: 31.h,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '');
            },
            child: Center(
              child: Text(
                'Forgot Password?',
                style: TextStyle(
                  color: const Color(0xFFFF7D0D),
                  fontSize: 13.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 16.h,
          ),
          loginButton,
          SizedBox(
            height: hasSocialLogin ? 16.h : 20.0.h,
          ),
          hasSocialLogin ? Center(
            child: Column(
              children: [
                Text(
                  'Or',
                  style: TextStyle(
                    color: const Color(0xFFAAAAAA),
                    fontSize: 16.sp,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 16.h,
                ),
                Container(child: socialLoginButton),
                SizedBox(
                  height: 20.h,
                ),
              ],
            ),
          ) : const SizedBox.shrink(),
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/signUp');
            },
            child: Center(
              child: Text(
                'Sign Up Here',
                style: TextStyle(
                  color: const Color(0xFFFF7D0D),
                  fontSize: 13.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}