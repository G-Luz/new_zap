import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/models/user/user.dart';
import 'package:new_zap/modules/contacts/repository/contacts_repository.dart';
import 'package:new_zap/repositories/current_user/current_user_controller.dart';

part 'contacts_controller.g.dart';

enum ContactsStatus { initial, loading, success, failure }

class ContactsController = ContactsControllerBase with _$ContactsController;

abstract class ContactsControllerBase with Store {
  final _repository = Modular.get<ContactsRepository>();
  final currentUserController = Modular.get<CurrentUserController>();

  @observable
  ContactsStatus status = ContactsStatus.initial;

  @observable
  bool isSearchContact = false;

  @observable
  ObservableList<User> contactsList = ObservableList<User>();

  @action
  handleSearchContactBar() {
    isSearchContact = !isSearchContact;
  }

  @action
  retrieveContacts() async {
    status = ContactsStatus.loading;
    contactsList.addAll(await _repository.findAllContacts());
    status = ContactsStatus.success;
  }
}
