import 'package:event_finder/widgets/buttons/lng_finder_button.dart';
import 'package:event_finder/widgets/finder_checkbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SignUpForm extends StatefulWidget {
  final Function onSavedEmail;
  /*final Function onSavedPassword;
  final Widget logInButton;*/
  final AutovalidateMode autoValidate;
  final Key formKey;
  final Function validateEmail;

  const SignUpForm({
    super.key,
    required this.formKey,
    required this.onSavedEmail,
    /*required this.onSavedPassword,*/
    /*required this.logInButton,*/
    required this.validateEmail,
    required this.autoValidate,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
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
              fontWeight: FontWeight.w500,
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
                  color: const Color(0xFFEEEEEE),
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
              fontWeight: FontWeight.w500,
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
          SizedBox(
            height: 23.h,
          ),
          Text(
            'Confirm Password',
            style: TextStyle(
              color: const Color(0xFF666666),
              fontSize: 16.sp,
              fontFamily: 'Gilroy',
              fontWeight: FontWeight.w500,
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
          SizedBox(
            height: 15.h,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /*Checkbox(
                value: false,
                activeColor: const Color.fromARGB(145, 255, 229, 208),
                checkColor: const Color(0xFFFF7D0D),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.w),
                ),
                onChanged: (e) {},
              ),
              SizedBox(
                width: 5.w,
              ),*/
              const FinderCheckbox(
                activeColor: Color.fromARGB(145, 255, 229, 208), 
                checkColor: Color(0xFFFF7D0D),
                radius: 4.0
              ),
              SizedBox(
                width: 5.w,
              ),
              RichText(
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
                    )
                  ]
                )
              ),
            ],
          ),
          SizedBox(
            height: 17.h,
          ),
          LngFinderButton(
            onPressed: () {},
            hasBtnImage: false,
            bgColor: const Color(0xFFFF7D0D),
            hasElevation: true,
            elevation: const Offset(0.0, 2.0),
            elevationColor: const Color(0xFFFFD1AA),
            btnText: 'Sign Up',
            btnTextColor: const Color(0xFFFFFFFF),
          ),
        ],
      ),
    );
  }
}
