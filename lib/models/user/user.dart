import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String? documentId;
  final String name;
  final String? age;
  final String? email;
  final String? profileUrlImage;
  final int? lastEntrance;

  User({
    this.documentId,
    this.profileUrlImage,
    this.lastEntrance,
    required this.name,
    this.email,
    this.age,
  });

  User copyWith({
    String? documentId,
    String? name,
    String? age,
    String? email,
    String? profileUrlImage,
    int? lastEntrance,
  }) {
    return User(
      documentId: documentId ?? this.documentId,
      name: name ?? this.name,
      email: email ?? this.email,
      age: age ?? this.age,
      profileUrlImage: profileUrlImage ?? this.profileUrlImage,
      lastEntrance: lastEntrance ?? this.lastEntrance,
    );
  }

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  ///TALVEZ DE ERRO DE COMPARAÇÃO NO LOGIN POR CONTA DA COMPARAÇÃO DA IMG DE PERFIL
  @override
  bool operator ==(obj) =>
      obj is User &&
      name == obj.name &&
      email == obj.email &&
      age == obj.age &&
      documentId == obj.documentId &&
      profileUrlImage == obj.profileUrlImage;
}
