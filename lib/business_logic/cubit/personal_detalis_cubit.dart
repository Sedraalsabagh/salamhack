import 'package:flutter_bloc/flutter_bloc.dart';

import 'personal_details_state.dart';



class PersonalDetailsCubit extends Cubit<PersonalDetailsState> {
  PersonalDetailsCubit() : super(const PersonalDetailsState());

  // تحديث البيانات عند تغيير أي قيمة في الحقول
  void updateName(String name) => emit(state.copyWith(name: name));
  void updateAddress(String address) => emit(state.copyWith(address: address));
  void updateEmail(String email) => emit(state.copyWith(email: email));
  void updatePhone(String phone) => emit(state.copyWith(phone: phone));
  void updateDateOfBirth(String dob) => emit(state.copyWith(dateOfBirth: dob));
  void updateWebsite(String github) => emit(state.copyWith(github: github));
  void updateLinkedIn(String linkedIn) => emit(state.copyWith(linkedIn: linkedIn));
}