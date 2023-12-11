import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/models/chat/chat.dart';

part 'chat_repository.g.dart';

class ChatRepository = ChatRepositoryBase with _$ChatRepository;

abstract class ChatRepositoryBase with Store {
  final chatsColletion = FirebaseFirestore.instance
      .collection(AppCollections.dummyCollection)
      .doc(AppCollections.appCollection)
      .collection(AppCollections.chatsCollection);

  createChatWithUsers() {
    final chat = Chat(
      backgroundColor: 0,
      blocked: false,
      stDocumentId: 'g8Whk5M9YosUBtIKUxNG',
      ndDocumentId: 'Utaf30gFa5roct4U7f5H',
      backgroundImageUrl: '',
    );

    chatsColletion.add(chat.toJson());
  }
}
