import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mobx/mobx.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/models/user/user.dart';
import 'package:path/path.dart' as path;

part 'user_settings_repository.g.dart';

class UserSettingsRepository = UserSettingsRepositoryBase
    with _$UserSettingsRepository;

abstract class UserSettingsRepositoryBase with Store {
  final storage = FirebaseStorage.instance.ref(
    '${AppCollections.appCollection}/${AppCollections.usersCollection}',
  );

  final firestore = FirebaseFirestore.instance
      .collection(AppCollections.dummyCollection)
      .doc(AppCollections.appCollection);

  Future<String> uploadUserProfileImage(
    File profileImage,
    String userDocumentId,
  ) async {
    File renamedFile;
    String newFileName = '$userDocumentId.jpg';
    String newPath = path.join(
      path.dirname(profileImage.path),
      newFileName,
    );
    renamedFile = await profileImage.rename(newPath);
    final profileImageStoragePath =
        storage.child(path.basename(renamedFile.path));
    final uploaded = await profileImageStoragePath.putFile(renamedFile);
    return uploaded.ref.getDownloadURL();
  }

  Future<void> updateUserDataDocument(User user) async {
    await firestore
        .collection(AppCollections.usersCollection)
        .doc(user.documentId)
        .update(
          user.toJson(),
        );
  }
}
