import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInButton extends StatelessWidget {
  final Function onPressed;
  final bool btnLoginClicked;

  const LogInButton({
    super.key,
    required this.onPressed,
    required this.btnLoginClicked,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed(),
      child: Container(
        height: 40.h,
        decoration: BoxDecoration(
          color: const Color(0xFFFF7D0D),
          borderRadius: BorderRadius.circular(8.0.w),
          boxShadow: const [
            BoxShadow(
              color: Color(0xFFFFD1AA),
              offset: Offset(0.0, 2.0),
              blurRadius: 6.0,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                "Log In",
                style: TextStyle(
                  color: const Color(0xFFFFFFFF),
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
