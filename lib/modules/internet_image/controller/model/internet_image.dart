import 'package:json_annotation/json_annotation.dart';

part 'internet_image.g.dart';

@JsonSerializable()
class InternetImage {
  final String id;
  final String? full;
  final String? regular;

  InternetImage({
    required this.id,
    this.full,
    this.regular,
  });

  factory InternetImage.fromJson(Map<String, dynamic> json) =>
      _$InternetImageFromJson(json);

  Map<String, dynamic> toJson() => _$InternetImageToJson(this);
}
