// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'custom_chat_wallpaper_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CustomChatWallpaperController
    on CustomChatWallpaperControllerBase, Store {
  late final _$statusAtom =
      Atom(name: 'CustomChatWallpaperControllerBase.status', context: context);

  @override
  CustomWallpaperStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(CustomWallpaperStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$chatAtom =
      Atom(name: 'CustomChatWallpaperControllerBase.chat', context: context);

  @override
  Chat? get chat {
    _$chatAtom.reportRead();
    return super.chat;
  }

  @override
  set chat(Chat? value) {
    _$chatAtom.reportWrite(value, super.chat, () {
      super.chat = value;
    });
  }

  late final _$contactUserAtom = Atom(
      name: 'CustomChatWallpaperControllerBase.contactUser', context: context);

  @override
  User? get contactUser {
    _$contactUserAtom.reportRead();
    return super.contactUser;
  }

  @override
  set contactUser(User? value) {
    _$contactUserAtom.reportWrite(value, super.contactUser, () {
      super.contactUser = value;
    });
  }

  late final _$tempSelectedBackgroundColorAtom = Atom(
      name: 'CustomChatWallpaperControllerBase.tempSelectedBackgroundColor',
      context: context);

  @override
  Color? get tempSelectedBackgroundColor {
    _$tempSelectedBackgroundColorAtom.reportRead();
    return super.tempSelectedBackgroundColor;
  }

  @override
  set tempSelectedBackgroundColor(Color? value) {
    _$tempSelectedBackgroundColorAtom
        .reportWrite(value, super.tempSelectedBackgroundColor, () {
      super.tempSelectedBackgroundColor = value;
    });
  }

  late final _$selectedBackgroundColorAtom = Atom(
      name: 'CustomChatWallpaperControllerBase.selectedBackgroundColor',
      context: context);

  @override
  Color? get selectedBackgroundColor {
    _$selectedBackgroundColorAtom.reportRead();
    return super.selectedBackgroundColor;
  }

  @override
  set selectedBackgroundColor(Color? value) {
    _$selectedBackgroundColorAtom
        .reportWrite(value, super.selectedBackgroundColor, () {
      super.selectedBackgroundColor = value;
    });
  }

  late final _$selectedBackgroundImagePathAtom = Atom(
      name: 'CustomChatWallpaperControllerBase.selectedBackgroundImagePath',
      context: context);

  @override
  String? get selectedBackgroundImagePath {
    _$selectedBackgroundImagePathAtom.reportRead();
    return super.selectedBackgroundImagePath;
  }

  @override
  set selectedBackgroundImagePath(String? value) {
    _$selectedBackgroundImagePathAtom
        .reportWrite(value, super.selectedBackgroundImagePath, () {
      super.selectedBackgroundImagePath = value;
    });
  }

  late final _$selectedBackgroundImageUrlAtom = Atom(
      name: 'CustomChatWallpaperControllerBase.selectedBackgroundImageUrl',
      context: context);

  @override
  String? get selectedBackgroundImageUrl {
    _$selectedBackgroundImageUrlAtom.reportRead();
    return super.selectedBackgroundImageUrl;
  }

  @override
  set selectedBackgroundImageUrl(String? value) {
    _$selectedBackgroundImageUrlAtom
        .reportWrite(value, super.selectedBackgroundImageUrl, () {
      super.selectedBackgroundImageUrl = value;
    });
  }

  late final _$onSubmittedChatCustomWallpaperAsyncAction = AsyncAction(
      'CustomChatWallpaperControllerBase.onSubmittedChatCustomWallpaper',
      context: context);

  @override
  Future<Chat> onSubmittedChatCustomWallpaper(Chat chat) {
    return _$onSubmittedChatCustomWallpaperAsyncAction
        .run(() => super.onSubmittedChatCustomWallpaper(chat));
  }

  late final _$CustomChatWallpaperControllerBaseActionController =
      ActionController(
          name: 'CustomChatWallpaperControllerBase', context: context);

  @override
  dynamic changeChatBackgroundColor(Color selectedColor) {
    final _$actionInfo =
        _$CustomChatWallpaperControllerBaseActionController.startAction(
            name:
                'CustomChatWallpaperControllerBase.changeChatBackgroundColor');
    try {
      return super.changeChatBackgroundColor(selectedColor);
    } finally {
      _$CustomChatWallpaperControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic selectedChatBackgroundColor() {
    final _$actionInfo =
        _$CustomChatWallpaperControllerBaseActionController.startAction(
            name:
                'CustomChatWallpaperControllerBase.selectedChatBackgroundColor');
    try {
      return super.selectedChatBackgroundColor();
    } finally {
      _$CustomChatWallpaperControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeChatBackgroundImage(String selectedImage) {
    final _$actionInfo =
        _$CustomChatWallpaperControllerBaseActionController.startAction(
            name:
                'CustomChatWallpaperControllerBase.changeChatBackgroundImage');
    try {
      return super.changeChatBackgroundImage(selectedImage);
    } finally {
      _$CustomChatWallpaperControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  dynamic updateObjectsReferences({required Chat chat, required User user}) {
    final _$actionInfo =
        _$CustomChatWallpaperControllerBaseActionController.startAction(
            name: 'CustomChatWallpaperControllerBase.updateObjectsReferences');
    try {
      return super.updateObjectsReferences(chat: chat, user: user);
    } finally {
      _$CustomChatWallpaperControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
status: ${status},
chat: ${chat},
contactUser: ${contactUser},
tempSelectedBackgroundColor: ${tempSelectedBackgroundColor},
selectedBackgroundColor: ${selectedBackgroundColor},
selectedBackgroundImagePath: ${selectedBackgroundImagePath},
selectedBackgroundImageUrl: ${selectedBackgroundImageUrl}
    ''';
  }
}
