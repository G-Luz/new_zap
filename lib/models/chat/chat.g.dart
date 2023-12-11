// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Chat _$ChatFromJson(Map<String, dynamic> json) => Chat(
      documentId: json['documentId'] as String?,
      backgroundColor: json['backgroundColor'] as int?,
      backgroundImageUrl: json['backgroundImageUrl'] as String?,
      blocked: json['blocked'] as bool?,
      stDocumentId: json['stDocumentId'] as String?,
      ndDocumentId: json['ndDocumentId'] as String?,
      messageDocumentId: json['messageDocumentId'] as String?,
    );

Map<String, dynamic> _$ChatToJson(Chat instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'backgroundColor': instance.backgroundColor,
      'backgroundImageUrl': instance.backgroundImageUrl,
      'blocked': instance.blocked,
      'stDocumentId': instance.stDocumentId,
      'ndDocumentId': instance.ndDocumentId,
      'messageDocumentId': instance.messageDocumentId,
    };
