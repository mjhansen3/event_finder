import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LngFinderButton extends StatelessWidget {
  final Function onPressed;
  final Color bgColor;
  final bool hasElevation;
  final Offset? elevation;
  final Color? elevationColor;
  final String btnText;
  final Color btnTextColor;
  final bool hasBtnImage;
  final String? btnImage;

  const LngFinderButton({
    super.key,
    required this.onPressed,
    required this.bgColor,
    required this.hasElevation,
    this.elevation,
    this.elevationColor,
    required this.btnText,
    required this.btnTextColor,
    required this.hasBtnImage,
    this.btnImage,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed(),
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8.0.w),
          boxShadow: [
            BoxShadow(
              color: hasElevation ? elevationColor ?? Colors.grey : Colors.transparent,
              offset: hasElevation ? elevation ?? const Offset(0.0, 1.0) : const Offset(0.0, 0.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            hasBtnImage
            ? Padding(
              padding: EdgeInsets.only(right: 10.0.w),
              child: SizedBox(
                width: 20.w,
                height: 20.h,
                child: Image.asset(
                  hasBtnImage ? btnImage ?? '' : '',
                  fit: BoxFit.fill,
                ),
              ),
            )
            : const SizedBox(),
            Center(
              child: Text(
                btnText,
                style: TextStyle(
                  color: btnTextColor,
                  fontSize: 16.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w900,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
