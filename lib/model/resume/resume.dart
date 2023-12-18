import 'package:find_work_or_worker/model/resume/skills.dart';

import '../user/user_model.dart';
import 'education.dart';
import 'experience.dart';

class ResumeModel {
  final int? id;
  final String title;
  final String area;
  final String birthDate;
  final String gender;
  final User user;
  final List<Experience> experience;
  final List<Education> education;
  final List<Skills> skills;

  ResumeModel({
    this.id = 1,
    required this.title,
    required this.area,
    required this.gender,
    required this.birthDate,
    required this.user,
    required this.experience,
    required this.education,
    required this.skills,
  }
);

  factory ResumeModel.fromJson(Map<String, Object?> json) =>
      ResumeModel(
        id: json["id"] as int?,
        title: json["title"] as String,
        area: json["region"] as String,
        gender: json["gender"] as String,
        birthDate: json["birth_date"] as String,
        user: User.fromJson(json["user"] as Map<String, Object?>),
        experience: (json['experiences'] as List).map((item) => Experience.fromJson(item as Map<String, Object?>)).toList(),
        education: (json['education'] as List).map((item) => Education.fromJson(item as Map<String, Object?>)).toList(),
        skills: (json['skills'] as List).map((item) => Skills.fromJson(item as Map<String, Object?>)).toList(),
      );

  Map<String, Object?> toJson() =>
      {
        "id": id,
        "title": title,
        "region": area,
        "birth_date": birthDate,
        "user": user,
        "experience":experience,
        "education" : education,
        "skills": skills
      };
}




