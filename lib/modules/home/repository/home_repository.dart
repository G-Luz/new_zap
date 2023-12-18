import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/models/chat/message/message.dart';
import 'package:new_zap/models/user/user.dart';

part 'home_repository.g.dart';

class HomeRepository = HomeRepositoryBase with _$HomeRepository;

abstract class HomeRepositoryBase with Store {
  final chatsColletion = FirebaseFirestore.instance
      .collection(AppCollections.dummyCollection)
      .doc(AppCollections.appCollection)
      .collection(AppCollections.chatsCollection);

  final usersColletion = FirebaseFirestore.instance
      .collection(AppCollections.dummyCollection)
      .doc(AppCollections.appCollection)
      .collection(AppCollections.usersCollection);

  Stream<Iterable<QueryDocumentSnapshot<Map<String, dynamic>>>>
      retrieveAllCurrentUserChats({required String userDocumentId}) {
    return chatsColletion
        .orderBy(
          'lastMessageSent',
          descending: true,
        )
        .snapshots()
        .map(
          (snapshot) => snapshot.docs.where((doc) =>
              doc['stDocumentId'] == userDocumentId ||
              doc['ndDocumentId'] == userDocumentId),
        );
  }

  Future<User?> findUserChatByDocumentId({
    required String userDocumentId,
  }) async {
    final queryResult = await usersColletion
        .where('documentId', isEqualTo: userDocumentId)
        .limit(1)
        .get();

    if (queryResult.docs.isNotEmpty) {
      return User.fromJson(queryResult.docs.first.data());
    }
    return null;
  }

  Future<Message?> findUserMessages({
    required String chatDocumentId,
  }) async {
    final messagesRef = await chatsColletion
        .doc(chatDocumentId)
        .collection(AppCollections.messagesCollection);

    final queryResult =
        await messagesRef.orderBy('sendDate', descending: true).limit(1).get();

    if (queryResult.docs.isNotEmpty) {
      return Message.fromJson(queryResult.docs.first.data());
    }

    return null;
  }
}
