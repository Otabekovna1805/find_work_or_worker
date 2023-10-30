import 'dart:async';

import 'package:find_work_or_worker/constants/strings.dart';
import 'package:find_work_or_worker/pages/home_page.dart';
import 'package:find_work_or_worker/service/network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
  final TextEditingController jobTypeController = TextEditingController();
  final TextEditingController salaryController = TextEditingController();
  final TextEditingController overviewController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController offerController = TextEditingController();
  final TextEditingController skillsController = TextEditingController();

  Future<void> createVacancy() async {
    Map<String, Object?> data = {
      "title": titleController.text.trim(),
      "company": companyController.text.trim(),
      "experience": experienceController.text.trim(),
      "level": levelController.text.trim(),
      "salary": jobTypeController.text.trim(),
      "overview": salaryController.text.trim(),
      "description": overviewController.text.trim(),
      "offer": descriptionController.text.trim(),
      "skills": offerController.text.trim(),
    };
    await Network.methodPost(api: Network.apiVacancyCreate, data: data);

    if(companyController.text.isEmpty || titleController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text(Strings.please)));
    } else if(mounted) {
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => const HomePage()));
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
                        title: Strings.title, controller: titleController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        title: Strings.skills, controller: companyController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        title: Strings.skills, controller: companyController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        title: Strings.skills, controller: companyController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        title: Strings.skills, controller: companyController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        title: Strings.skills, controller: companyController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        title: Strings.skills, controller: companyController),
                    const SizedBox(
                      height: 10,
                    ),
                    CustomTextField(
                        title: Strings.skills, controller: companyController),
                    const SizedBox(
                      height: 10,
                    ),
                    // CustomTextField(title: Strings.forContact, controller: contactController),
                    // const SizedBox(height: 10,),
                    // CustomTextField(title: Strings.chargeFullName, controller: chargeFullNameController),
                    // const SizedBox(height: 10,),
                    // CustomTextField(title: Strings.timeToApply, controller: timeToApplyController),
                    // const SizedBox(height: 10,),
                    // CustomTextField(title: Strings.area, controller: areaController),
                    // const SizedBox(height: 10,),
                    // CustomTextField(title: Strings.howSalary, controller: salaryController),
                    // const SizedBox(height: 10,),
                    // CustomTextField(title: Strings.addition, controller: additionController),
                    // const SizedBox(height: 10,),
                    // CustomTextField(title: Strings.purpose, controller: purposeController),

                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => createVacancy(),
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        alignment: Alignment.center,
                        height: 67.sp,
                        width: 320.sp,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                          border: Border.all(width: 3.sp, color: Colors.black),
                        ),
                        child: Text(
                          Strings.publishResume,
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
