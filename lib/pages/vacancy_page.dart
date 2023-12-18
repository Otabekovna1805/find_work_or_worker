import 'dart:async';

import 'package:find_work_or_worker/constants/strings.dart';
import 'package:find_work_or_worker/pages/home_page.dart';
import 'package:find_work_or_worker/service/network_service.dart';
import 'package:find_work_or_worker/views/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:uuid/uuid.dart';
import '../views/textfield.dart';

class VacancyPage extends StatefulWidget {
  const VacancyPage({super.key});

  @override
  State<VacancyPage> createState() => _VacancyPageState();
}

class _VacancyPageState extends State<VacancyPage> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController companyController = TextEditingController();
  final TextEditingController experienceController = TextEditingController();
  final TextEditingController levelController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();
  final TextEditingController jobTypeController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController overviewController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController offerController = TextEditingController();

  final json = {
    "id": 8,
    "title": "string",
    "company": "string",
    "experience": "string",
    "level": "Internship",
    "job_type": "full time",
    "salary": "string",
    "description": "string",
    "offer": "string"
  };
  Future<void> createVacancy() async {
    Map<String, Object?> data = {
      "title": titleController.text.trim(),
      "company": companyController.text.trim(),
      "experience": experienceController.text.trim(),
      "level": levelController.text.trim(),
      "job_type": jobTypeController.text.trim(),
      "salary": salaryController.text.trim(),
      "description": descriptionController.text.trim(),
      "offer": offerController.text.trim(),
      "id" : const Uuid().v4().toString(),
    };
    final response = await Network.methodPost(api: Network.apiVacancyCreate, data: data);

    if (companyController.text.isEmpty ||
        titleController.text.isEmpty ||
        companyController.text.isEmpty ||
        experienceController.text.isEmpty ||
        levelController.text.isEmpty ||
        salaryController.text.isEmpty ||
        descriptionController.text.isEmpty ||
        offerController.text.isEmpty) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text(Strings.please)));
    } else if (response && mounted) {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const HomePage()));
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
                padding: const EdgeInsets.only(left: 20, top: 20),
                child: Image.asset(
                  "assets/image/add_vacancy.png",
                  height: 280,
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    CustomTextField(
                      desc: Strings.companyName,
                      controller: companyController,
                      title: Strings.exampleCompanyName,
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    CustomTextField(
                      desc: Strings.title,
                      controller: titleController,
                      title: Strings.exampleVacancyTitle,
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    CustomTextField(
                      desc: Strings.vacancyDesc,
                      controller: descriptionController,
                      title: Strings.exampleVacancyDesc,
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    CustomTextField(
                      desc: Strings.experience,
                      controller: experienceController,
                      title: Strings.exampleExperience,
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    CustomTextField(
                      desc: Strings.level,
                      controller: levelController,
                      title: Strings.exampleLevel,
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    CustomTextField(
                      desc: Strings.jobType,
                      controller: jobTypeController,
                      title: Strings.exampleJobType,
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    CustomTextField(
                      desc: Strings.howSalary,
                      controller: salaryController,
                      title: Strings.exampleHowSalary,
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                    CustomTextField(
                      desc: Strings.offer,
                      controller: offerController,
                      title: Strings.exampleOffer,
                    ),
                    SizedBox(
                      height: 20.sp,
                    ),
                     SizedBox(
                      height: 20.sp,
                    ),
                    InkWell(
                      onTap: () => createVacancy(),
                      borderRadius: BorderRadius.circular(15),
                      child: CustomContainer(
                          width: 320.sp,
                          text: Strings.publishVacancy,
                          height: 67.sp,
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
