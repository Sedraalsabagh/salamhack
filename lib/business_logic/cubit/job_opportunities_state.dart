import 'package:devloper_app/data/models/Job_opportunities.dart';


abstract class JobState {}

class JobLoading extends JobState {}

class JobLoaded extends JobState {
  final List<Job> jobs;
  JobLoaded({required this.jobs});
}

class JobError extends JobState {
  final String message;
  JobError({required this.message});
}
