import 'dart:math';

import 'package:find_work_or_worker/constants/strings.dart';
import 'package:find_work_or_worker/pages/home_page.dart';
import 'package:find_work_or_worker/service/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';

import '../core/service_locator.dart';
import '../views/textfield.dart';

class ResumePage extends StatefulWidget {
  const ResumePage({super.key});

  @override
  State<ResumePage> createState() => _ResumePageState();
}

class _ResumePageState extends State<ResumePage> {
  /// #resume controllers
  final  titleController = TextEditingController();
  final  areaController = TextEditingController();
  final  birthDateController = TextEditingController();
  final  genderController = TextEditingController();

  /// #skills controllers
  final  skillsController = TextEditingController();

  /// #education controllers
  final  educationTitleController = TextEditingController();
  final  studentToController = TextEditingController();
  final  studentFromController = TextEditingController();

  /// #experience controllers
  final  companyController = TextEditingController();
  final  startYearController = TextEditingController();
  final  endYearController = TextEditingController();
  final  workTypeController = TextEditingController();
  final  locationController = TextEditingController();
  final  descriptionController = TextEditingController();

  Future<void> create() async {
    Map<String, Object?> data = {
      "company" : companyController.text.trim(),
      "start_year" : startYearController.text.trim(),
      "end_year" : endYearController.text.trim(),
      "work_type" : workTypeController.text.trim(),
      "location" : locationController.text.trim(),
      "description" : descriptionController.text.trim(),
    };
    Map<String, Object?> dataEx = {
      "title" : titleController.text.trim().toString(),
      "region" : areaController.text.trim().toString(),
      "birth_date" : birthDateController.text.trim().toString(),
      "gender" : genderController.text.trim().toString(),
    };
    Map<String, Object?> dataEdu = {
      "title" : educationTitleController.text.trim(),
      "student_to" : studentToController.text.trim(),
      "student_from" : studentFromController.text.trim(),
    };


    final responseResume = await Network.methodPost(api: Network.apiResumeCreate, data: dataEx);
    final responseEdu = await Network.methodPost(api: Network.apiResumeEducationCreate, data: dataEdu);
    final responseEx = await Network.methodPost(api: Network.apiResumeExperienceCreate, data: data);
    // final skills = await Network.methodPost(api: Network.apiResumeSkillsCreate, data: dataSkills, id: id);
    print(responseEx);
    print(responseEdu);
    print(responseResume);
    if(mounted && responseEx && responseEdu && responseResume) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please fill in correct")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40.w, top: 20.sp),
                child: Image.asset("assets/image/add_resume.png", height: 280.sp,),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.sp),
                child: Column(
                  children: [
                    CustomTextField(title: Strings.exampleTitle, controller: titleController, desc: Strings.title,),
                    SizedBox(height: 20.sp),
                    CustomTextField(title: Strings.exampleArea, controller: areaController, desc: Strings.area,),
                    SizedBox(height: 20.sp),
                    CustomTextField(title: Strings.exampleBirthDate, controller: birthDateController, desc: Strings.birthDate, isNum: true,),
                    SizedBox(height: 20.sp),
                    CustomTextField(title: Strings.exampleGender, controller: genderController, desc: Strings.gender,),
                    // SizedBox(height: 20.sp),
                    // CustomTextField(title: Strings.exampleSkills, controller: skillsController, desc: Strings.skills,),
                    SizedBox(height: 20.sp),
                    CustomTextField(title: Strings.exampleExperienceDesc, controller: educationTitleController, desc: Strings.eduTitle,),
                    SizedBox(height: 20.sp),
                    CustomTextField(title: Strings.exampleStudentTo, controller: studentToController, desc: Strings.studentTo, isNum: true,),
                    SizedBox(height: 20.sp),
                    CustomTextField(title: Strings.exampleStudentFrom, controller: studentFromController, desc: Strings.studentFrom, isNum: true,),
                    SizedBox(height: 20.sp),
                    CustomTextField(title: Strings.exampleExperienceCompanyName, controller: companyController, desc: Strings.experienceCompanyName,),
                    SizedBox(height: 20.sp),
                    CustomTextField(title: Strings.exampleExperienceDesc, controller: descriptionController, desc: Strings.experienceDesc,),
                    SizedBox(height: 20.sp),
                    CustomTextField(title: Strings.exampleExperienceStartYear, controller: startYearController, desc: Strings.experienceStartYear, isNum: true,),
                    SizedBox(height: 20.sp),
                    CustomTextField(title: Strings.exampleExperienceEndYear, controller: endYearController, desc: Strings.experienceEndYear, isNum: true,),
                    SizedBox(height: 20.sp),
                    CustomTextField(title: Strings.exampleExperienceWorkType, controller: workTypeController, desc: Strings.experienceWorkType,),
                    SizedBox(height: 20.sp),
                    CustomTextField(title: Strings.exampleExperienceLocation, controller: locationController, desc: Strings.experienceLocation,),


                    SizedBox(height: 20.sp,),
                    InkWell(
                      onTap: () => create(),
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        alignment: Alignment.center,
                        height: 67.sp,
                        width: 320.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                          border: Border.all(width: 3.sp,  color: mode.value == ThemeMode.light ? Colors.black : Colors.white),
                        ),
                        child: Text(
                          Strings.publishResume,
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w600,
                            color: mode.value == ThemeMode.light ? Colors.black : Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


