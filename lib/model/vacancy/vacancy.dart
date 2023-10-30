class VacancyModel {
  final String company;
  final String title;
  final String description;
  final String experience;
  final String level;
  final String overview;
  final String salary;
  final String offer;
  final List<String> skills;

  VacancyModel({
    required this.company,
    required this.title,
    required this.description,
    required this.skills,
    required this.experience,
    required this.salary,
    required this.level,
    required this.offer,
    required this.overview,
  });

  factory VacancyModel.fromJson(Map<String, Object?> json) => VacancyModel(
        company: json["company"] as String,
        title: json["title"] as String,
        description: json["description"] as String,
        skills: json["skills"] as List<String>,
        experience: json["experience"] as String,
        salary: json["salary"] as String,
        level: json["level"] as String,
        offer: json["offer"] as String,
        overview: json["overview"] as String,
      );

  Map<String, Object?> toJson() => {
        "title": title,
        "company": company,
        "experience": experience,
        "level": level,
        "salary": salary,
        "overview": overview,
        "description": description,
        "offer": offer,
        "skills": skills,
      };
}
