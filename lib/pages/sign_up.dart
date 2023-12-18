import 'package:find_work_or_worker/constants/images.dart';
import 'package:find_work_or_worker/constants/strings.dart';
import 'package:find_work_or_worker/pages/sign_in.dart';
import 'package:find_work_or_worker/service/registration_network_service.dart';
import 'package:find_work_or_worker/views/container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../views/textfield.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  final lastnameController = TextEditingController();
  final firstnameController = TextEditingController();
  final phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.sp),
            child: Column(
              children: [
                Container(child: Lottie.asset(Images.signUp)),
                CustomTextField(controller: firstnameController, title: Strings.firstName, desc: Strings.firstName,),
                SizedBox(
                  height: 20.sp,
                ),
                CustomTextField(controller: lastnameController, title: Strings.lastName, desc: Strings.lastName,),
                SizedBox(
                  height: 20.sp,
                ),
                CustomTextField(controller: emailController, title: Strings.email, desc: Strings.email,),
                SizedBox(
                  height: 20.sp,
                ),
                TextFieldForPassword(controller: passwordController, text2: Strings.password, text: Strings.password,),
                SizedBox(
                  height: 20.sp,
                ),
                TextFieldForPassword(controller: confirmController, text: Strings.confirmPassword, text2: Strings.confirmPassword,),
                SizedBox(
                  height: 20.sp,
                ),
                InkWell(
                  onTap: () => createUser(),
                  borderRadius: BorderRadius.circular(20),
                  child: CustomContainer(width: 315.sp, text: Strings.signUp, height: 67.sp)
                ),
                SizedBox(
                  height: 20.sp,
                ),
                 Padding(
                   padding:  EdgeInsets.only(left: 70.sp),
                   child: Row(
                    children: [
                           Text(
                            Strings.haveYouAccount,
                            style: TextStyle(fontSize: 16.sp),
                            ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage()));
                            },
                            child: Text(
                              Strings.signIn,
                              style: TextStyle(color: Colors.lightBlueAccent, fontSize: 16.sp),
                            ),
                          ),
                    ],
                ),
                 )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> createUser() async {
    final Map<String,Object?> data ={
      "email" : emailController.text.trim().toString(),
      "password" : passwordController.text.trim().toString(),
      "first_name" : firstnameController.text.trim().toString(),
      "last_name" : lastnameController.text.trim().toString(),
      "phone_number" : phoneNumberController.text.trim().toString(),
    };
    final response = await RegistrationNetworkService.signUpPost(api: RegistrationNetworkService.apiUserSignUp, data: data);
    if(response) {
      if(passwordController.text.trim().toString() == confirmController.text.trim().toString()) {
        Navigator.push(context, MaterialPageRoute(builder: (context) => const SignInPage()));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please correct password!")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please check your fields!")));
    }
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    lastnameController.dispose();
    firstnameController.dispose();
    phoneNumberController.dispose();    
    
    super.dispose();
  }
}


