// lib/models/nationality.dart
class Nationality {
  final int id;
  final String demonym;

  Nationality({
    required this.id,
    required this.demonym,
  });

  factory Nationality.fromJson(Map<String, dynamic> json) {
    return Nationality(
      id: json['id'] as int,
      demonym: json['demonym'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'demonym': demonym,
    };
  }

  @override
  String toString() {
    return 'Nationality(id: $id, demonym: $demonym)';
  }
}