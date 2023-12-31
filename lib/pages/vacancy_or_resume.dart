import 'package:find_work_or_worker/constants/strings.dart';
import 'package:find_work_or_worker/pages/resume_page.dart';
import 'package:find_work_or_worker/pages/vacancy_page.dart';
import 'package:find_work_or_worker/views/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class VacancyOrResume extends StatelessWidget {
  const VacancyOrResume({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 30),
          child: Column(
            children: [
              LottieBuilder.asset(
                "assets/lotties/resume_vacancy.json",
                height: 300.sp,
              ),

              SizedBox(
                height: MediaQuery.sizeOf(context).height * 0.19,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const ResumePage()));
                      },
                      borderRadius: BorderRadius.circular(20),
                        child: CustomContainer(width: 315, text: Strings.addResume, height: 67.sp)
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),


                    /// #button for log in
                    InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const VacancyPage()));
                      },
                      borderRadius: BorderRadius.circular(20),
                      child: CustomContainer(width: 315, text: Strings.addVacancy, height: 67.sp)
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
