import '../models/cvmodel.dart';
import '../webService/CVWebServices.dart';

class CVRepository {
  final CVWebServices cvWebServices;

  CVRepository({required this.cvWebServices});

  Future<Map<String, dynamic>> createCV(CVModel cvModel) {
    return cvWebServices.createCV(cvModel.toJson());

    //
  }
}
