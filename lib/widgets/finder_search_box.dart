import 'package:event_finder/widgets/buttons/finder_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinderSearchBox extends StatelessWidget {
  const FinderSearchBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 275.w,
          child: TextFormField(
            style: TextStyle(
              fontSize: 16.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w400,
            ),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.fromLTRB(10.w, 8.5.h, 10.w, 8.5.h),
              hintText: "Find your location...",
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
            ),
            keyboardType: TextInputType.emailAddress,
            onSaved: (e){},
          ),
        ),
        const Spacer(),
        FinderButton(
          onPressed: (){},
          btnImageSVG: true,
          btnWidth: 40.w,
          bgColor: const Color(0xFFFF7D0D),
          hasElevation: false,
          hasBtnText: false,
          hasBtnImage: true,
          btnImage: 'lib/assets/icons/search.svg',
        )
      ],
    );
  }
}