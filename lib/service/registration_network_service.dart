import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:find_work_or_worker/core/service_locator.dart';
import 'package:find_work_or_worker/data/save_token.dart';
 import 'package:flutter/foundation.dart';

sealed class RegistrationNetworkService {
  static const baseUrl = "https://jobhuntly.pythonanywhere.com";
  static const apiUserSignIn = "/users/auth/login/";
  static const apiUserSignUp = "/users/auth/register/";
  static const apiAuthProfile = "/users/auth/profile/";
  static const apiCheckVerification = "/users/email/check-verification/";
  static const apiSendVerification = "/users/send/verifycation-code/";

  static  Dio http = Dio(
      BaseOptions(
          baseUrl: baseUrl,
        contentType: "Application/json"
      )
  );
  
  static Future<bool> signUpPost({required String api, required Map<String, Object?> data}) async {
    try {
      final response = await http.post(api, data: jsonEncode(data));
      print("-----${response.statusCode}----");
      if(response.statusCode == 200 || response.statusCode == 201) {
        await userRepository.saveUserEmail("${data["email"]}");
        await userRepository.saveUserLastName("${data["first_name"]}");
        await userRepository.saveUserPhone("${data["phone_number"]}");
        debugPrint("${response.data}");
        return true;
      } else {
        return false;
      }
    } catch(e) {
      debugPrint(e.toString());
    }
    return false;
  }


  static Future<bool> signInPost({required String api, required Map<String, Object?> data}) async {
    try {
      final response = await http.post(api, data: jsonEncode(data));
      print("R----------------${response.data["tokens"].runtimeType}-----------");
      if(response.statusCode == 200 || response.statusCode == 201) {
        final takeToken = response.data as Map<String, dynamic>;
        Store.setToken(takeToken["tokens"]["access"].toString(), takeToken["tokens"]["refresh"].toString());
        await userRepository.saveUserEmail("${data["email"]}");
        debugPrint(response.data.toString());
        return true;
      }
    } catch(e) {
      debugPrint(e.toString());
    }
    return false;
  }

  static Future<bool> sendVerification({required String api, required String email}) async {
    try {
      
      final response = await http.post(api, data: jsonEncode({"email" : email}));
      print("S----------------${response.statusCode}-----------");
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("${response.data}");
        return true;
      }
    } catch(e) {
      throw Exception("Error: $e");
    }
    return false;
  }

  static Future<bool> checkVerification({required String api, required String email, required String code}) async {
    try {
      final response = await http.post(api, data:jsonEncode({"email" : email, "code" : code}));
      print("S----------------${response.statusCode}-----------");
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("${response.data}");
        return true;
      }
    } catch(e) {
      debugPrint(e.toString());
    }
    return false;
  }

  static Future<void> getUser({required String api}) async {
    try {
      final response = await http.get(api);
      print("S----------------${response.statusCode}-----------");
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("${response.data}");
       }
    } catch(e) {
      throw Exception("Error: $e");
    }
  }


}