import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/models/chat/chat.dart';
import 'package:new_zap/models/chat/message/message.dart';
import 'package:new_zap/models/user/user.dart';

part 'chat_repository.g.dart';

class ChatRepository = ChatRepositoryBase with _$ChatRepository;

abstract class ChatRepositoryBase with Store {
  final chatsColletion = FirebaseFirestore.instance
      .collection(AppCollections.dummyCollection)
      .doc(AppCollections.appCollection)
      .collection(AppCollections.chatsCollection);

  final usersCollectionRef = FirebaseFirestore.instance
      .collection(AppCollections.dummyCollection)
      .doc(AppCollections.appCollection)
      .collection(AppCollections.usersCollection);

  Future<User> retrieveRecipientUser({
    required String recipientDocumentId,
  }) async {
    final queryResult = await usersCollectionRef
        .where(
          'documentId',
          isEqualTo: recipientDocumentId,
        )
        .limit(1)
        .get();

    return User.fromJson(queryResult.docs.first.data());
  }

  Stream<QuerySnapshot> retrieveChatMessages({
    required String chatRef,
  }) {
    return chatsColletion
        .doc(chatRef)
        .collection(AppCollections.messagesCollection)
        .orderBy('sendDate', descending: true)
        .snapshots();
  }

  Future sendMessage({
    required String chatRef,
    required String messageText,
    required String sendByUserDocumentId,
  }) async {
    final messageRef = chatsColletion
        .doc(chatRef)
        .collection(AppCollections.messagesCollection);

    final message = Message(
      content: messageText,
      sendyByUserDocumentId: sendByUserDocumentId,
      viewed: false,
      sendDate: DateTime.now(),
    );

    await messageRef.add(message.toJson());
  }
}
