class Job {
  final String title;
  final String description;
  final String skills;
  final String experience;
  final String location;

  Job({
    required this.title,
    required this.description,
    required this.skills,
    required this.experience,
    required this.location,
  });

  // تحويل JSON إلى كائن Job
  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      skills: json['required_skills'] ?? '',
      experience: json['experience_required'] ?? '',
      location: json['location'] ?? '',
    );
  }
}
