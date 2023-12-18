// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class CustomRow extends StatefulWidget {
//   final String text;
//   const CustomRow({super.key, required this.text});
//
//   @override
//   State<CustomRow> createState() => _CustomRowState();
// }
//
// class _CustomRowState extends State<CustomRow> {
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: EdgeInsets.only(bottom: 20.sp),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             widget.text,
//             style: TextStyle(
//               fontSize: 20.sp,
//               fontWeight: FontWeight.w700,
//               fontFamily: "Saira",
//             ),
//           ),
//           IconButton(
//               onPressed: () {
//                 setState(() {
//                   _isVisible = !_isVisible;
//                   setState(() {});
//                 });
//               },
//               icon: Transform.rotate(
//                   angle: _isVisible ? 4.7 : 7.9,
//                   child: const Icon(
//                       Icons.arrow_back_ios_new))),
//         ],
//       ),
//     );
//   }
// }
