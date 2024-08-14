import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileIcon extends StatelessWidget {
  final String imgString;

  const ProfileIcon({
    super.key,
    required this.imgString,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        right: 10.w,
      ),
      width: 50.w,
      height: 50.h,
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(5.r),
        ),
        child: Image.asset(imgString),
      ),
    );
  }
}