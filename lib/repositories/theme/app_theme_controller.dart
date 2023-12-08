import 'package:mobx/mobx.dart';

part 'app_theme_controller.g.dart';

class AppThemeController = AppThemeControllerBase with _$AppThemeController;

abstract class AppThemeControllerBase with Store {
  @observable
  bool isDarkTheme = false;

  @action
  changeTheme() {
    isDarkTheme = !isDarkTheme;
  }
}
