import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinderCheckbox extends StatefulWidget {
  final Color activeColor;
  final Color checkColor;
  final double radius;
  
  const FinderCheckbox({
    super.key,
    required this.activeColor,
    required this.checkColor,
    required this.radius,
  });

  @override
  State<FinderCheckbox> createState() => _FinderCheckboxState();
}

class _FinderCheckboxState extends State<FinderCheckbox> {
  bool _checkValue = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (_checkValue) {
          setState(() {
            _checkValue = !_checkValue;
          });

          if (kDebugMode) {
            print(_checkValue);
          }
        }
      },
      child: Container(
        width: 15.w,
        height: 15.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: _checkValue ? widget.activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(widget.radius.w),
        ),
        child: _checkValue
          ? Icon(
            Icons.check,
            size: 20.0.dg,
            color: widget.checkColor,
          )
          : Icon(
            Icons.check_box_outline_blank,
            size: 20.0.dg,
            color: const Color(0xFFEEEEEE),
          ),
        ),
      );
  }
}