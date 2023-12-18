 import 'package:find_work_or_worker/core/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Color? color;
  const CustomContainer({super.key, required this.width, required this.text, required this.height, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.sp)),
        border: Border.all(width: 3.sp, color: mode.value == ThemeMode.light ? Colors.black : Colors.white),
        color: color ?? Colors.transparent
      ),
      child: Text(text, style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600, color: mode.value == ThemeMode.light ? Colors.black : Colors.white)),
    );
  }
}
