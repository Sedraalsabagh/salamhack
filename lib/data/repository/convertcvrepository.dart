import '../models/convertcvmodel.dart';
import '../webService/convertcvwebserver.dart';
import 'dart:typed_data'; // استيراد لـ Uint8List

class ResumeRepository {
  final ResumeWebService webService;

  ResumeRepository(this.webService);

  Future<ResumeModel> convertResume(Uint8List fileBytes, String fileName) {
    return webService.convertResume(fileBytes, fileName);
  }
}
