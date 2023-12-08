import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/modules/user_settings/controller/user_settings_controller.dart';
import 'package:new_zap/modules/user_settings/repository/user_settings_repository.dart';
import 'package:new_zap/modules/user_settings/user_settings_page.dart';

class UserSettingsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => UserSettingsController()),
    Bind.singleton((i) => UserSettingsRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.initialRoute,
      child: (context, args) => const UserSettingsPage(),
    )
  ];
}
