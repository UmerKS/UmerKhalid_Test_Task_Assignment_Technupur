import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:umer_khalid/res/strings/images.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(80.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 2.0,
      automaticallyImplyLeading: F,
      leadingWidth: 60.w,
      leading: Image.asset(AppAssets.muneIcon, height: 37.h, width: 37.w),

      centerTitle: T,
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [Image.asset(AppAssets.appBarLogo)],
      ),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 20.w),
          child: Image.asset(AppAssets.serachIcon, height: 37.h, width: 37.w),
        ),
      ],
    );
  }
}
