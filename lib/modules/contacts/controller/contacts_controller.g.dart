// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactsController on ContactsControllerBase, Store {
  late final _$statusAtom =
      Atom(name: 'ContactsControllerBase.status', context: context);

  @override
  ContactsStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ContactsStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$isSearchContactAtom =
      Atom(name: 'ContactsControllerBase.isSearchContact', context: context);

  @override
  bool get isSearchContact {
    _$isSearchContactAtom.reportRead();
    return super.isSearchContact;
  }

  @override
  set isSearchContact(bool value) {
    _$isSearchContactAtom.reportWrite(value, super.isSearchContact, () {
      super.isSearchContact = value;
    });
  }

  late final _$contactsListAtom =
      Atom(name: 'ContactsControllerBase.contactsList', context: context);

  @override
  ObservableList<User> get contactsList {
    _$contactsListAtom.reportRead();
    return super.contactsList;
  }

  @override
  set contactsList(ObservableList<User> value) {
    _$contactsListAtom.reportWrite(value, super.contactsList, () {
      super.contactsList = value;
    });
  }

  late final _$retrieveContactsAsyncAction =
      AsyncAction('ContactsControllerBase.retrieveContacts', context: context);

  @override
  Future retrieveContacts() {
    return _$retrieveContactsAsyncAction.run(() => super.retrieveContacts());
  }

  late final _$ContactsControllerBaseActionController =
      ActionController(name: 'ContactsControllerBase', context: context);

  @override
  dynamic handleSearchContactBar() {
    final _$actionInfo = _$ContactsControllerBaseActionController.startAction(
        name: 'ContactsControllerBase.handleSearchContactBar');
    try {
      return super.handleSearchContactBar();
    } finally {
      _$ContactsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
isSearchContact: ${isSearchContact},
contactsList: ${contactsList}
    ''';
  }
}
