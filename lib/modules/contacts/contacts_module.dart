import 'package:flutter_modular/flutter_modular.dart';
import 'package:new_zap/constants/routes.dart';
import 'package:new_zap/modules/contacts/contacts_page.dart';
import 'package:new_zap/modules/contacts/controller/contacts_controller.dart';
import 'package:new_zap/modules/contacts/repository/contacts_repository.dart';

class ContactsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => ContactsController()),
    Bind.singleton((i) => ContactsRepository()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      Routes.initialRoute,
      child: (context, args) => const ContactsPage(),
    )
  ];
}
