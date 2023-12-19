import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/models/chat/chat.dart';
import 'package:new_zap/models/user/user.dart';
import 'package:new_zap/modules/contacts/repository/contacts_repository.dart';
import 'package:new_zap/repositories/current_user/current_user_controller.dart';

part 'contacts_controller.g.dart';

enum ContactsStatus { initial, loading, success, failure }

class ContactsController = ContactsControllerBase with _$ContactsController;

abstract class ContactsControllerBase with Store {
  final chatsColletion = FirebaseFirestore.instance
      .collection(AppCollections.dummyCollection)
      .doc(AppCollections.appCollection)
      .collection(AppCollections.chatsCollection);

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

  Future<Chat?> createChatWithUsers({
    required String selectedContactDocumentId,
  }) async {
    print('SelectedContact: $selectedContactDocumentId');

    final currentUserIsFirstInChat = await chatsColletion
        .where('stDocumentId',
            isEqualTo: currentUserController.currentUser!.documentId)
        .get();

    final currentUserIsSecondInChat = await chatsColletion
        .where('ndDocumentId',
            isEqualTo: currentUserController.currentUser!.documentId)
        .get();

    if (currentUserIsFirstInChat.docs.isNotEmpty) {
      bool isCreateNewChatWithSecondUser = false;

      for (final chatDocs in currentUserIsFirstInChat.docs) {
        final chat = Chat.fromJson(chatDocs.data());

        final result = await retrieveChatRef(
          chat: chat,
          selectedContactDocId: selectedContactDocumentId,
        );

        if (result != null) {
          isCreateNewChatWithSecondUser = false;
          return result;
        } else {
          isCreateNewChatWithSecondUser = true;
        }
      }

      if (isCreateNewChatWithSecondUser) {
        return await createNewChat(
          user: currentUserController.currentUser!,
          selectedContactDocumentId: selectedContactDocumentId,
        );
      }
    }

    ///TODO: TESTAR DEPOIS COM O USUARIO LOGADO SENDO O DESTINARIO (SECOND DOC ID)
    if (currentUserIsSecondInChat.docs.isNotEmpty) {
      for (final chatDocs in currentUserIsSecondInChat.docs) {
        final chat = Chat.fromJson(chatDocs.data());
        final result = await retrieveChatRef(
          chat: chat,
          selectedContactDocId: selectedContactDocumentId,
        );
        if (result != null) {
          return result;
        } else {
          return null;
        }
      }
    }

    if (currentUserIsFirstInChat.docs.isEmpty &&
        currentUserIsSecondInChat.docs.isEmpty) {
      return await createNewChat(
        user: currentUserController.currentUser!,
        selectedContactDocumentId: selectedContactDocumentId,
      );
    }
    return null;
  }

  Future<Chat?> retrieveChatRef({
    required Chat chat,
    required String selectedContactDocId,
  }) async {
    if (chat.stDocumentId == selectedContactDocId) {
      final existChatBetweenSelectedUsers =
          chat.ndDocumentId == currentUserController.currentUser!.documentId &&
              chat.stDocumentId == selectedContactDocId;
      if (existChatBetweenSelectedUsers) {
        return chat;
      }
    }

    if (chat.ndDocumentId == selectedContactDocId) {
      final existChatBetweenSelectedUsers =
          chat.stDocumentId == currentUserController.currentUser!.documentId &&
              chat.ndDocumentId == selectedContactDocId;

      if (existChatBetweenSelectedUsers) {
        return chat;
      } else {
        return await createNewChat(
          user: currentUserController.currentUser!,
          selectedContactDocumentId: selectedContactDocId,
        );
      }
    }
    return null;
  }

  Future<Chat> createNewChat({
    required User user,
    required String selectedContactDocumentId,
  }) async {
    var chat = Chat(
      backgroundColor: 0,
      blocked: false,
      stDocumentId: currentUserController.currentUser!.documentId,
      ndDocumentId: selectedContactDocumentId,
      lastMessageSent: DateTime.now(),
      backgroundImageUrl: '',
    );
    final chatRef = await chatsColletion.add(chat.toJson());

    chat = chat.copyWith(documentId: chatRef.id);
    await chatsColletion.doc(chatRef.id).update(chat.toJson());
    return chat;
  }
}
