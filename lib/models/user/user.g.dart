// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      documentId: json['documentId'] as String?,
      profileUrlImage: json['profileUrlImage'] as String?,
      lastEntrance: json['lastEntrance'] as int?,
      name: json['name'] as String,
      email: json['email'] as String?,
      age: json['age'] as String?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'name': instance.name,
      'age': instance.age,
      'email': instance.email,
      'profileUrlImage': instance.profileUrlImage,
      'lastEntrance': instance.lastEntrance,
    };
