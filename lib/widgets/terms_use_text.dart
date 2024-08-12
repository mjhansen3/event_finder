import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget termsOfUseText() {
  return RichText(
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
        ),
      ],
    ),
  );
} 