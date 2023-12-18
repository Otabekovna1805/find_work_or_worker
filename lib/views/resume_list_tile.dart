// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import '../constants/images.dart';
// import '../constants/strings.dart';
// import '../core/service_locator.dart';
// import '../model/resume/resume.dart';
// import '../service/network_service.dart';
// import 'book_mark.dart';
// import 'custom_row.dart';
// import 'element.dart';
//
// class CustomResumeListTile extends StatefulWidget {
//   const CustomResumeListTile({super.key});
//
//   @override
//   State<CustomResumeListTile> createState() => _CustomResumeListTileState();
// }
//
// class _CustomResumeListTileState extends State<CustomResumeListTile> {
//   final bool _isVisible = true;
//   List<ResumeModel> items = [];
//   bool isLoading = true;
//
//   @override
//   void initState() {
//     super.initState();
//     fetchResume();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       itemCount: items.length,
//       itemBuilder: (context, i) {
//         final item = items[i];
//         return Container(
//           margin: EdgeInsets.all(20.sp),
//           decoration: BoxDecoration(
//             border: Border.all(color: Colors.grey),
//           ),
//           child: Padding(
//             padding: EdgeInsets.symmetric(
//                 horizontal: 20.sp, vertical: 10.sp),
//             child: Column(children: [
//               /// #text_resume
//               const CustomRow(text: Strings.resume),
//
//               /// #fullName
//               CustomElement(image: Images.name, text: Strings.name, elementText: userRepository.readLastName().toString(),),
//
//
//               SizedBox(
//                 height: 10.sp,
//               ),
//
//               /// #age
//               CustomElement(image: Images.age, text: Strings.age, elementText: item.birthDate,),
//
//
//               const SizedBox(
//                 height: 10,
//               ),
//
//               /// #technological
//               CustomElement(image: Images.skills, text: Strings.tech, elementText: item.skills.toString(),),
//
//
//               if (_isVisible)
//                 Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(
//                       height: 13.sp,
//                     ),
//
//                     /// #phoneNumber
//                     CustomElement(image: Images.phoneNumber, text: Strings.phone, elementText: item.user.phoneNumber.toString(),),
//
//
//                     SizedBox(
//                       height: 10.sp,
//                     ),
//
//                     /// #area
//                     CustomElement(image: Images.area, text: Strings.areaa, elementText: item.area,),
//
//
//                     const SizedBox(
//                       height: 10,
//                     ),
//
//                     /// #gender
//                     CustomElement(image: Images.gender, text: Strings.genderr, elementText: item.gender,),
//
//
//                     SizedBox(
//                       height: 20.sp,
//                     ),
//
//                     /// #educationTitle
//                     CustomElement(image: Images.education, text: Strings.education, elementText: item.education.title!,),
//
//
//                     SizedBox(
//                       height: 20.sp,
//                     ),
//
//                     /// #studentTo
//                     CustomElement(image: Images.studentTo, text: Strings.studentTo, elementText: item.education.studentTo!,),
//
//                     SizedBox(
//                       height: 20.sp,
//                     ),
//
//                     /// #studentFrom
//                     CustomElement(image: Images.studentFrom, text: Strings.studentFromm, elementText: item.education.studentFrom!,),
//
//
//                     SizedBox(
//                       height: 20.sp,
//                     ),
//
//                     /// #company
//                     CustomElement(image: Images.company, text: Strings.company, elementText: item.experience.company!,),
//
//                     SizedBox(
//                       height: 20.sp,
//                     ),
//
//                     /// #description
//                     CustomElement(image: Images.description, text: Images.description, elementText: item.experience.description!,),
//
//
//                     SizedBox(
//                       height: 20.sp,
//                     ),
//
//                     /// #startYear
//                     CustomElement(image: Images.startYear, text: Strings.startYear, elementText: item.experience.startYear.toString(),),
//
//                     SizedBox(
//                       height: 20.sp,
//                     ),
//
//                     /// #endYear
//                     CustomElement(image: Images.endYear, text: Strings.endYear, elementText: item.experience.endYear.toString(),),
//
//                     SizedBox(
//                       height: 20.sp,
//                     ),
//
//                     /// #workType
//                     CustomElement(image: Images.workType, text: Strings.workType, elementText: item.experience.workType!,),
//
//                     SizedBox(
//                       height: 20.sp,
//                     ),
//
//                     /// #location
//                     CustomElement(image: Images.location, text: Strings.location, elementText: item.experience.location!,),
//
//                     SizedBox(
//                       height: 20.sp,
//                     ),
//
//                     const CustomBookMark()
//                   ],
//                 )
//             ]),
//           ),
//         );
//       },
//     );
//   }
//
//   void fetchResume() async {
//     setState(() => isLoading = true);
//     final resumeData = await Network.methodGet(api: Network.apiResumeList);
//     items = Network.parseResumeList(resumeData!);
//     setState(() => isLoading = false);
//   }
// }
