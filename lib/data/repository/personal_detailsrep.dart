import 'package:devloper_app/data/webService/personal_detailsWwbServer.dart';

import '../models/personal_detailsmodels.dart';

class PersonalDetailsRepository {
  final PersonalDetailsWebServices webServices;

  PersonalDetailsRepository({required this.webServices});

  Future<void> savePersonalDetails(PersonalDetailsModel details) async {
    await webServices.addPersonalDetails(details);
  }
}
