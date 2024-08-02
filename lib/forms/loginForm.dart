// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogInForm extends StatefulWidget {
  final Function onSavedEmail;
  /*final Function onSavedPassword;
  final Widget logInButton;*/
  final AutovalidateMode autoValidate;
  final Key formKey;
  final Function validateEmail;

  const LogInForm({
    super.key,
    required this.formKey,
    required this.onSavedEmail,
    /*required this.onSavedPassword,*/
    /*required this.logInButton,*/
    required this.validateEmail,
    required this.autoValidate,
  });

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  bool _obscureText = true;

  // shows password
  void _passwordVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(375, 812));
    ScreenUtil.enableScale(enableWH: () => true, enableText: () => true);

    return Form(
      key: widget.formKey,
      autovalidateMode: widget.autoValidate,
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
              fontWeight: FontWeight.w400,
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
                  color: const Color(0xAA9A9A9A),
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
            onSaved: widget.onSavedEmail(),
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
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          TextFormField(
            obscureText: _obscureText,
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
                onPressed: _passwordVisibility,
                icon: _obscureText
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
            onSaved: widget.onSavedEmail(),
            //textInputAction: TextInputAction.next,
          ),
        ],
      ),
    );
  }
}