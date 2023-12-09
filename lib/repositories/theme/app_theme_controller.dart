import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/repositories/local_storage/local_storage_controller.dart';

part 'app_theme_controller.g.dart';

class AppThemeController = AppThemeControllerBase with _$AppThemeController;

abstract class AppThemeControllerBase with Store {
  final localStorageController = Modular.get<LocalStorageController>();

  @observable
  bool isDarkTheme = false;

  @action
  changeTheme() {
    isDarkTheme = !isDarkTheme;
  }

  @action
  retrieveUserTheme() async {
    final isDarkTheme = await localStorageController.getValueByKey(
      AppCollections.themeKey,
    );

    if (isDarkTheme != null) {
      this.isDarkTheme = isDarkTheme;
    }
  }
}
