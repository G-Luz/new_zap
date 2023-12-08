import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/repositories/current_user/current_user_controller.dart';
import 'package:new_zap/repositories/theme/app_theme_controller.dart';

part 'home_controller.g.dart';

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final currentUser = Modular.get<CurrentUserController>();

  final theme = Modular.get<AppThemeController>();
}