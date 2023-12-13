import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/constants/app_collection.dart';

part 'home_repository.g.dart';

class HomeRepository = HomeRepositoryBase with _$HomeRepository;

abstract class HomeRepositoryBase with Store {
  final chatsColletion = FirebaseFirestore.instance
      .collection(AppCollections.dummyCollection)
      .doc(AppCollections.appCollection)
      .collection(AppCollections.chatsCollection);

  retrieveAllCurrentUserChats({required String userDocumentId}) async {
    print('qual o doc id: ${userDocumentId}');

    final queryResult = await chatsColletion
        .where('stDocumentId', isEqualTo: userDocumentId)
        .where('ndDocumentId', isEqualTo: userDocumentId)
        .get();

    print('eae tem né: ${queryResult.docs.length}');

    final snapshots = chatsColletion.snapshots().map(
          (snapshot) => snapshot.docs.where((doc) =>
              doc['stDocumentId'] == userDocumentId ||
              doc['ndDocumentId'] == userDocumentId),
        );

    final opa = (await snapshots.first).toList();

    print('PORRA DE SNAP ${(opa.length)}');

    // return (await snapshots.first).toList();
  }
}
