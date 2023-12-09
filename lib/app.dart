import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/constants/theme/app_theme.dart';
import 'package:new_zap/repositories/theme/app_theme_controller.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Modular.get<AppThemeController>();

    Modular.setInitialRoute(Routes.initialRoute);
    return Observer(
      builder: (context) {
        themeController.retrieveUserTheme();

        return MaterialApp.router(
          title: 'New Zap Go',
          theme: themeController.isDarkTheme
              ? AppTheme.darkThemeData
              : AppTheme.lightThemeData,
          routerDelegate: Modular.routerDelegate,
          routeInformationParser: Modular.routeInformationParser,
        );
      },
    );
  }
}
