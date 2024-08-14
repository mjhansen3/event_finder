import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinderAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool hasTitle;
  final String? title;
  final Widget leadingIcon;
  final bool titleCenter;
  final bool pinnedAppBar;
  final double heightExpanded;
  final List<Widget> actionWidget;
  final Color bgAppBarColor;


  const FinderAppBar({
    super.key,
    required this.hasTitle,
    this.title,
    required this.leadingIcon,
    required this.titleCenter,
    required this.pinnedAppBar,
    required this.heightExpanded,
    required this.actionWidget,
    required this.bgAppBarColor,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Builder(builder: (BuildContext context) {
        return leadingIcon;
      }),
      title: hasTitle 
      ? Text(
        title ?? '',
        style: TextStyle(
          fontFamily: 'Gilroy',
          fontSize: 26.sp,
          fontWeight: FontWeight.w700,
          color: const Color(0xFF000000),
        ),
      )
      : null,
      actions: actionWidget,
      centerTitle: titleCenter,
      pinned: pinnedAppBar,
      elevation: 0,
      expandedHeight: heightExpanded,
      backgroundColor: bgAppBarColor,
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(25.h);
}