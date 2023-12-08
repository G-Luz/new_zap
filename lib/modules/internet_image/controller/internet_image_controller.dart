import 'package:flutter_modular/flutter_modular.dart';
import 'package:image_downloader/image_downloader.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/modules/internet_image/controller/model/internet_image.dart';
import 'package:new_zap/modules/internet_image/repository/internet_image_repository.dart';
import 'package:new_zap/utils/debounce.dart';

part 'internet_image_controller.g.dart';

enum InternetImageStatus { initial, loading, success, failure }

class InternetImageController = InternetImageControllerBase
    with _$InternetImageController;

abstract class InternetImageControllerBase with Store {
  final repository = Modular.get<InternetImageRepository>();
  final debouncer = Debouncer(delay: const Duration(milliseconds: 700));

  @observable
  InternetImageStatus status = InternetImageStatus.initial;

  @observable
  ObservableList<InternetImage> imageList = ObservableList<InternetImage>();

  @action
  searchNetworkImage(String filter) async {
    status = InternetImageStatus.loading;
    debouncer.run(() async {
      imageList.clear();
      imageList.addAll(await repository.searchImages(filter));
      status = InternetImageStatus.success;
    });
  }

  Future<String?> downloadNetworkImage(String? imageUrl) async {
    if (imageUrl != null) {
      var imageId = await ImageDownloader.downloadImage(imageUrl,
          destination: AndroidDestinationType.custom(directory: 'sample')
            ..inExternalFilesDir()
            ..subDirectory("network/internetImage${DateTime.now()}.jpg"));
      if (imageId == null) {
        return null;
      }
      return await ImageDownloader.findPath(imageId);
    }
    return null;
  }
}
