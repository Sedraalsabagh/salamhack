import 'package:devloper_app/business_logic/cubit/job_opportunities_state.dart';
import 'package:devloper_app/data/repository/Job_opportunities.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class JobCubit extends Cubit<JobState> {
  final JobRepository _jobRepository;
  JobCubit(this._jobRepository) : super(JobLoading());

  void loadJobs() async {
    try {
      emit(JobLoading());
      final jobs = await _jobRepository.fetchJobs();
      emit(JobLoaded(jobs: jobs));
    } catch (e) {
      emit(JobError(message: e.toString()));
    }
  }
}
