import 'dart:convert';

import 'package:find_work_or_worker/data/save_token.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

sealed class RegistrationNetworkService {
  static const baseUrl = "jobhuntly.pythonanywhere.com";
  static const apiUserSignIn = "/users/auth/login/";
  static const apiUserSignUp = "/users/auth/register/";
  static const apiCheckVerification = "/users/email/check-verification/";
  static const apiSendVerification = "/users/send/verifycation-code/";

  static Future<bool> signUpPost({required String api, required Map<String, Object?> data}) async {
    try {
      Uri url = Uri.https(baseUrl, api);
      final response = await http.post(url, body: data,);
      print("-----${response.statusCode}----");
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body);
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
      Uri url = Uri.https(baseUrl,apiUserSignIn);
      final response = await http.post(url, body: data);
      print("R----------------${response.statusCode}-----------");
      if(response.statusCode == 200 || response.statusCode == 201) {
        final takeToken = jsonDecode(response.body);
        Store.setToken(takeToken["access"], takeToken["refresh"]);
        debugPrint(response.body);
        return true;
      }
    } catch(e) {
      debugPrint(e.toString());
    }
    return false;
  }

  static Future<bool> sendVerification({required String api, required String email}) async {
    try {
      Uri url = Uri.https(baseUrl, api);
      final response = await http.post(url, body: jsonEncode({"email" : email}), headers: {
        'Content-Type': 'application/json'
      });
      print("S----------------${response.statusCode}-----------");
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body);
        return true;
      }
    } catch(e) {
      throw Exception("Error: $e");
    }
    return false;
  }

  static Future<bool> checkVerification({required String api, required String email, required String code}) async {
    try {
      Uri url = Uri.https(baseUrl, api);
      final response = await http.post(url, body: jsonEncode({"email" : email, "code" : code}), headers: {
        'Content-Type': 'application/json'
      });
      print("S----------------${response.statusCode}-----------");
      if(response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.body);
        return true;
      }
    } catch(e) {
      throw Exception("Error: $e");
    }
    return false;
  }


}