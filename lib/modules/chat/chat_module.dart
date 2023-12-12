import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/modules/chat/chat_page.dart';
import 'package:new_zap/modules/chat/controller/chat_controller.dart';
import 'package:new_zap/modules/chat/repository/chat_repository.dart';

class ChatModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ChatController()),
    Bind.lazySingleton((i) => ChatRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.initialRoute,
      child: (context, args) => const ChatPage(),
    )
  ];
}
