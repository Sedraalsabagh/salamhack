class ResumeEvaluationResult {
  final double matchPercentage;
  final List<String> missingKeywords;
  final String improvementTips;

  ResumeEvaluationResult({
    required this.matchPercentage,
    required this.missingKeywords,
    required this.improvementTips,
  });

  factory ResumeEvaluationResult.fromJson(Map<String, dynamic> json) {
    return ResumeEvaluationResult(
      matchPercentage: json['match_percentage'],
      missingKeywords: List<String>.from(json['missing_keywords']),
      improvementTips: json['improvement_tips'],
    );
  }
}
        