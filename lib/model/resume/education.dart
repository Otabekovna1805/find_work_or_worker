class Education {
  final String title;
  final String studentTo;
  final String studentFrom;
  final int id;

  Education({
    required this.title,
    required this.studentTo,
    required this.studentFrom,
    required this.id,
  });

  factory Education.fromJson(Map<String, Object?> json) => Education(
    title: json["title"] as String,
    studentTo: json["student_to"] as String,
    studentFrom: json["student_from"] as String,
    id: json["id"] as int,
  );
  Map<String, Object?> toJson() => {
    "title" : title,
    "student_to" : studentTo,
    "student_from" : studentFrom,
    "id" : id,
  };
}
