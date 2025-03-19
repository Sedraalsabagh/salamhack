import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/repository/convertcvrepository.dart';
import 'resume_state.dart';

class ResumeCubit extends Cubit<ResumeState> {
  final ResumeRepository repository;

  ResumeCubit(this.repository) : super(ResumeInitial());

  void convertResume(Uint8List fileBytes, String fileName) async {
    emit(ResumeLoading());
    try {
      final resumeModel = await repository.convertResume(fileBytes, fileName);
      emit(ResumeLoaded(resumeModel));
    } catch (e) {
      emit(ResumeError('Failed to convert resume: $e'));
    }
  }
}
