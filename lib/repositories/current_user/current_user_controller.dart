import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/models/user/user.dart';
import 'package:mobx/mobx.dart';

part 'current_user_controller.g.dart';

class CurrentUserController = CurrentUserControllerBase
    with _$CurrentUserController;

abstract class CurrentUserControllerBase with Store {
  final _userCollectionRef = FirebaseFirestore.instance
      .collection(AppCollections.dummyCollection)
      .doc(AppCollections.appCollection)
      .collection(AppCollections.usersCollection);

  @observable
  User? currentUser;

  @action
  defineCurrentUser(auth.User authUser) async {
    final user = await _userCollectionRef
        .where('email', isEqualTo: authUser.email)
        .limit(1)
        .get();

    currentUser ??= User.fromJson(user.docs.first.data());

    currentUser =
        currentUser!.copyWith(documentId: user.docs.first.reference.id);
  }
}
