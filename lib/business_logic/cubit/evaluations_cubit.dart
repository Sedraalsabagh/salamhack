// import 'package:bloc/bloc.dart';
// import 'package:devloper_app/business_logic/cubit/evaluations_state.dart';
// import 'package:devloper_app/data/repository/evaluation.dart';

// class ResumeCubit extends Cubit<ResumeState> {
//   final ResumeRepository repository;

//   ResumeCubit(this.repository) : super(ResumeInitial());

//   Future<void> evaluateResume({
//     required String jobDescription,
//     String? filePath,
//     List<int>? fileBytes,
//     String? fileName,
//   }) async {
//     emit(ResumeLoading());
//     try {
//       final result = await repository.evaluateResume(
//         jobDescription: jobDescription,
//         filePath: filePath,
//         fileBytes: fileBytes,
//         fileName: fileName,
//       );
//       emit(ResumeLoaded(result));
//     } catch (e) {
//       emit(ResumeError(e.toString()));
//     }
//   }
// }
