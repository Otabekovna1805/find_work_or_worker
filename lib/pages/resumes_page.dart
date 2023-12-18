import 'package:find_work_or_worker/constants/images.dart';
import 'package:find_work_or_worker/constants/strings.dart';
import 'package:find_work_or_worker/core/service_locator.dart';
import 'package:find_work_or_worker/model/resume/education.dart';
import 'package:find_work_or_worker/model/resume/experience.dart';
import 'package:find_work_or_worker/service/network_service.dart';
import 'package:find_work_or_worker/views/element.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../model/resume/resume.dart';

class ResumesPage extends StatefulWidget {
  const ResumesPage({super.key});

  @override
  State<ResumesPage> createState() => _ResumesPageState();
}

class _ResumesPageState extends State<ResumesPage> {
  bool _isVisible = true;
  bool _isLoading = false;
  List<ResumeModel> items = [];
  List<Experience> itemEx = [];
  List<Education> itemEdu = [];

  @override
  void initState() {
    super.initState();
    fetchResume();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView.builder(
            itemCount: items.length,
            itemBuilder: (context, i) {
              final item = items[i];
              final itemedu = item.education[i];
              final itemex = item.experience[i];
              return Container(
                margin: EdgeInsets.all(20.sp),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 20.sp, vertical: 10.sp),
                  child: Column(children: [
                    /// #text_resume
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            Strings.resume,
                            style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700,
                              fontFamily: "Saira",
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _isVisible = !_isVisible;
                                  setState(() {});
                                });
                              },
                              icon: Transform.rotate(
                                  angle: _isVisible ? 4.7 : 7.9,
                                  child: const Icon(
                                      Icons.arrow_back_ios_new))),
                        ],
                      ),
                    ),

                    /// #fullName
                    const CustomElement(image: Images.name, text: Strings.name, elementText: "Fotima",),

                    SizedBox(
                      height: 10.sp,
                    ),

                    /// #age
                    CustomElement(image: Images.age, text: Strings.age, elementText: item.birthDate,),

                    const SizedBox(
                      height: 10,
                    ),

                    /// #phoneNumber
                    const CustomElement(image: Images.phoneNumber, text: Strings.phone, elementText: "+998909599319",),

                    SizedBox(
                      height: 10.sp,
                    ),
                    // /// #technological
                    // CustomElement(image: Images.skills, text: Strings.tech, elementText: "${item.skills}" ?? "",),



                    /// #area
                    CustomElement(image: Images.area, text: Strings.areaa, elementText: item.area,),

                    const SizedBox(
                      height: 10,
                    ),
                    if (_isVisible)
                      Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 13.sp,
                          ),



                          /// #gender
                          CustomElement(image: Images.gender, text: Strings.genderr, elementText: item.gender,),

                          SizedBox(
                            height: 20.sp,
                          ),

                          /// #educationTitle
                          CustomElement(image: Images.education, text: Strings.education, elementText: itemedu.title.toString(),),


                          SizedBox(
                            height: 20.sp,
                          ),

                          /// #studentTo
                          CustomElement(image: Images.studentTo, text: Strings.studentToo, elementText: itemedu.studentTo.toString(),),

                          SizedBox(
                            height: 20.sp,
                          ),

                          /// #studentFrom
                          CustomElement(image: Images.studentFrom, text: Strings.studentFromm, elementText: itemedu.studentFrom.toString(),),


                          SizedBox(
                            height: 20.sp,
                          ),

                          /// #company
                          CustomElement(image: Images.company, text: Strings.company, elementText: itemex.company.toString(),),

                          SizedBox(
                            height: 20.sp,
                          ),

                          /// #description
                          CustomElement(image: Images.description, text: Strings.desc, elementText: itemex.description.toString(),),


                          SizedBox(
                            height: 20.sp,
                          ),

                          /// #startYear
                          CustomElement(image: Images.startYear, text: Strings.startYear, elementText: item.education[i].studentTo.toString(),),

                          SizedBox(
                            height: 20.sp,
                          ),

                          /// #endYear
                          CustomElement(image: Images.endYear, text: Strings.endYear, elementText: item.education[i].studentFrom.toString(),),

                          SizedBox(
                            height: 20.sp,
                          ),

                          /// #workType
                          CustomElement(image: Images.workType, text: Strings.workType, elementText: item.experience[i].workType.toString(),),

                          SizedBox(
                            height: 20.sp,
                          ),

                          /// #location
                          CustomElement(image: Images.location, text: Strings.location, elementText: item.experience[i].location.toString(),),

                          SizedBox(
                            height: 20.sp,
                          ),

                        ],
                      )
                  ]),
                ),
              );
            },
          ),
          if(_isLoading) Center(
            child: Lottie.asset(Images.loading),
          )
        ],
      ),
    );
  }

  void fetchResume() async {
    setState(() => _isLoading = true);
    final resumeData = await Network.methodGet(api: Network.apiResumeList);
    items = Network.parseResumeList(resumeData!);
    setState(() => _isLoading = false);
  }



}
