import 'package:event_finder/widgets/finder_search_box.dart';
import 'package:event_finder/widgets/header.dart';
import 'package:event_finder/widgets/profile_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              FinderAppBar(
                hasTitle: false,
                bgAppBarColor: Colors.white,
                leadingIcon: IconButton(
                  icon: SvgPicture.asset(
                    'lib/assets/icons/menu-bar.svg',
                    width: 10.w,
                    height: 10.h,
                  ),
                  onPressed: () {
                    Navigator.pushNamed(context, "/sideMenu");
                  },
                ),
                actionWidget: const [
                  ProfileIcon(
                      imgString: "lib/assets/images/profile_placeholder.png")
                ],
                titleCenter: true,
                pinnedAppBar: true,
                heightExpanded: 25.0,
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Container(
                      margin: EdgeInsets.only(
                        top: 47.h,
                        left: 20.w,
                        bottom: 150.h,
                        right: 20.w,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Get Ready For \nThe Travel Trip!',
                            style: TextStyle(
                              color: const Color(0xFF000000),
                              fontSize: 26.sp,
                              fontFamily: 'Marcellus',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          SizedBox(height: 32.h,),
                          const FinderSearchBox(),
                          SizedBox(
                            height: 30.h,
                          ),
                          Text(
                            'My Location',
                            style: TextStyle(
                              color: const Color(0xFF000000),
                              fontSize: 26.sp,
                              fontFamily: 'Gilroy-Bold',
                            ),
                          ),
                          SizedBox(
                            height: 19.h,
                          )
                        ],
                      ),
                    );
                  },
                  childCount: 1,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}