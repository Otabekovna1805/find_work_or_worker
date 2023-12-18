import 'package:find_work_or_worker/constants/images.dart';
import 'package:find_work_or_worker/constants/strings.dart';
import 'package:find_work_or_worker/pages/home_page.dart';
import 'package:find_work_or_worker/pages/sign_in.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Image.asset(
            Images.logoWhite,
            height: 400.sp,
            width: 500.sp,
          ),
          SizedBox(
            height: 80.sp,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const HomePage()));
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              alignment: Alignment.center,
              height: 67.sp,
              width: 300.sp,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                  border: Border.all(width: 3.sp),
                  color: Colors.black),
              child: Text(Strings.joinUs,
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white)),
            ),
          ),
          SizedBox(
            height: 20.sp,
          ),
          InkWell(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const SignInPage()));
            },
            borderRadius: BorderRadius.circular(20),
            child: Container(
              alignment: Alignment.center,
              height: 67.sp,
              width: 300.sp,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                border: Border.all(width: 3.sp, color: Colors.black),
              ),
              child: Text(
                Strings.signIn,
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
