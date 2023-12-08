import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/modules/welcome/controller/login/login_controller.dart';
import 'package:new_zap/modules/welcome/controller/signup/signup_controller.dart';
import 'package:new_zap/modules/welcome/repository/welcome_repository.dart';
import 'package:new_zap/modules/welcome/welcome_page.dart';

class WelcomeModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.factory((i) => LoginController()),
        Bind.factory((i) => SignupController()),
        Bind.singleton((i) => WelcomeRepository()),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const WelcomePage(),
        ),
      ];
}
