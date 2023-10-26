import 'dart:math';

import 'package:find_work_or_worker/constants/strings.dart';
import 'package:find_work_or_worker/pages/home_page.dart';
import 'package:find_work_or_worker/service/network_service.dart';
import 'package:find_work_or_worker/views/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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


  Future<void> createResume() async {
    Map<String, Object?> data = {
      "title" : titleController.text.trim().toString(),
      "region" : areaController.text.trim().toString(),
      "birth_date" : birthDateController.text.trim().toString(),
      "gender" : genderController.text.trim().toString(),
    };
    await Network.methodPost(api: Network.apiResumeCreate, data: data);
  }

  Future<void> createEducation() async {
    Map<String, Object?> data = {
      "title" : educationTitleController.text.trim().toString(),
      "student_to" : studentToController.text.trim().toString(),
      "student_from" : birthDateController.text.trim().toString(),
      "employee" : Random.secure().nextInt(9),
    };
    await Network.methodPost(api: Network.apiResumeEducationCreate, data: data);
  }

  Future<void> createExperience() async {
    Map<String, Object?> data = {
      "company" : educationTitleController.text.trim().toString(),
      "start_year" : studentToController.text.trim().toString(),
      "end_year" : birthDateController.text.trim().toString(),
      "work_type" : workTypeController.text.trim().toString(),
      "location" : locationController.text.trim().toString(),
      "description" : descriptionController.text.trim().toString(),
      "employee" : Random.secure().nextInt(9),
    };
    await Network.methodPost(api: Network.apiResumeEducationCreate, data: data);
  }

  Future<void> create() async {
    await createResume();
    await createEducation();
    await createExperience();
    if(mounted) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
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
                    CustomTextField(title: Strings.title, controller: titleController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.area, controller: areaController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.birthDate, controller: birthDateController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.gender, controller: genderController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.skills, controller: skillsController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.eduTitle, controller: educationTitleController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.studentTo, controller: studentToController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.studentFrom, controller: studentFromController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.experienceCompanyName, controller: companyController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.experienceDesc, controller: descriptionController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.experienceStartYear, controller: startYearController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.experienceEndYear, controller: endYearController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.experienceWorkType, controller: workTypeController),
                    SizedBox(height: 10.sp),
                    CustomTextField(title: Strings.experienceLocation, controller: locationController),


                    SizedBox(height: 20.sp,),
                    InkWell(
                      onTap: () => create(),
                      borderRadius: BorderRadius.circular(15),
                      child: CustomContainer(width: 340.w, text: Strings.publishResume, height: 55.sp,)
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
