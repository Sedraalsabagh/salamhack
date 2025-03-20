import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/convertcvmodel.dart';
import '../../data/models/cvmodel.dart';
import '../../data/repository/CVRepository.dart';

part 'cv_state.dart';

class CvCubit extends Cubit<CVModel> {
  final CVRepository cvRepository;

  CvCubit(this.cvRepository) : super(CVModel());
  // Main inof:
  void updateMainInfo({
    String? username,
    String? email,
    String? phone,
    String? location,
    String? githublink,
    String? linkedinlink,
  }) {
    emit(state.copyWith(
      username: username,
      email: email,
      phone: phone,
      location: location,
      githubLink: githublink,
      linkedinLink: linkedinlink,
    ));
  }

  // // update Education:
  void updateEducation(List<EducationCV> education) {
    emit(state.copyWith(education: education));
  }

  // update Courses:
  void updateCourses(List<TrainingCourseCV> trainingsCourses) {
    emit(state.copyWith(trainingsCourses: trainingsCourses));
  }

  // update Experience:
  void updateExperience(List<ExperienceCV> experiences) {
    emit(state.copyWith(experiences: experiences));
  }

// update Skills
  void updateSkill(List<SkillCV> skill) {
    emit(state.copyWith(skills: skill));
  }

// update Projects
  void updateProject(List<ProjectCV> projects) {
    emit(state.copyWith(projects: projects));
  }

  Future<void> submitCVData() async {
    final cv_data = state;
    print("\n \t \t -------CV in CUBIT --------\n");
    print("${cv_data.toJson()}");
    print("\n------- DONE ----------- \n");
    final response = cvRepository.createCV(cv_data);
  }
}
