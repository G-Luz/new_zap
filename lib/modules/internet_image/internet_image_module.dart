import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/modules/internet_image/controller/internet_image_controller.dart';
import 'package:new_zap/modules/internet_image/internet_image_page.dart';
import 'package:new_zap/modules/internet_image/repository/internet_image_repository.dart';

class InternetImageModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => InternetImageController()),
    Bind.singleton((i) => InternetImageRepository())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (context, args) => const InternetImagePage(),
    )
  ];
}
