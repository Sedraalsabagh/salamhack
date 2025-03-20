class CVModel {
  final String? username;
  final String? email;
  final String? phone;
  final String? location;
  final String? githubLink;
  final String? linkedinLink;
  final String? summary;
  final List<SkillCV>? skills;

  final List<EducationCV>? education;
  final List<ProjectCV>? projects;
  final List<ExperienceCV>? experiences;
  final List<TrainingCourseCV>? trainingsCourses;

  CVModel({
    this.username,
    this.email,
    this.phone,
    this.location,
    this.githubLink,
    this.linkedinLink,
    this.skills,
    this.summary,
    this.education,
    this.projects,
    this.experiences,
    this.trainingsCourses,
  });

  Map<String, dynamic> toJson() => {
        "username": username,
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
      username: json["username"],
      email: json["email"],
      phone: json["phone"],
      location: json["location"],
      githubLink: json["github_link"],
      linkedinLink: json["linkedin_link"],
      summary: json["summary"],
      skills:
          (json["skills"] as List?)?.map((s) => SkillCV.fromJson(s)).toList(),
      education: (json["education"] as List?)
          ?.map((e) => EducationCV.fromJson(e))
          .toList(),
      projects: (json["projects"] as List?)
          ?.map((p) => ProjectCV.fromJson(p))
          .toList(),
      experiences: (json["experiences"] as List?)
          ?.map((e) => ExperienceCV.fromJson(e))
          .toList(),
      trainingsCourses: (json["trainings_courses"] as List?)
          ?.map((t) => TrainingCourseCV.fromJson(t))
          .toList(),
    );
  }
  CVModel copyWith({
    String? username,
    String? email,
    String? phone,
    String? location,
    String? githubLink,
    String? linkedinLink,
    String? summary,
    List<SkillCV>? skills,
    List<EducationCV>? education,
    List<ProjectCV>? projects,
    List<ExperienceCV>? experiences,
    List<TrainingCourseCV>? trainingsCourses,
  }) {
    return CVModel(
      username: username ?? this.username,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      githubLink: githubLink ?? this.githubLink,
      linkedinLink: linkedinLink ?? this.linkedinLink,
      skills: skills ?? this.skills,
      education: education ?? this.education,
      projects: projects ?? this.projects,
      experiences: experiences ?? this.experiences,
      trainingsCourses: trainingsCourses ?? this.trainingsCourses,
    );
  }
}

class SkillCV {
  final String? skill;
  final String? level;

  SkillCV({this.skill, this.level});

  Map<String, dynamic> toJson() => {
        "skill": skill,
        "level": level,
      };

  factory SkillCV.fromJson(Map<String, dynamic> json) {
    return SkillCV(
      skill: json["skill"],
      level: json["level"],
    );
  }
}

class EducationCV {
  final String? degree;
  final String? institution;
  final String? description;
  final String? startDate;
  final String? endDate;

  EducationCV({
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

  factory EducationCV.fromJson(Map<String, dynamic> json) {
    return EducationCV(
      degree: json["degree"],
      institution: json["institution"],
      description: json["description"],
      startDate: json["start_date"],
      endDate: json["end_date"],
    );
  }
}

class ProjectCV {
  final String? title;
  final String? description;
  final String? githubLink;

  ProjectCV({this.title, this.description, this.githubLink});

  Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "github_link": githubLink,
      };

  factory ProjectCV.fromJson(Map<String, dynamic> json) {
    return ProjectCV(
      title: json["title"],
      description: json["description"],
      githubLink: json["github_link"],
    );
  }
}

class ExperienceCV {
  final String? jobTitle;
  final String? company;
  final String? startDate;
  final String? endDate;
  final String? description;

  ExperienceCV({
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

  factory ExperienceCV.fromJson(Map<String, dynamic> json) {
    return ExperienceCV(
      jobTitle: json["job_title"],
      company: json["company"],
      startDate: json["start_date"],
      endDate: json["end_date"],
      description: json["description"],
    );
  }
}

class TrainingCourseCV {
  final String? title;
  final String? institution;
  final String? startDate;
  final String? endDate;
  final String? description;

  TrainingCourseCV({
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

  factory TrainingCourseCV.fromJson(Map<String, dynamic> json) {
    return TrainingCourseCV(
      title: json["title"],
      institution: json["institution"],
      startDate: json["start_date"],
      endDate: json["end_date"],
      description: json["description"],
    );
  }
}
