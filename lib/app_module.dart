import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/modules/chat/chat_module.dart';
import 'package:new_zap/modules/chat/sub_modules/custom_chat_wallpaper/custom_chat_wallpaper_module.dart';
import 'package:new_zap/modules/contacts/contacts_module.dart';
import 'package:new_zap/modules/home/home_module.dart';
import 'package:new_zap/modules/internet_image/internet_image_module.dart';
import 'package:new_zap/modules/user_settings/user_settings_module.dart';
import 'package:new_zap/modules/welcome/welcome_module.dart';
import 'package:new_zap/repositories/current_user/current_user_controller.dart';
import 'package:new_zap/repositories/local_storage/local_storage_controller.dart';
import 'package:new_zap/repositories/theme/app_theme_controller.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.lazySingleton((i) => CurrentUserController()),
        Bind.singleton((i) => AppThemeController()),
        Bind.singleton((i) => LocalStorageController()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          Routes.initialRoute,
          module: WelcomeModule(),
        ),
        ModuleRoute(
          Routes.homeModuleRoute,
          module: HomeModule(),
        ),
        ModuleRoute(
          Routes.chatModuleRoute,
          module: ChatModule(),
        ),
        ModuleRoute(
          Routes.customChatWallpaper,
          module: CustomChatWallpaperModule(),
        ),
        ModuleRoute(
          Routes.contactsModuleRoute,
          module: ContactsModule(),
        ),
        ModuleRoute(
          Routes.userSettingsModuleRoute,
          module: UserSettingsModule(),
        ),
        ModuleRoute(
          Routes.searchProfileWebImageModuleRoute,
          module: InternetImageModule(),
        ),
      ];
}
