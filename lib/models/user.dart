// lib/models/user.dart

import 'sex.dart';
import 'nationality.dart';

class User {
  final int id;
  final String username;
  final String password;
  final String firstName;
  final String lastName;
  final String email;
  final String? resetKey;
  final bool status;
  final String? activationKey;
  final DateTime? birthDate;
  final String? profilePicture;
  final int sexId;
  final int nationalityId;

  // Objetos relacionados opcionales
  final Sex? sex;
  final Nationality? nationality;

  User({
    required this.id,
    required this.username,
    required this.password,
    required this.firstName,
    required this.lastName,
    required this.email,
    this.resetKey,
    required this.status,
    this.activationKey,
    this.birthDate,
    this.profilePicture,
    required this.sexId,
    required this.nationalityId,
    this.sex,
    this.nationality,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      username: json['username'] as String,
      password: json['password'] as String,
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      email: json['email'] as String,
      resetKey: json['reset_key'] as String?,
      status: json['status'] as bool,
      activationKey: json['activation_key'] as String?,
      birthDate: json['birth_date'] != null
          ? DateTime.parse(json['birth_date'])
          : null,
      profilePicture: json['profile_picture'] as String?,
      sexId: json['sex_id'] as int,
      nationalityId: json['nationality_id'] as int,

      // Relaciones opcionales
      sex: json['sex'] != null
          ? Sex.fromJson(json['sex'])
          : null,

      nationality: json['nationality'] != null
          ? Nationality.fromJson(json['nationality'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'password': password,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'reset_key': resetKey,
      'status': status,
      'activation_key': activationKey,
      'birth_date': birthDate?.toIso8601String(),
      'profile_picture': profilePicture,
      'sex_id': sexId,
      'nationality_id': nationalityId,

      // Relaciones opcionales
      'sex': sex?.toJson(),
      'nationality': nationality?.toJson(),
    };
  }

  @override
  String toString() {
    return '''
  User(
    id: $id,
    username: $username,
    firstName: $firstName,
    lastName: $lastName,
    email: $email,
    status: $status,
    birthDate: $birthDate,
    profilePicture: $profilePicture,
    sexId: $sexId,
    nationalityId: $nationalityId,
    sex: $sex,
    nationality: $nationality
  )
  ''';
  }
}