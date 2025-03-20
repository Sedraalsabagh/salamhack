import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/cvmodel.dart';
import '../../data/repository/CVRepository.dart';

part 'cv_state.dart';

class CvCubit extends Cubit<CvState> {
  final CVRepository cvRepository;

  CvCubit(this.cvRepository) : super(CVInitial());

  List<EducationCV> educationList = [];

  void addEducation(EducationCV education) {
    educationList.add(education);
    emit(CVSectionUpdated());
  }

  Future<void> createCV(CVModel cvModel) async {
    emit(CVLoading());
    try {
      final response = await cvRepository.createCV(cvModel);
      emit(CVSuccess(response));
    } catch (e) {
      emit(CVFailure(e.toString()));
    }
  }
}
