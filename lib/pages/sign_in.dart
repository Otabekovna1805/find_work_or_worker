import 'package:find_work_or_worker/constants/images.dart';
import 'package:find_work_or_worker/constants/strings.dart';
import 'package:find_work_or_worker/core/service_locator.dart';
import 'package:find_work_or_worker/pages/sign_up.dart';
import 'package:find_work_or_worker/pages/verification_page.dart';
import 'package:find_work_or_worker/service/registration_network_service.dart';
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
  bool _visible = true;

  Future<void> createUser() async {
    final Map<String,Object?> data ={
      "email" : emailController.text.trim().toString(),
      "password" : passwordController.text.trim().toString(),
    };
    final response = await RegistrationNetworkService.signInPost(api: RegistrationNetworkService.apiUserSignIn, data: data);
    if(response) {
      sendVerification(emailController.text.trim().toString());
      // ignore: use_build_context_synchronously
      Navigator.push(context, MaterialPageRoute(builder: (context) => VerificationPage(email: emailController.text.trim().toString(),)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Something error!")));
    }
  }

  Future<void> sendVerification(String email) async {
    await RegistrationNetworkService.sendVerification(api: RegistrationNetworkService.apiSendVerification, email: email);
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          child: Column(
            children: [
              SizedBox(child: Lottie.asset(Images.lottieSignIn)),
              CustomTextField(
                  controller: emailController, title: Strings.email),
              SizedBox(
                height: 20.h,
              ),
              TextField(
                obscureText: _visible,
                controller: passwordController,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(top: 17.sp, bottom: 17.sp, left: 12.sp, right: 20.sp),
                  suffix: GestureDetector(onTap: () => setState(() => _visible = !_visible), child: Icon(_visible ? Icons.visibility_off : Icons.visibility)),
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
                height: 20.h,
              ),
              InkWell(
                onTap: () => createUser(),
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  alignment: Alignment.center,
                  height: 67.sp,
                  width: 315.sp,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15.sp)),
                    border: Border.all(width: 3.sp, color: mode == ThemeMode.dark ? Colors.white.withOpacity(0.5) : Colors.black),
                  ),
                  child: Text(Strings.signIn,
                      style: TextStyle(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                          color: mode == ThemeMode.dark ? Colors.white.withOpacity(0.5) : Colors.black
                      )),
                ),
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

  // void buttonLogin() async {
  //   List<Map<String, Object?>> response = auth.getData;
  //   List<User> users = response.map((e) => User.fromJson(e)).toList();
  //   List<User> haveUser = users.where((user) {
  //     return user.email == emailController.text.trim() &&
  //         user.password == passwordController.text.trim();
  //   }).toList();
  //
  //   if (haveUser.isEmpty) {
  //     ScaffoldMessenger.of(context)
  //         .showSnackBar(const SnackBar(content: Text("User Not Found")));
  //   } else {
  //     await auth.saveUser(haveUser[0]);
  //     if (context.mounted) {
  //       Navigator.pushReplacement(
  //         context,
  //         MaterialPageRoute(
  //           builder: (context) => const VerificationPage(),
  //         ),
  //       );
  //     }
  //   }
  // }
}
