import 'package:find_work_or_worker/model/user/user_model.dart';

class VacancyModel {
  final int id;
  final String company;
  final String title;
  final String description;
  final String experience;
  final String level;
  final String salary;
  final String offer;
  final User user;
  final String? jobType;

  VacancyModel({
    this.id = 1,
    required this.company,
    required this.title,
    required this.description,
    required this.experience,
    required this.salary,
    required this.level,
    required this.offer,
    required this.jobType,
    required this.user
  });

  factory VacancyModel.fromJson(Map<String, Object?> json) => VacancyModel(
        company: json["company"] as String,
        title: json["title"] as String,
        description: json["description"] as String,
        experience: json["experience"] as String,
        salary: json["salary"] as String,
        level: json["level"] as String,
        offer: json["offer"] as String,
        jobType: json["job_type"] as String,
    user: User.fromJson(json["user"] as Map<String, Object?>),
  );

  Map<String, Object?> toJson() => {
        "title": title,
        "company": company,
        "experience": experience,
        "level": level,
        "salary": salary,
        "description": description,
        "offer": offer,
        "job_type": jobType,
      };
}
