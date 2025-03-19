import '../../data/models/convertcvmodel.dart';

abstract class ResumeState {}

class ResumeInitial extends ResumeState {}

class ResumeLoading extends ResumeState {}

class ResumeLoaded extends ResumeState {
  final ResumeModel resume;

  ResumeLoaded(this.resume);
}

class ResumeError extends ResumeState {
  final String message;

  ResumeError(this.message);
}
