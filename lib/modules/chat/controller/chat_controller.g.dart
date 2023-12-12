// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ChatController on ChatControllerBase, Store {
  late final _$statusAtom =
      Atom(name: 'ChatControllerBase.status', context: context);

  @override
  ChatStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(ChatStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$chatAtom =
      Atom(name: 'ChatControllerBase.chat', context: context);

  @override
  Chat? get chat {
    _$chatAtom.reportRead();
    return super.chat;
  }

  @override
  set chat(Chat? value) {
    _$chatAtom.reportWrite(value, super.chat, () {
      super.chat = value;
    });
  }

  late final _$recipientUserAtom =
      Atom(name: 'ChatControllerBase.recipientUser', context: context);

  @override
  User? get recipientUser {
    _$recipientUserAtom.reportRead();
    return super.recipientUser;
  }

  @override
  set recipientUser(User? value) {
    _$recipientUserAtom.reportWrite(value, super.recipientUser, () {
      super.recipientUser = value;
    });
  }

  late final _$textMessageControllerAtom =
      Atom(name: 'ChatControllerBase.textMessageController', context: context);

  @override
  TextEditingController get textMessageController {
    _$textMessageControllerAtom.reportRead();
    return super.textMessageController;
  }

  @override
  set textMessageController(TextEditingController value) {
    _$textMessageControllerAtom.reportWrite(value, super.textMessageController,
        () {
      super.textMessageController = value;
    });
  }

  late final _$messagesStreamAtom =
      Atom(name: 'ChatControllerBase.messagesStream', context: context);

  @override
  ObservableStream<QuerySnapshot<Object?>>? get messagesStream {
    _$messagesStreamAtom.reportRead();
    return super.messagesStream;
  }

  @override
  set messagesStream(ObservableStream<QuerySnapshot<Object?>>? value) {
    _$messagesStreamAtom.reportWrite(value, super.messagesStream, () {
      super.messagesStream = value;
    });
  }

  late final _$defineRecipientChatUserAsyncAction = AsyncAction(
      'ChatControllerBase.defineRecipientChatUser',
      context: context);

  @override
  Future defineRecipientChatUser() {
    return _$defineRecipientChatUserAsyncAction
        .run(() => super.defineRecipientChatUser());
  }

  late final _$sendNewMessageAsyncAction =
      AsyncAction('ChatControllerBase.sendNewMessage', context: context);

  @override
  Future sendNewMessage() {
    return _$sendNewMessageAsyncAction.run(() => super.sendNewMessage());
  }

  late final _$ChatControllerBaseActionController =
      ActionController(name: 'ChatControllerBase', context: context);

  @override
  dynamic onUpdateChatRef(Chat chat) {
    final _$actionInfo = _$ChatControllerBaseActionController.startAction(
        name: 'ChatControllerBase.onUpdateChatRef');
    try {
      return super.onUpdateChatRef(chat);
    } finally {
      _$ChatControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
chat: ${chat},
recipientUser: ${recipientUser},
textMessageController: ${textMessageController},
messagesStream: ${messagesStream}
    ''';
  }
}
