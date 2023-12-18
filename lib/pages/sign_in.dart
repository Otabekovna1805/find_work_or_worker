import 'package:find_work_or_worker/constants/images.dart';
import 'package:find_work_or_worker/constants/strings.dart';
import 'package:find_work_or_worker/pages/sign_up.dart';
import 'package:find_work_or_worker/pages/verification_page.dart';
import 'package:find_work_or_worker/service/registration_network_service.dart';
import 'package:find_work_or_worker/views/container.dart';
import 'package:find_work_or_worker/views/textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: ListView(
            children: [
              SizedBox(child: Lottie.asset(Images.lottieSignIn)),
              CustomTextField(
                  controller: emailController, title: Strings.email, desc: Strings.email,),
              SizedBox(
                height: 20.h,
              ),
              TextFieldForPassword(controller: passwordController, text: Strings.password, text2: Strings.password,),
              SizedBox(
                height: 20.h,
              ),
              InkWell(
                onTap: () => createUser(),
                borderRadius: BorderRadius.circular(20),
                child: CustomContainer(width: 315.sp, text: Strings.signIn, height: 67.sp),
              ),
              SizedBox(
                height: 20.h,
              ),
               Padding(
                 padding:  EdgeInsets.only(left: 70.sp),
                 child: Row(
                  children: [
                    const Text(
                      Strings.dontHaveAnAccount,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignUpPage()));
                      },
                      child: const Text(
                        Strings.signUp,
                        style: TextStyle(color: Colors.lightBlueAccent),
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

  Future<void> createUser() async {
    final Map<String,Object?> data ={
      "email" : emailController.text.trim().toString(),
      "password" : passwordController.text.trim().toString(),
    };
    final response = await RegistrationNetworkService.signInPost(api: RegistrationNetworkService.apiUserSignIn, data: data);
    if(response) {
      print(response);
      sendVerification(emailController.text.trim().toString());
      Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationPage(email: emailController.text.trim().toString(),)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please check your fields!")));
    }
  }

  Future<void> sendVerification(String email) async {
    await RegistrationNetworkService.sendVerification(api: RegistrationNetworkService.apiSendVerification, email: email);
  }
}
