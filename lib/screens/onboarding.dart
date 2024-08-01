import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context, designSize: const Size(430, 932));
    ScreenUtil.enableScale(enableWH: () => true, enableText: () => true);

    return OnBoardingSlider(
      controllerColor: const Color(0xFFFF7D0D),
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      speed: 1.8,
      finishButtonText: 'Get Started',
      finishButtonTextStyle: TextStyle(
        color: const Color(0xFFFFFFFF),
        fontSize: 20.sp,
        fontFamily: 'Gilroy',
        fontWeight: FontWeight.w900,
        height: 1.2,
      ),
      finishButtonStyle: const FinishButtonStyle(
        backgroundColor:  Color(0xFFFF7D0D),
        foregroundColor: Color(0xFFFF7D0D),
        elevation: 2.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
        )
      ),
      onFinish: () {
        Navigator.pushReplacementNamed(context, '/logIn');
      },
      background: [
        SizedBox(
          width: 430.w,
          height: 525.h,
          child: Image.asset(
            'lib/assets/images/onboarding_01.png',
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: 430.w,
          height: 525.h,
          child: Image.asset(
            'lib/assets/images/onboarding_02.png',
            fit: BoxFit.fill,
          ),
        ),
        SizedBox(
          width: 430.w,
          height: 525.h,
          child: Image.asset(
            'lib/assets/images/onboarding_03.png',
            fit: BoxFit.fill,
          ),
        ),
      ],
      pageBodies: [
        Container(
          margin: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 540.h,),
              Text(
                'Explore',
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontSize: 42.sp,
                  fontFamily: 'Marcellus',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(height: 20.h,),
              Text(
                'Explore your favourite destination \naround the world.',
                style: TextStyle(
                  color: const Color(0xFFAAAAAA),
                  fontSize: 19.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 540.h,),
              Text(
                'Easy Peasy',
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontSize: 42.sp,
                  fontFamily: 'Marcellus',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Make your travel experience very \neasy & peasy.',
                style: TextStyle(
                  color: const Color(0xFFAAAAAA),
                  fontSize: 19.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: EdgeInsets.only(left: 25.w, right: 25.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 540.h,),
              Text(
                'Enjoy Tour',
                style: TextStyle(
                  color: const Color(0xFF000000),
                  fontSize: 42.sp,
                  fontFamily: 'Marcellus',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 1.0,
                ),
              ),
              SizedBox(height: 20.h,),
              Text(
                'Enjoy your favourite destination with \nyour love one.',
                style: TextStyle(
                  color: const Color(0xFFAAAAAA),
                  fontSize: 19.sp,
                  fontFamily: 'Gilroy',
                  fontWeight: FontWeight.w400,
                  height: 1.2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}