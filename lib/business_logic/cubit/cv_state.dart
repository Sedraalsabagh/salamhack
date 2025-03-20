part of 'cv_cubit.dart';

@immutable
abstract class CvState {}

class CVInitial extends CvState {}

class CVLoading extends CvState {}

class CVSuccess extends CvState {
  final dynamic response;
  CVSuccess(this.response);
}

class CVFailure extends CvState {
  final String error;
  CVFailure(this.error);
}

class CVFilling extends CvState {}

class CVSectionUpdated extends CvState {}
