import 'dart:io';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:new_zap/constants/app_collection.dart';
import 'package:new_zap/models/user/user.dart';
import 'package:new_zap/modules/user_settings/repository/user_settings_repository.dart';
import 'package:new_zap/repositories/current_user/current_user_controller.dart';
import 'package:new_zap/repositories/local_storage/local_storage_controller.dart';
import 'package:new_zap/repositories/theme/app_theme_controller.dart';

part 'user_settings_controller.g.dart';

enum UserSettingsStatus { initial, loading, success, failure }

class UserSettingsController = UserSettingsControllerBase
    with _$UserSettingsController;

abstract class UserSettingsControllerBase with Store {
  final currentUserController = Modular.get<CurrentUserController>();
  final localStorageController = Modular.get<LocalStorageController>();
  final _repository = Modular.get<UserSettingsRepository>();
  final theme = Modular.get<AppThemeController>();

  @observable
  File? selectedImage;

  @observable
  UserSettingsStatus userSettingsStatus = UserSettingsStatus.initial;

  @observable
  String updateName = '';

  @observable
  String updateAge = '';

  @observable
  User? updatedUser;

  @action
  changeProfileImage(String selectedImagePath) {
    selectedImage = File(selectedImagePath);
  }

  @action
  onNameChanged(String name) {
    updateName = name;
  }

  @action
  onAgeChanged(String age) {
    updateAge = age;
  }

  @action
  fillEditingFields() {
    updateName = currentUserController.currentUser!.name;
    updateAge = currentUserController.currentUser!.age ?? '';
  }

  @action
  onSubmittedUpdateUserData() async {
    userSettingsStatus = UserSettingsStatus.loading;

    String? imageUrl;
    if (selectedImage != null) {
      imageUrl = await _repository.uploadUserProfileImage(
        selectedImage!,
        currentUserController.currentUser!.documentId!,
      );
    }

    if (updateName.isNotEmpty || updateAge.isNotEmpty) {
      currentUserController.currentUser =
          currentUserController.currentUser!.copyWith(
        name: updateName,
        age: updateAge,
        profileUrlImage: imageUrl,
      );

      await _repository
          .updateUserDataDocument(currentUserController.currentUser!);

      userSettingsStatus = UserSettingsStatus.success;
    }
  }

  @action
  changeTheme() {
    theme.changeTheme();
    localStorageController.setBoolValue(
      AppCollections.themeKey,
      theme.isDarkTheme ? true : false,
    );
  }
}
