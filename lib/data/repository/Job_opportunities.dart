import 'package:devloper_app/data/models/Job_opportunities.dart';
import 'package:devloper_app/data/webService/opportunitiesWebServices.dart';

class JobRepository {
  final JobWebServices _jobWebServices = JobWebServices();

  Future<List<Job>> fetchJobs() async {
    return await _jobWebServices.fetchJobs();
  }
}
