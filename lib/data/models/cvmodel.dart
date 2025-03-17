class CVModel {
  final String? name;
  final String? email;
  final String? phone;
  final String? location;

  final String? githubLink;
  final String? linkedinLink;
  final List<Skill>? skills;
  final List<Education>? education;
  final List<Project>? projects;
  final List<Experience>? experiences;
  final List<TrainingCourse>? trainingsCourses;

  CVModel({
    this.name,
    this.email,
    this.phone,
    this.location,
    this.githubLink,
    this.linkedinLink,
    this.skills,
    this.education,
    this.projects,
    this.experiences,
    this.trainingsCourses,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "email": email,
        "phone": phone,
        "location": location,
        "github_link": githubLink,
        "linkedin_link": linkedinLink,
        "skills": skills?.map((s) => s.toJson()).toList(),
        "education": education?.map((e) => e.toJson()).toList(),
        "projects": projects?.map((p) => p.toJson()).toList(),
        "experiences": experiences?.map((e) => e.toJson()).toList(),
        "trainings_courses": trainingsCourses?.map((t) => t.toJson()).toList(),
      };

  factory CVModel.fromJson(Map<String, dynamic> json) {
    return CVModel(
      name: json["name"],
      email: json["email"],
      phone: json["phone"],
      location: json["location"],
      githubLink: json["github_link"],
      linkedinLink: json["linkedin_link"],
      skills: (json["skills"] as List?)?.map((s) => Skill.fromJson(s)).toList(),
      education: (json["education"] as List?)
          ?.map((e) => Education.fromJson(e))
          .toList(),
      projects:
          (json["projects"] as List?)?.map((p) => Project.fromJson(p)).toList(),
      experiences: (json["experiences"] as List?)
          ?.map((e) => Experience.fromJson(e))
          .toList(),
      trainingsCourses: (json["trainings_courses"] as List?)
          ?.map((t) => TrainingCourse.fromJson(t))
          .toList(),
    );
  }
}

// باقي الكلاسات مع الحقول غير المطلوبة:

class Skill {
  final String? skill;
  final String? level;

  Skill({this.skill, this.level});

  Map<String, dynamic> toJson() => {
        "skill": skill,
        "level": level,
      };

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      skill: json["skill"],
      level: json["level"],
    );
  }
}

class Education {
  final String? degree;
  final String? institution;
  final String? description;
  final String? startDate;
  final String? endDate;

  Education({
    this.degree,
    this.institution,
    this.description,
    this.startDate,
    this.endDate,
  });

  Map<String, dynamic> toJson() => {
        "degree": degree,
        "institution": institution,
        "description": description,
        "start_date": startDate,
        "end_date": endDate,
      };

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      degree: json["degree"],
      institution: json["institution"],
      description: json["description"],
      startDate: json["start_date"],
      endDate: json["end_date"],
    );
  }
}

class Project {
  final String? title;
  final String? description;
  final String? githubLink;

  Project({this.title, this.description, this.githubLink});

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "github_link": githubLink,
      };

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json["title"],
      description: json["description"],
      githubLink: json["github_link"],
    );
  }
}

class Experience {
  final String? jobTitle;
  final String? company;
  final String? startDate;
  final String? endDate;
  final String? description;

  Experience({
    this.jobTitle,
    this.company,
    this.startDate,
    this.endDate,
    this.description,
  });

  Map<String, dynamic> toJson() => {
        "job_title": jobTitle,
        "company": company,
        "start_date": startDate,
        "end_date": endDate,
        "description": description,
      };

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      jobTitle: json["job_title"],
      company: json["company"],
      startDate: json["start_date"],
      endDate: json["end_date"],
      description: json["description"],
    );
  }
}

class TrainingCourse {
  final String? title;
  final String? institution;
  final String? startDate;
  final String? endDate;
  final String? description;

  TrainingCourse({
    this.title,
    this.institution,
    this.startDate,
    this.endDate,
    this.description,
  });

  Map<String, dynamic> toJson() => {
        "title": title,
        "institution": institution,
        "start_date": startDate,
        "end_date": endDate,
        "description": description,
      };

  factory TrainingCourse.fromJson(Map<String, dynamic> json) {
    return TrainingCourse(
      title: json["title"],
      institution: json["institution"],
      startDate: json["start_date"],
      endDate: json["end_date"],
      description: json["description"],
    );
  }
}
