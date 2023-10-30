import 'package:find_work_or_worker/constants/strings.dart';
import 'package:find_work_or_worker/core/service_locator.dart';
import 'package:find_work_or_worker/pages/resume_page.dart';
import 'package:find_work_or_worker/pages/vacancy_page.dart';
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
                height: 180.sp,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ResumePage())),
                      child: Container(
                        alignment: Alignment.center,
                        height: 67.sp,
                        width: 300.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                          border: Border.all(
                            width: 3.sp,
                            color: mode == ThemeMode.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        child: Text(
                          Strings.addResume,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color:
                            mode == ThemeMode.dark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20.sp,
                    ),

                    /// #button for log in
                    InkWell(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const VacancyPage())),
                      child: Container(
                        alignment: Alignment.center,
                        height: 67.sp,
                        width: 300.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                          border: Border.all(
                            width: 3.sp,
                            color: mode == ThemeMode.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                        child: Text(
                          Strings.addVacancy,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color:
                            mode == ThemeMode.dark ? Colors.white : Colors.black,
                          ),
                        ),
                      ),
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
