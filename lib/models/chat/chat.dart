import 'package:json_annotation/json_annotation.dart';

part 'chat.g.dart';

@JsonSerializable()
class Chat {
  final String? documentId;
  final int? backgroundColor;
  final String? backgroundImageUrl;
  final bool? blocked;
  final String? stDocumentId;
  final String? ndDocumentId;
  final String? messageDocumentId;

  Chat({
    this.documentId,
    this.backgroundColor,
    this.backgroundImageUrl,
    this.blocked,
    this.stDocumentId,
    this.ndDocumentId,
    this.messageDocumentId,
  });

  Chat copyWith({
    String? documentId,
    int? backgroundColor,
    String? backgroundImageUrl,
    bool? blocked,
    String? stDocumentId,
    String? ndDocumentId,
    String? messageDocumentId,
  }) {
    return Chat(
      documentId: documentId ?? this.documentId,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      backgroundImageUrl: backgroundImageUrl ?? this.backgroundImageUrl,
      blocked: blocked ?? this.blocked,
      stDocumentId: stDocumentId ?? this.stDocumentId,
      ndDocumentId: ndDocumentId ?? this.ndDocumentId,
      messageDocumentId: messageDocumentId ?? this.messageDocumentId,
    );
  }

  factory Chat.fromJson(Map<String, dynamic> json) => _$ChatFromJson(json);

  Map<String, dynamic> toJson() => _$ChatToJson(this);

  @override
  bool operator ==(obj) =>
      obj is Chat &&
      documentId == obj.documentId &&
      stDocumentId == obj.stDocumentId &&
      ndDocumentId == obj.ndDocumentId;
}
