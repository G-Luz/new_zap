import 'package:new_zap/modules/internet_image/controller/model/internet_image.dart';

class InternetImageHelper {
  static InternetImage mapToInternetImage(Map<String, dynamic> json) {
    final internetImage = InternetImage(
      id: json['id'],
      regular: json['urls']['regular'],
    );

    print('DIZ PRA NOIS AI: ${internetImage.toJson()}');

    return internetImage;
  }

  static List<InternetImage> mapToListInternetImages(
      List<dynamic> responseList) {
    final imagesList = <InternetImage>[];
    for (final item in responseList) {
      final internetImage = InternetImage(
        id: item['id'],
        full: item['urls']['full'],
        regular: item['urls']['regular'],
      );

      imagesList.add(internetImage);
    }
    return imagesList;
  }
}
