import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/modules/chat/chat_page.dart';

class ChatModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.initialRoute,
      child: (context, args) => const ChatPage(),
    )
  ];
}
