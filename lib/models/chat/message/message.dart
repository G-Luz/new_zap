import 'package:json_annotation/json_annotation.dart';

part 'message.g.dart';

@JsonSerializable()
class Message {
  String? documentId;
  String? content;
  String? sendyByUserDocumentId;
  DateTime? sendDate;
  bool? viewed;

  Message({
    this.documentId,
    this.content,
    this.sendyByUserDocumentId,
    this.sendDate,
    this.viewed,
  });

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
