import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomElement extends StatelessWidget {
  final String image;
  final String text;
  final String elementText;
  const CustomElement({super.key, required this.image, required this.text, required this.elementText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding:
          EdgeInsets.symmetric(vertical: 5.sp),
          child: Image.asset(
            image,
            height: 30.sp,
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 10.sp),
            child: Text(
              "$text $elementText",
              style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w900,
                  ),
            ),
          ),
        ),
      ],
    );
  }
}
