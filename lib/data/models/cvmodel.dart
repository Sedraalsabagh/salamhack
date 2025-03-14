class CVModel {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String summary;
  final List<Skill> skills;
  final List<Education> education;
  final List<Project> projects;

  CVModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.summary,
    required this.skills,
    required this.education,
    required this.projects,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "address": address,
        "summary": summary,
        "skills": skills.map((s) => s.toJson()).toList(),
        "education": education.map((e) => e.toJson()).toList(),
        "projects": projects.map((p) => p.toJson()).toList(),
      };

  factory CVModel.fromJson(Map<String, dynamic> json) {
    return CVModel(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      address: json["address"],
      summary: json["summary"],
      skills:
          (json["skills"] as List?)?.map((s) => Skill.fromJson(s)).toList() ??
              [],
      education: (json["education"] as List?)
              ?.map((e) => Education.fromJson(e))
              .toList() ??
          [],
      projects: (json["projects"] as List?)
              ?.map((p) => Project.fromJson(p))
              .toList() ??
          [],
    );
  }
}

class Project {
  final String title;
  final String description;
  final String link;

  Project({
    required this.title,
    required this.description,
    required this.link,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "link": link,
      };

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json["title"],
      description: json["description"],
      link: json["link"],
    );
  }
}

class Education {
  final String degree;
  final String institution;
  final String description;
  final String startDate;
  final String endDate;

  Education({
    required this.degree,
    required this.institution,
    required this.description,
    required this.startDate,
    required this.endDate,
  });

  Map<String, dynamic> toJson() => {
        "degree": degree,
        "institution": institution,
        "description": description,
        "startDate": startDate,
        "endDate": endDate,
      };

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      degree: json["degree"],
      institution: json["institution"],
      description: json["description"],
      startDate: json["startDate"],
      endDate: json["endDate"],
    );
  }
}

class Skill {
  final String skillName;
  final String proficiencyLevel;

  Skill({
    required this.skillName,
    required this.proficiencyLevel,
  });

  Map<String, dynamic> toJson() => {
        "skillName": skillName,
        "proficiencyLevel": proficiencyLevel,
      };

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      skillName: json["skillName"],
      proficiencyLevel: json["proficiencyLevel"],
    );
  }
}
