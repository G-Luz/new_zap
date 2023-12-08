import 'package:mobx/mobx.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:new_zap/models/user/user.dart' as model;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:new_zap/constants/app_collection.dart';

part 'welcome_repository.g.dart';

class WelcomeRepository = WelcomeRepositoryBase with _$WelcomeRepository;

abstract class WelcomeRepositoryBase with Store {
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance
      .collection(AppCollections.dummyCollection)
      .doc(AppCollections.appCollection);

  Future<dynamic> userSignin(String email, String password) async {
    try {
      await auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          return 'Usuário de email não encontrado.';
      }
      return '';
    }
  }

  Future<User?> isLoggedin() async {
    if (auth.currentUser != null) {
      return auth.currentUser;
    }
    return null;
  }

  Future<UserCredential?> createUserAuthenticationByEmailAndPassword(
    model.User user,
    String password,
  ) async {
    try {
      final authResult = await auth.createUserWithEmailAndPassword(
        email: user.email!,
        password: password,
      );

      await createUserDocument(user);

      return authResult;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use:':
          return null;
      }
      return null;
    }
  }

  Future<void> createUserDocument(model.User user) async {
    await firestore
        .collection(AppCollections.usersCollection)
        .add(user.toJson());
  }
}
