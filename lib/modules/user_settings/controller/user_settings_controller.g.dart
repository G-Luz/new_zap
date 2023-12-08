// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_settings_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserSettingsController on UserSettingsControllerBase, Store {
  late final _$selectedImageAtom =
      Atom(name: 'UserSettingsControllerBase.selectedImage', context: context);

  @override
  File? get selectedImage {
    _$selectedImageAtom.reportRead();
    return super.selectedImage;
  }

  @override
  set selectedImage(File? value) {
    _$selectedImageAtom.reportWrite(value, super.selectedImage, () {
      super.selectedImage = value;
    });
  }

  late final _$userSettingsStatusAtom = Atom(
      name: 'UserSettingsControllerBase.userSettingsStatus', context: context);

  @override
  UserSettingsStatus get userSettingsStatus {
    _$userSettingsStatusAtom.reportRead();
    return super.userSettingsStatus;
  }

  @override
  set userSettingsStatus(UserSettingsStatus value) {
    _$userSettingsStatusAtom.reportWrite(value, super.userSettingsStatus, () {
      super.userSettingsStatus = value;
    });
  }

  late final _$updateNameAtom =
      Atom(name: 'UserSettingsControllerBase.updateName', context: context);

  @override
  String get updateName {
    _$updateNameAtom.reportRead();
    return super.updateName;
  }

  @override
  set updateName(String value) {
    _$updateNameAtom.reportWrite(value, super.updateName, () {
      super.updateName = value;
    });
  }

  late final _$updateAgeAtom =
      Atom(name: 'UserSettingsControllerBase.updateAge', context: context);

  @override
  String get updateAge {
    _$updateAgeAtom.reportRead();
    return super.updateAge;
  }

  @override
  set updateAge(String value) {
    _$updateAgeAtom.reportWrite(value, super.updateAge, () {
      super.updateAge = value;
    });
  }

  late final _$updatedUserAtom =
      Atom(name: 'UserSettingsControllerBase.updatedUser', context: context);

  @override
  User? get updatedUser {
    _$updatedUserAtom.reportRead();
    return super.updatedUser;
  }

  @override
  set updatedUser(User? value) {
    _$updatedUserAtom.reportWrite(value, super.updatedUser, () {
      super.updatedUser = value;
    });
  }

  late final _$onSubmittedUpdateUserDataAsyncAction = AsyncAction(
      'UserSettingsControllerBase.onSubmittedUpdateUserData',
      context: context);

  @override
  Future onSubmittedUpdateUserData() {
    return _$onSubmittedUpdateUserDataAsyncAction
        .run(() => super.onSubmittedUpdateUserData());
  }

  late final _$UserSettingsControllerBaseActionController =
      ActionController(name: 'UserSettingsControllerBase', context: context);

  @override
  dynamic changeProfileImage(String selectedImagePath) {
    final _$actionInfo = _$UserSettingsControllerBaseActionController
        .startAction(name: 'UserSettingsControllerBase.changeProfileImage');
    try {
      return super.changeProfileImage(selectedImagePath);
    } finally {
      _$UserSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onNameChanged(String name) {
    final _$actionInfo = _$UserSettingsControllerBaseActionController
        .startAction(name: 'UserSettingsControllerBase.onNameChanged');
    try {
      return super.onNameChanged(name);
    } finally {
      _$UserSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onAgeChanged(String age) {
    final _$actionInfo = _$UserSettingsControllerBaseActionController
        .startAction(name: 'UserSettingsControllerBase.onAgeChanged');
    try {
      return super.onAgeChanged(age);
    } finally {
      _$UserSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic fillEditingFields() {
    final _$actionInfo = _$UserSettingsControllerBaseActionController
        .startAction(name: 'UserSettingsControllerBase.fillEditingFields');
    try {
      return super.fillEditingFields();
    } finally {
      _$UserSettingsControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedImage: ${selectedImage},
userSettingsStatus: ${userSettingsStatus},
updateName: ${updateName},
updateAge: ${updateAge},
updatedUser: ${updatedUser}
    ''';
  }
}
