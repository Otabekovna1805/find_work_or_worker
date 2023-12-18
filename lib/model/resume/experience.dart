class Experience {
  final String? company;
  final String? startYear;
  final String? endYear;
  final String? workType;
  final String? location;
  final String? description;
  final int? id;

  Experience({
    required this.company,
    required this.startYear,
    required this.endYear,
    required this.workType,
    required this.location,
    required this.description,
     this.id = 1,
  });

  factory Experience.fromJson(Map<String, Object?> json) => Experience(
    company: json["company"] as String?,
    startYear: json["start_year"] as String?,
    endYear: json["end_year"] as String?,
    workType: json["work_type"] as String?,
    location: json["location"] as String?,
    description: json["description"] as String?,
    id: json["id"] as int?,
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
