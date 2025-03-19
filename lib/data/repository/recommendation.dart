import 'package:devloper_app/data/models/recommendation.dart';
import 'package:devloper_app/data/webService/recommendation.dart';

class RecommendationRepository {
  final RecommendationWebServices recommendationWebServices;

  RecommendationRepository({required this.recommendationWebServices});

  Future<List<Recommendation>> getRecommendation() async {
    return await recommendationWebServices.getRecommendation();
  }
}