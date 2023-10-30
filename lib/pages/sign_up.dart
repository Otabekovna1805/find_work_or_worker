
import 'package:find_work_or_worker/constants/images.dart';
import 'package:find_work_or_worker/constants/strings.dart';
import 'package:find_work_or_worker/pages/sign_in.dart';
import 'package:find_work_or_worker/service/registration_network_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import '../core/service_locator.dart';
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
  bool _visible1 = true;
  bool _visible2 = true;

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
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something error!")));
    }
  }
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
                CustomTextField(controller: firstnameController, title: Strings.firstName),
                SizedBox(
                  height: 20.sp,
                ),
                CustomTextField(controller: lastnameController, title: Strings.firstName),
                SizedBox(
                  height: 20.sp,
                ),
                CustomTextField(controller: emailController, title: Strings.email),
                SizedBox(
                  height: 20.sp,
                ),
                TextField(
                  obscureText: _visible1,
                  controller: passwordController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 17.sp, bottom: 17.sp, left: 12.sp, right: 20.sp),
                    suffix: GestureDetector(onTap: () => setState(() => _visible1 = !_visible1), child: Icon(_visible1 ? Icons.visibility_off : Icons.visibility)),
                    hintText: Strings.password,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                TextField(
                  obscureText: _visible2,
                  controller: confirmController,
                  textInputAction: TextInputAction.next,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(top: 17.sp, bottom: 17.sp, left: 12.sp, right: 20.sp),
                    suffix: GestureDetector(onTap: () => setState(() => _visible2 = !_visible2), child: Icon(_visible2 ? Icons.visibility_off : Icons.visibility)),
                    hintText: Strings.confirmPassword,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 3),
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.sp,
                ),
                CustomTextField(controller: phoneNumberController, title: Strings.phoneNumber),
                SizedBox(
                  height: 20.sp,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const SignInPage()));
                  },
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    alignment: Alignment.center,
                    height: 67.sp,
                    width: 315.sp,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                      border: Border.all(width: 3.sp, color: mode == ThemeMode.dark ? Colors.white.withOpacity(0.5) : Colors.black,),
                    ),
                    child: Text(Strings.signUp,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: mode == ThemeMode.dark ? Colors.white.withOpacity(0.5) : Colors.black,
                        )),
                  ),
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


