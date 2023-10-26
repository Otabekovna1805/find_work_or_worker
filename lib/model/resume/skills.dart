class Skills {
  final String skills;

  Skills({required this.skills});

  factory Skills.fromJson(Map<String, Object?> json) => Skills(
        skills: json["name"] as String,
      );
  Map<String, Object?> toJson() => {
    "name" : skills
  };
}
