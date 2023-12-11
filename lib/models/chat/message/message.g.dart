// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      documentId: json['documentId'] as String?,
      content: json['content'] as String?,
      sendyByUserDocumentId: json['sendyByUserDocumentId'] as String?,
      sendDate: json['sendDate'] as String?,
      viewed: json['viewed'] as bool?,
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'documentId': instance.documentId,
      'content': instance.content,
      'sendyByUserDocumentId': instance.sendyByUserDocumentId,
      'sendDate': instance.sendDate,
      'viewed': instance.viewed,
    };
