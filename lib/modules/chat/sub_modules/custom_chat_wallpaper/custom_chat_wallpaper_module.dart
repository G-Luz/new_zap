import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/modules/chat/sub_modules/custom_chat_wallpaper/controller/custom_chat_wallpaper_controller.dart';
import 'package:new_zap/modules/chat/sub_modules/custom_chat_wallpaper/custom_chat_wallpaper_page.dart';
import 'package:new_zap/modules/chat/sub_modules/custom_chat_wallpaper/repository/custom_chat_wallpaper_repository.dart';

class CustomChatWallpaperModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.factory((i) => CustomChatWallpaperController()),
    Bind.factory((i) => CustomChatWallpaperRepository())
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.initialRoute,
      child: (context, args) => const CustomChatWallpaperPage(),
    )
  ];
}
