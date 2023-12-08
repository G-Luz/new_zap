import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/modules/internet_image/controller/model/internet_image.dart';
import 'package:new_zap/modules/internet_image/repository/helper/internet_image_helper.dart';

part 'internet_image_repository.g.dart';

class InternetImageRepository = InternetImageRepositoryBase
    with _$InternetImageRepository;

abstract class InternetImageRepositoryBase with Store {
  final Dio _client = Dio();
  final _imagesEndpoint = 'https://api.unsplash.com';
  final _accessToken = 'Client-ID dpBbF4AlKeEMN4mFnPiFKLM9dnnWL6Xb36odNmz3jEw';

  Future<List<InternetImage>> searchImages(String filter) async {
    final response = await _client.get(
      '$_imagesEndpoint/search/photos',
      queryParameters: {
        'query': filter,
        // 'lang': context.locale
        'lang': 'pt',
        'per_page': 100,
      },
      options: Options(
        headers: {
          'Authorization': _accessToken,
        },
      ),
    );

    if (response.data != null) {
      return InternetImageHelper.mapToListInternetImages(
          response.data['results']);
    }

    return [];
  }
}
