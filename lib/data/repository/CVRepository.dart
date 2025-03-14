import '../models/cvmodel.dart';
import '../webService/CVWebServices.dart';

class CVRepository {
  late final CVWebServices cvWebServices;

  CVRepository({required this.cvWebServices});

  Future<Map<String, dynamic>> createCV(CVModel cvModel) async {
    try {
      final response = await cvWebServices.createCV(cvModel);
      return response;
    } catch (e) {
      throw Exception("Error: $e");
    }
  }
}
