import 'package:devloper_app/data/models/evaluation.dart';
import 'package:devloper_app/data/webService/evaluationWebServices.dart';

class ResumeRepository {
  final ResumeWebServices webServices;

  ResumeRepository(this.webServices);

  Future<ResumeEvaluationResult> evaluateResume({
    required String jobDescription,
    String? filePath,
    List<int>? fileBytes,
    String? fileName,
  }) {
    return webServices.evaluateResume(
      jobDescription: jobDescription,
      filePath: filePath,
      fileBytes: fileBytes,
      fileName: fileName,
    );
  }
}
