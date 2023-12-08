import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/models/user/user.dart';

part 'contacts_repository.g.dart';

class ContactsRepository = ContactsRepositoryBase with _$ContactsRepository;

abstract class ContactsRepositoryBase with Store {
  final firestore = FirebaseFirestore.instance
      .collection(AppCollections.dummyCollection)
      .doc(AppCollections.appCollection)
      .collection(AppCollections.usersCollection)
      .orderBy(
        'name',
      );

  Future<List<User>> findAllContacts() async {
    final userList = <User>[];
    final query = await firestore.get();

    for (final contactDocument in query.docs) {
      final user = User.fromJson(contactDocument.data());
      userList.add(user);
    }
    return userList;
  }
}
