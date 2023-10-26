class ResumeModel {
  final int? id;
  final String title;
  final String area;
  final String birthDate;
  final String gender;

  ResumeModel({
    this.id = 1,
    required this.title,
    required this.area,
    required this.gender,
    required this.birthDate
  });

  factory ResumeModel.fromJson(Map<String, Object?> json) =>
      ResumeModel(
        id: json["id"] as int?,
        title: json["title"] as String,
        area: json["region"] as String,
        gender: json["gender"] as String,
        birthDate: json["birth_date"] as String
      );

  Map<String, Object?> toJson() =>
      {
        "id": id,
        "title": title,
        "region": area,
        "birth_date": birthDate,
      };
}




