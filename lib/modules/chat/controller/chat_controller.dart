import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/models/chat/chat.dart';
import 'package:new_zap/models/user/user.dart';
import 'package:new_zap/modules/chat/repository/chat_repository.dart';
import 'package:new_zap/repositories/current_user/current_user_controller.dart';

part 'chat_controller.g.dart';

enum ChatStatus { initial, loading, success, failure }

class ChatController = ChatControllerBase with _$ChatController;

abstract class ChatControllerBase with Store {
  final currentUserController = Modular.get<CurrentUserController>();
  final _repository = Modular.get<ChatRepository>();
  final chatsColletion = FirebaseFirestore.instance
      .collection(AppCollections.appCollection)
      .doc(AppCollections.appCollection)
      .collection(AppCollections.chatsCollection);

  @observable
  ChatStatus status = ChatStatus.initial;

  @observable
  Chat? chat;

  @observable
  User? recipientUser;

  @observable
  TextEditingController textMessageController = TextEditingController();

  @observable
  ObservableStream<QuerySnapshot>? messagesStream;

  @action
  onUpdateChatRef(Chat chat) {
    this.chat = chat;
  }

  @action
  defineRecipientChatUser() async {
    status = ChatStatus.loading;

    if (chat != null) {
      if (chat!.stDocumentId == currentUserController.currentUser!.documentId) {
        recipientUser = await _repository.retrieveRecipientUser(
          recipientDocumentId: chat!.ndDocumentId!,
        );
      } else {
        recipientUser = await _repository.retrieveRecipientUser(
          recipientDocumentId: chat!.stDocumentId!,
        );
      }

      messagesStream = ObservableStream<QuerySnapshot>(
          _repository.retrieveChatMessages(chatRef: chat!.documentId!));

      status = ChatStatus.success;
    }
  }

  @action
  sendNewMessage() async {
    if (textMessageController.text.isNotEmpty) {
      await _repository.sendMessage(
        chatRef: chat!.documentId!,
        messageText: textMessageController.text,
        sendByUserDocumentId: currentUserController.currentUser!.documentId!,
      );
      textMessageController.clear();
    }
  }
}
