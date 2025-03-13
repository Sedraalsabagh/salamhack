class PersonalDetailsModel {
  final String name;
  final String email;
  final String phone;
  final String location;
  final String githubLink;
  final String linkedinLink;

  PersonalDetailsModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.githubLink,
    required this.linkedinLink,
  });

  // هي لحتى ارسلها للسيرفر
  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "email": email,
      "phone": phone,
      "location": location,
      "github_link": githubLink,
      "linkedin_link": linkedinLink,
    };
  }
}
