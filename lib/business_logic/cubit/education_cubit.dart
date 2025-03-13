import 'package:flutter_bloc/flutter_bloc.dart';
import 'education_state.dart';

class EducationCubit extends Cubit<EducationState> {
  EducationCubit() : super(EducationState());

  void addEducation() {
    final updatedList = List.of(state.educationList)..add("New Education");
    emit(EducationState(educationList: updatedList));
  }

  void removeEducation(int index) {
    final updatedList = List.of(state.educationList)..removeAt(index);
    emit(EducationState(educationList: updatedList));
  }
}
