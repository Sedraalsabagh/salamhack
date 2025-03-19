class ResumeModel {
  PersonalDetails? personalDetails;
  String? summary;
  List<Skill>? skills;
  List<Education>? education;
  List<Project>? projects;
  List<Experience>? experiences;
  List<TrainingCourse>? trainingsCourses;
  String? pdfFile;

  ResumeModel({
    this.personalDetails,
    this.summary,
    this.skills,
    this.education,
    this.projects,
    this.experiences,
    this.trainingsCourses,
    this.pdfFile,
  });

  factory ResumeModel.fromJson(Map<String, dynamic> json) {
    return ResumeModel(
      personalDetails: json['personal_details'] != null
          ? PersonalDetails.fromJson(json['personal_details'])
          : null,
      summary: json['summary'] ?? '', // Default empty string if null
      skills: (json['skills'] as List?)
          ?.map((item) => Skill.fromJson(item))
          .toList(),
      education: (json['education'] as List?)
          ?.map((item) => Education.fromJson(item))
          .toList(),
      projects: (json['projects'] as List?)
          ?.map((item) => Project.fromJson(item))
          .toList(),
      experiences: (json['experiences'] as List?)
          ?.map((item) => Experience.fromJson(item))
          .toList(),
      trainingsCourses: (json['trainings_courses'] as List?)
          ?.map((item) => TrainingCourse.fromJson(item))
          .toList(),
      pdfFile: json['pdf_file'],
    );
  }
}

class PersonalDetails {
  String? name;
  String? email;
  String? phone;
  String? location;
  String? githubLink;
  String? linkedinLink;

  PersonalDetails({
    this.name,
    this.email,
    this.phone,
    this.location,
    this.githubLink,
    this.linkedinLink,
  });

  factory PersonalDetails.fromJson(Map<String, dynamic> json) {
    return PersonalDetails(
      name: json['name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
      location: json['location'] ?? '',
      githubLink: json['github_link'] ?? '',
      linkedinLink: json['linkedin_link'] ?? '',
    );
  }
}

class Skill {
  String? skill;
  String? level;

  Skill({this.skill, this.level});

  factory Skill.fromJson(Map<String, dynamic> json) {
    return Skill(
      skill: json['skill'] ?? '',
      level: json['level'] ?? '',
    );
  }
}

class Education {
  String? degree;
  String? institution;
  String? startDate;
  String? endDate;
  String? description;

  Education({
    this.degree,
    this.institution,
    this.startDate,
    this.endDate,
    this.description,
  });

  factory Education.fromJson(Map<String, dynamic> json) {
    return Education(
      degree: json['degree'] ?? '',
      institution: json['institution'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class Project {
  String? title;
  String? description;
  String? githubLink;

  Project({this.title, this.description, this.githubLink});

  factory Project.fromJson(Map<String, dynamic> json) {
    return Project(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      githubLink: json['github_link'] ?? '',
    );
  }
}

class Experience {
  String? jobTitle;
  String? company;
  String? startDate;
  String? endDate;
  String? description;

  Experience({
    this.jobTitle,
    this.company,
    this.startDate,
    this.endDate,
    this.description,
  });

  factory Experience.fromJson(Map<String, dynamic> json) {
    return Experience(
      jobTitle: json['job_title'] ?? '',
      company: json['company'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      description: json['description'] ?? '',
    );
  }
}

class TrainingCourse {
  String? title;
  String? institution;
  String? startDate;
  String? endDate;
  String? description;

  TrainingCourse({
    this.title,
    this.institution,
    this.startDate,
    this.endDate,
    this.description,
  });

  factory TrainingCourse.fromJson(Map<String, dynamic> json) {
    return TrainingCourse(
      title: json['title'] ?? '',
      institution: json['institution'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      description: json['description'] ?? '',
    );
  }
}
