import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/models/chat/chat.dart';
import 'package:new_zap/models/user/user.dart';
import 'package:new_zap/modules/chat/sub_modules/custom_chat_wallpaper/repository/custom_chat_wallpaper_repository.dart';

part 'custom_chat_wallpaper_controller.g.dart';

enum CustomWallpaperStatus { initial, loading, success, failure }

class CustomChatWallpaperController = CustomChatWallpaperControllerBase
    with _$CustomChatWallpaperController;

abstract class CustomChatWallpaperControllerBase with Store {
  final _repository = Modular.get<CustomChatWallpaperRepository>();

  @observable
  CustomWallpaperStatus status = CustomWallpaperStatus.initial;

  @observable
  Chat? chat;

  @observable
  User? contactUser;

  @observable
  Color? tempSelectedBackgroundColor;

  @observable
  Color? selectedBackgroundColor;

  @observable
  String? selectedBackgroundImagePath;

  @observable
  String? selectedBackgroundImageUrl;

  @action
  changeChatBackgroundColor(Color selectedColor) {
    tempSelectedBackgroundColor = selectedColor;
  }

  @action
  selectedChatBackgroundColor() {
    selectedBackgroundColor = tempSelectedBackgroundColor;
    selectedBackgroundImagePath = null;
    selectedBackgroundImageUrl = null;
  }

  @action
  changeChatBackgroundImage(String selectedImage) {
    selectedBackgroundImagePath = selectedImage;
    selectedBackgroundColor = null;
    selectedBackgroundImageUrl = null;
  }

  @action
  updateObjectsReferences({
    required Chat chat,
    required User user,
  }) {
    status = CustomWallpaperStatus.loading;

    this.chat = chat;
    contactUser = user;

    if (chat.backgroundImageUrl != null &&
        chat.backgroundImageUrl!.isNotEmpty) {
      selectedBackgroundImageUrl = chat.backgroundImageUrl;
    }

    if (chat.backgroundColor != null && chat.backgroundColor != 0) {
      selectedBackgroundColor = Color(chat.backgroundColor!);
    }

    status = CustomWallpaperStatus.success;
  }

  @action
  Future<Chat> onSubmittedChatCustomWallpaper(Chat chat) async {
    String imageUrl = '';

    if (selectedBackgroundImagePath != null) {
      imageUrl = await _repository.uploadChatBackgroundImageWallpaper(
        chat: chat,
        chatBackgroundImage: File(selectedBackgroundImagePath!),
      );
      if (imageUrl.isNotEmpty) {
        chat = chat.copyWith(
          backgroundImageUrl: imageUrl,
          backgroundColor: 0,
        );
      }
    }

    if (selectedBackgroundColor != null) {
      chat = chat.copyWith(
        backgroundColor: selectedBackgroundColor!.value,
        backgroundImageUrl: '',
      );
    }

    return await _repository.updateChatWallpaper(chat);
  }
}
