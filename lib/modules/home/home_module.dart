import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/modules/home/controller/home_controller.dart';
import 'package:new_zap/modules/home/home_page.dart';
import 'package:new_zap/modules/home/repository/home_repository.dart';

class HomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.singleton((i) => HomeController()),
        Bind.singleton((i) => HomeRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Routes.initialRoute,
          child: (context, args) => const HomePage(),
        )
      ];
}
