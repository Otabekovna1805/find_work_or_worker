import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:find_work_or_worker/data/save_token.dart';
import 'package:find_work_or_worker/model/resume/education.dart';
import 'package:find_work_or_worker/model/resume/experience.dart';
import 'package:find_work_or_worker/model/resume/resume.dart';
import 'package:find_work_or_worker/model/resume/skills.dart';
import 'package:find_work_or_worker/model/vacancy/vacancy.dart';
import 'package:flutter/foundation.dart';

sealed class Network {
  static const baseUrl = "https://jobhuntly.pythonanywhere.com";
  static const apiProfile = "/users/auth/profile/";
  static const apiVacancyCreate = "/vacancy/create";
  static const apiVacancyList = "/vacancy/list";
  static const apiVacancyRemove = "/vacancy/";
  static const apiResumeCreate = "/resume/create";
  static const apiResumeSkillsCreate = "/resume/skills/create";
  static const apiResumeEducationCreate = "/resume/educations/create";
  static const apiResumeExperienceCreate = "/resume/experience/create";
  static const apiResumeList = "/resume/list";
  static const apiResumeDelete = "/resume/";

  static  Dio http = Dio(
      BaseOptions(
          baseUrl: baseUrl,
      )
  );
  
  static Future<void> settingToken() async {
    final String? tokenAccess = await Store.accessToken();
    print(tokenAccess);
    http.options.headers = {
      //"access" : tokenAccess,
      "Authorization" : "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzAxNjAwODA5LCJpYXQiOjE2OTkwMDg4MDksImp0aSI6Ijk0ZDJlYTJlY2ViNDRmMzZiNTU2NTAxNDRlOWI3OGIxIiwidXNlcl9pZCI6MTl9.D2813MGCWQvqgQnwJwmmcgl0mCr_puiRlzcCc82anWo",
    };
  }

  static Future<String?> methodGet({required String api, Object? id}) async {
    try {
      await settingToken();
      final response = await http.get(
        "$api${id != null ? "/$id" : ""}",
      );

      if (response.statusCode == 200) {
        return jsonEncode(response.data);
      }
    } catch (e, s) {
      print(e);
      print(s);
      return null;
    }
    return null;
  }

  static Future<void> methodDelete(
      {required String api,
      required Object id,
      String baseUrl = baseUrl}) async {
    try {
      await settingToken();
      final response = await http.delete("$api/$id");
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 204) {
        debugPrint("${response.data}");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future<bool> methodPost({required String api,
      String baseUrl = baseUrl, Object? id,
      required Map<String, Object?> data}) async {
    try {
      await settingToken();
      final response = await http.post(api, data: data);
      debugPrint(response.statusCode.toString());
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("${response.data}");
        return true;
      }
    } catch (e,s) {
      debugPrint(e.toString());
      debugPrint(s.toString());
    }
    return false;
  }

  static Future<void> methodPut(
      {required String api,
      required Object id,
      String baseUrl = baseUrl,
      required Map<String, Object?> data}) async {
    try {
      await settingToken();
      final response = await http.put("$api/$id", data: jsonEncode(data));
      if (response.statusCode == 200 || response.statusCode == 201) {
        debugPrint("${response.data}");
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static List<ResumeModel> parseResumeList(String data) {
    final json = jsonDecode(data) as List;
    return json.map((item) => ResumeModel.fromJson(item as Map<String, Object?>)).toList();
  }
  static List<Education> parseEducationList(String data) {
    final json = jsonDecode(data) as List;
    return json.map((item) => Education.fromJson(item as Map<String, Object?>)).toList();
  }
  static List<Experience> parseExperienceList(String data) {
    final json = jsonDecode(data) as List;
    return json.map((item) => Experience.fromJson(item as Map<String, Object?>)).toList();
  }

  static List<Skills> parseSkillsList(String data) {
    final json = jsonDecode(data) as List;
    return json.map((item) => Skills.fromJson(item as Map<String, Object?>)).toList();
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

  static Experience parseExperience(String data) {
    final json = jsonDecode(data);
    final resume = Experience.fromJson(json);
    return resume;
  }

  static Education parseEducation(String data) {
    final json = jsonDecode(data);
    final resume = Education.fromJson(json);
    return resume;
  }

  static Skills parseSkills(String data) {
    final json = jsonDecode(data);
    final resume = Skills.fromJson(json);
    return resume;
  }

  static VacancyModel parseVacancy(String data) {
    final json = jsonDecode(data);
    final vacancy = VacancyModel.fromJson(json);
    return vacancy;
  }
}
