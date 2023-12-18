// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on HomeControllerBase, Store {
  late final _$statusAtom =
      Atom(name: 'HomeControllerBase.status', context: context);

  @override
  HomeStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(HomeStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$chatsStreamAtom =
      Atom(name: 'HomeControllerBase.chatsStream', context: context);

  @override
  ObservableStream<Iterable<QueryDocumentSnapshot<Map<String, dynamic>>>>?
      get chatsStream {
    _$chatsStreamAtom.reportRead();
    return super.chatsStream;
  }

  @override
  set chatsStream(
      ObservableStream<Iterable<QueryDocumentSnapshot<Map<String, dynamic>>>>?
          value) {
    _$chatsStreamAtom.reportWrite(value, super.chatsStream, () {
      super.chatsStream = value;
    });
  }

  late final _$defineCurrentUserAsyncAction =
      AsyncAction('HomeControllerBase.defineCurrentUser', context: context);

  @override
  Future defineCurrentUser(auth.User user) {
    return _$defineCurrentUserAsyncAction
        .run(() => super.defineCurrentUser(user));
  }

  late final _$findUserContactChatDataAsyncAction = AsyncAction(
      'HomeControllerBase.findUserContactChatData',
      context: context);

  @override
  Future<User?> findUserContactChatData(
      {required Chat chat, required String currentUserDocumentId}) {
    return _$findUserContactChatDataAsyncAction.run(() => super
        .findUserContactChatData(
            chat: chat, currentUserDocumentId: currentUserDocumentId));
  }

  late final _$findUserMessagesAsyncAction =
      AsyncAction('HomeControllerBase.findUserMessages', context: context);

  @override
  Future<Message?> findUserMessages({required Chat chat}) {
    return _$findUserMessagesAsyncAction
        .run(() => super.findUserMessages(chat: chat));
  }

  late final _$HomeControllerBaseActionController =
      ActionController(name: 'HomeControllerBase', context: context);

  @override
  dynamic retrieveCurrentUsersChat() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.retrieveCurrentUsersChat');
    try {
      return super.retrieveCurrentUsersChat();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeToSuccessfulStatus() {
    final _$actionInfo = _$HomeControllerBaseActionController.startAction(
        name: 'HomeControllerBase.changeToSuccessfulStatus');
    try {
      return super.changeToSuccessfulStatus();
    } finally {
      _$HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
chatsStream: ${chatsStream}
    ''';
  }
}
