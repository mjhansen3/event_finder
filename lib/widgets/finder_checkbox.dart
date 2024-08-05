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
  late bool _checkValue;

  @override
  void initState() {
    _checkValue = false;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {    
        setState(() {
          _checkValue = !_checkValue;
        });

        if (kDebugMode) {
          print(_checkValue);
        }
      },
      splashColor: const Color.fromARGB(145, 255, 229, 208),
      customBorder: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(widget.radius.r),
      ),
      child: Container(
        width: 15.w,
        height: 15.h,
        decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: _checkValue ? widget.activeColor : Colors.transparent,
          borderRadius: BorderRadius.circular(widget.radius.r),
        ),
        child: _checkValue
          ? Icon(
            Icons.check,
            size: 10.0.dg,
            color: widget.checkColor,
          )
          : Container(
            width: 15.w,
            height: 15.h,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: const Color(0xFFEEEEEE),
              borderRadius: BorderRadius.circular(widget.radius.w),
            ),
          ),
        ),
      );
  }
}