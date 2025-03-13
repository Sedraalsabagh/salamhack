
class PersonalDetailsState {
  final String name;
  final String address;
  final String email;
  final String phone;
  final String dateOfBirth;
  final String github;
  final String linkedIn;

  const PersonalDetailsState({
    this.name = '',
    this.address = '',
    this.email = '',
    this.phone = '',
    this.dateOfBirth = '',
    this.github = '',
    this.linkedIn = '',
  });

  // إنشاء نسخة جديدة من الحالة عند التحديث
  PersonalDetailsState copyWith({
    String? name,
    String? address,
    String? email,
    String? phone,
    String? dateOfBirth,
    String?github,
    String? linkedIn,
  }) {
    return PersonalDetailsState(
      name: name ?? this.name,
      address: address ?? this.address,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      github: github ?? this.github,
      linkedIn: linkedIn ?? this.linkedIn,
    );
  }
}