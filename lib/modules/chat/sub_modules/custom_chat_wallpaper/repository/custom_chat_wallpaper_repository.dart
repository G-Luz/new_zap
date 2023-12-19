import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/models/chat/chat.dart';
import 'package:path/path.dart' as path;

part 'custom_chat_wallpaper_repository.g.dart';

class CustomChatWallpaperRepository = CustomChatWallpaperRepositoryBase
    with _$CustomChatWallpaperRepository;

abstract class CustomChatWallpaperRepositoryBase with Store {
  final chatsColletion = FirebaseFirestore.instance
      .collection(AppCollections.dummyCollection)
      .doc(AppCollections.appCollection)
      .collection(AppCollections.chatsCollection);

  final storage = FirebaseStorage.instance.ref(
    '${AppCollections.appCollection}/${AppCollections.chatsCollection}',
  );

  Future<Chat> updateChatWallpaper(Chat chat) async {
    await chatsColletion.doc(chat.documentId).update(chat.toJson());
    return chat;
  }

  Future<String> uploadChatBackgroundImageWallpaper({
    required Chat chat,
    required File chatBackgroundImage,
  }) async {
    File renamedFile;
    String newFileName = '${chat.documentId}.jpg';
    String newPath = path.join(
      path.dirname(chatBackgroundImage.path),
      newFileName,
    );

    renamedFile = await chatBackgroundImage.rename(newPath);

    final profileImageStoragePath =
        storage.child(path.basename(renamedFile.path));
    final uploaded = await profileImageStoragePath.putFile(renamedFile);
    return uploaded.ref.getDownloadURL();
  }
}
