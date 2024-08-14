import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FinderButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Color bgColor;
  final bool hasElevation;
  final Offset elevation;
  final Color elevationColor;
  final bool hasBtnText;
  final String? btnText;
  final Color? btnTextColor;
  final bool hasBtnImage;
  final bool btnImageSVG;
  final String? btnImage;
  final double? btnWidth;

  const FinderButton({
    super.key,
    required this.onPressed,
    required this.bgColor,
    required this.hasElevation,
    this.elevation = const Offset(0.0, 1.0),
    this.elevationColor = Colors.grey,
    required this.hasBtnText,
    this.btnText,
    this.btnTextColor,
    required this.hasBtnImage,
    required this.btnImageSVG,
    this.btnImage,
    this.btnWidth,
  }) : assert(hasBtnText == false || btnText != null,
            'If hasBtnText is true, btnText must be provided.'),
       assert(btnText != null || btnTextColor == null,
            'If btnText is provided, btnTextColor must also be provided.');

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        width: btnWidth,
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(8.0.r),
          boxShadow: [
            BoxShadow(
              color: hasElevation ? elevationColor : Colors.transparent,
              offset: hasElevation ? elevation : const Offset(0.0, 0.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            hasBtnImage
            ? SizedBox(
              child: hasBtnImage && btnImage != null
              ? (btnImageSVG
                ? SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: SvgPicture.asset(
                    btnImage!,
                    fit: BoxFit.contain,
                    alignment: Alignment.center,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                )
                : Padding(
                  padding: EdgeInsets.only(right: 10.w),
                  child: SizedBox(
                    width: 20.w,
                    height: 20.h,
                    child: Image.asset(
                        btnImage!,
                        fit: BoxFit.contain,
                      ),
                  ),
                ))
              : const SizedBox.shrink(),
            )
            : const SizedBox.shrink(),
            hasBtnText
            ? Center(
                child: Text(
                  btnText ?? '',
                  style: TextStyle(
                    color: btnTextColor,
                    fontSize: 16.sp,
                    fontFamily: 'Gilroy',
                    fontWeight: FontWeight.w900,
                  ),
                ),
              )
            : const SizedBox.shrink(),
          ],
        ),
      ),
    );
  }
}
