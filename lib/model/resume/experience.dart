class Experience {
  final String company;
  final int startYear;
  final int endYear;
  final String workType;
  final String location;
  final String description;
  final int id;

  Experience({
    required this.company,
    required this.startYear,
    required this.endYear,
    required this.workType,
    required this.location,
    required this.description,
    required this.id,
  });

  factory Experience.fromJson(Map<String, Object?> json) => Experience(
    company: json["company"] as String,
    startYear: json["startYear"] as int,
    endYear: json["endYear"] as int,
    workType: json["workType"] as String,
    location: json["location"] as String,
    description: json["description"] as String,
    id: json["id"] as int,
  );
  Map<String, Object?> toJson() => {
    "company" : company,
    "start_year" : startYear,
    "end_year" : endYear,
    "work_type" : workType,
    "location" : location,
    "description" : description,
    "id" : id,
  };
}
