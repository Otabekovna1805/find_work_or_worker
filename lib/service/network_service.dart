import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:find_work_or_worker/data/save_token.dart';
import 'package:find_work_or_worker/model/resume/resume.dart';
import 'package:find_work_or_worker/model/vacancy/vacancy.dart';
import 'package:flutter/foundation.dart';

sealed class Network {
  static const baseUrl = "https://jobhuntly.pythonanywhere.com";

  static const apiProfile = "/users/auth/profile/";

  static const apiVacancyCreate = "/vacancy/create";
  static const apiVacancyList = "/vacancy/list";
  static const apiResumeCreate = "/resume/create";
  static const apiResumeSkillsCreate = "/resume/skills/create";
  static const apiResumeEducationCreate = "/resume/educations/create";
  static const apiResumeExperienceCreate = "/resume/experience/create";
  static const apiResumeList = "/resume/list";

  static  Dio http = Dio(
      BaseOptions(
          baseUrl: baseUrl,
          headers: {
            "access" : Store.accessToken(),
          }
      )
  );

  static Future<String?> methodGet(
      {required String api, Object? id, String baseUrl = baseUrl}) async {
    try {
      final response = await http.get(
        "$api${id != null ? "/$id" : ""}",
      );

      if (response.statusCode == 200) {
        return jsonEncode(response.data);
      }
    } catch (e) {
      return null;
    }
    return null;
  }

  static Future<void> methodDelete(
      {required String api,
      required Object id,
      String baseUrl = baseUrl}) async {
    try {
      final response = await http.delete("$api/$id");
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200) {
        debugPrint(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<bool> methodPost(
      {required String api,
      String baseUrl = baseUrl,
      required Map<String, Object?> data}) async {
    try {
      final response = await http.post(api, data: jsonEncode(data));
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.data);
        return true;
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    return false;
  }

  static Future<void> methodPut(
      {required String api,
      required Object id,
      String baseUrl = baseUrl,
      required Map<String, Object?> data}) async {
    try {
      final response = await http.put("$api/$id", data: jsonEncode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint(response.data);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static List<ResumeModel> parseResumeList(String data) {
    final json = jsonDecode(data) as List;

    /// String => json(Map, List, ...)
    return json.map((item) => ResumeModel.fromJson(item)).toList();

    /// json => object
  }

  static List<VacancyModel> parseVacancyList(String data) {
    final json = jsonDecode(data) as List;

    /// String => json(Map, List, ...)
    return json.map((item) => VacancyModel.fromJson(item)).toList();

    /// json => object
  }

  static ResumeModel parseResume(String data) {
    final json = jsonDecode(data);
    final resume = ResumeModel.fromJson(json);
    return resume;
  }

  static VacancyModel parseVacancy(String data) {
    final json = jsonDecode(data);
    final vacancy = VacancyModel.fromJson(json);
    return vacancy;
  }
}
