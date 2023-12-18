import 'dart:convert';
import 'package:find_work_or_worker/model/resume/resume.dart';
import 'package:find_work_or_worker/service/network_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Harry Potter API test", ()
  {

    /// All
    test("Test: getPost: api/sing up ", () async {
      Map<String, Object?> data = {
        "title": "string",
        "company": "string",
        "experience": "string",
        "level": "Internship",
        "job_type": "full time",
        "salary": "string",
        "overview": "string",
        "description": "string",
        "offer": "string"
      };
      final response = await Network.methodPost(
          api: Network.apiVacancyCreate, data: data);
      debugPrint("-----------${response.toString()}");

      expect(response, isNotNull);
    });
}
    );
  }
