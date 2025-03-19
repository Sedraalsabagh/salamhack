import 'package:bloc/bloc.dart';
import 'package:devloper_app/data/models/recommendation.dart';
import 'package:devloper_app/data/repository/recommendation.dart';

abstract class RecommendationState {}

class RecommendationInitial extends RecommendationState {}

class RecommendationLoaded extends RecommendationState {
  final List<Recommendation> recommendations;
  RecommendationLoaded(this.recommendations);
}

class RecommendationError extends RecommendationState {
  final String message;
  RecommendationError(this.message);
}

class RecommendationCubit extends Cubit<RecommendationState> {
  final RecommendationRepository recommendationRepository;
  List<Recommendation> recommendations = [];

  RecommendationCubit(this.recommendationRepository) : super(RecommendationInitial());

  Future<void> fetchRecommendations() async {
    try {
      emit(RecommendationInitial());
      recommendations = await recommendationRepository.getRecommendation();
      emit(RecommendationLoaded(recommendations));
    } catch (e) {
      emit(RecommendationError("Failed to fetch recommendations: $e"));
    }
  }
}
