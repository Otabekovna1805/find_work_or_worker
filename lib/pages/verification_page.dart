import 'package:find_work_or_worker/core/service_locator.dart';
import 'package:find_work_or_worker/pages/home_page.dart';
import 'package:find_work_or_worker/views/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';

import '../service/registration_network_service.dart';

class VerificationPage extends StatefulWidget {
  final String email;
  const VerificationPage({super.key, required this.email});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool _onEditing = true;
  final codeController = TextEditingController();

  Future<void> verification() async {
    final response = await RegistrationNetworkService.checkVerification(api: RegistrationNetworkService.apiCheckVerification, email: widget.email, code: codeController.text.toString());
    debugPrint(response.toString());
    if(response) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something error!")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        child: Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 100.sp),
            child: Center(
              child: Text(
                'Verification',
                style:
                    TextStyle(fontSize: 20.0.sp, fontWeight: FontWeight.w700),
              ),
            ),
          ),
          VerificationCode(
            fullBorder: true,
            textStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                // color: Colors.black,
                fontSize: 16.sp,
                fontWeight: FontWeight.w600),
            keyboardType: TextInputType.number,
            underlineColor: mode.value == ThemeMode.light ? Colors.black : Colors.white,
            // If this is null it will use primaryColor: Colors.red from Theme
            length: 4,
            itemSize: 50,
            cursorColor: Colors.blue,
            clearAll: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'clear all',
                style: TextStyle(
                    fontSize: 14.0,
                    // decoration: TextDecoration.underline,
                    color: Colors.blue[700]),
              ),
            ),
            margin: const EdgeInsets.all(12),
            onCompleted: (String value) {
              setState(() {
                codeController.text = value;
              });
            },
            onEditing: (bool value) {
              setState(() {
                _onEditing = value;
              });
              if (!_onEditing) FocusScope.of(context).unfocus();
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: _onEditing
                  ? const Text('Please enter full code')
                  : Text('Your code: ${codeController.text.trim()}'),
            ),
          ),
          SizedBox(
            height: 10.sp,
          ),
          InkWell(
            radius: 15,
            onTap: () => verification(),
            child: CustomContainer(
              width: 300.sp,
              text: 'Continue',
              height: 60.sp,
            ),
          )
        ],
      ),
    ));
  }
}
