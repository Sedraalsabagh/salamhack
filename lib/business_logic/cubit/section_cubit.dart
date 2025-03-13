import 'package:flutter_bloc/flutter_bloc.dart';

import 'section_state.dart';


class ProfileBloc extends Cubit<ProfileState> {
  ProfileBloc() : super(ProfileInitial());
}
