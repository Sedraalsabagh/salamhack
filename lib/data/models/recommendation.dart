class Recommendation {
  final String title;
  final int date;

  Recommendation({required this.title, required this.date});

  factory Recommendation.fromJson(Map<String, dynamic> json) {
    return Recommendation(
       title: json['job_title'] as String, 
      date: json['match_percentage'] as int,
    );
  }

}