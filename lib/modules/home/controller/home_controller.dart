import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/models/chat/chat.dart';
import 'package:new_zap/models/chat/message/message.dart';
import 'package:new_zap/models/user/user.dart';
import 'package:new_zap/modules/home/repository/home_repository.dart';
import 'package:new_zap/repositories/current_user/current_user_controller.dart';

part 'home_controller.g.dart';

enum HomeStatus { initial, loading, success, failure }

class HomeController = HomeControllerBase with _$HomeController;

abstract class HomeControllerBase with Store {
  final currentUser = Modular.get<CurrentUserController>();
  final _repository = Modular.get<HomeRepository>();

  @observable
  HomeStatus status = HomeStatus.initial;

  @observable
  ObservableStream<Iterable<QueryDocumentSnapshot<Map<String, dynamic>>>>?
      chatsStream;

  @action
  defineCurrentUser(auth.User user) async {
    status = HomeStatus.loading;
    await currentUser.defineCurrentUser(user);
    retrieveCurrentUsersChat();
    status = HomeStatus.success;
  }

  @action
  retrieveCurrentUsersChat() {
    chatsStream = ObservableStream(_repository.retrieveAllCurrentUserChats(
      userDocumentId: currentUser.currentUser!.documentId!,
    ));
  }

  @action
  Future<User?> findUserContactChatData({
    required Chat chat,
    required String currentUserDocumentId,
  }) async {
    if (currentUserDocumentId == chat.stDocumentId) {
      return await _repository.findUserChatByDocumentId(
          userDocumentId: chat.ndDocumentId!);
    }
    if (currentUserDocumentId == chat.ndDocumentId) {
      return await _repository.findUserChatByDocumentId(
          userDocumentId: chat.stDocumentId!);
    }
    return null;
  }

  @action
  Future<Message?> findUserMessages({
    required Chat chat,
  }) async {
    final message =
        await _repository.findUserMessages(chatDocumentId: chat.documentId!);

    if (message != null) {
      return message;
    }

    return null;
  }

  @action
  changeToSuccessfulStatus() {
    status = HomeStatus.success;
  }
}
