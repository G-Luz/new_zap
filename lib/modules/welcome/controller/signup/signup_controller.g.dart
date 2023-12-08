// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SignupController on SignupControllerBase, Store {
  late final _$signupStatusAtom =
      Atom(name: 'SignupControllerBase.signupStatus', context: context);

  @override
  SignupFormStatus get signupStatus {
    _$signupStatusAtom.reportRead();
    return super.signupStatus;
  }

  @override
  set signupStatus(SignupFormStatus value) {
    _$signupStatusAtom.reportWrite(value, super.signupStatus, () {
      super.signupStatus = value;
    });
  }

  late final _$showLoadingAtom =
      Atom(name: 'SignupControllerBase.showLoading', context: context);

  @override
  bool get showLoading {
    _$showLoadingAtom.reportRead();
    return super.showLoading;
  }

  @override
  set showLoading(bool value) {
    _$showLoadingAtom.reportWrite(value, super.showLoading, () {
      super.showLoading = value;
    });
  }

  late final _$showConfettiEffectAtom =
      Atom(name: 'SignupControllerBase.showConfettiEffect', context: context);

  @override
  bool get showConfettiEffect {
    _$showConfettiEffectAtom.reportRead();
    return super.showConfettiEffect;
  }

  @override
  set showConfettiEffect(bool value) {
    _$showConfettiEffectAtom.reportWrite(value, super.showConfettiEffect, () {
      super.showConfettiEffect = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'SignupControllerBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'SignupControllerBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$ageAtom =
      Atom(name: 'SignupControllerBase.age', context: context);

  @override
  String get age {
    _$ageAtom.reportRead();
    return super.age;
  }

  @override
  set age(String value) {
    _$ageAtom.reportWrite(value, super.age, () {
      super.age = value;
    });
  }

  late final _$passwordAtom =
      Atom(name: 'SignupControllerBase.password', context: context);

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$repeatPasswordAtom =
      Atom(name: 'SignupControllerBase.repeatPassword', context: context);

  @override
  String get repeatPassword {
    _$repeatPasswordAtom.reportRead();
    return super.repeatPassword;
  }

  @override
  set repeatPassword(String value) {
    _$repeatPasswordAtom.reportWrite(value, super.repeatPassword, () {
      super.repeatPassword = value;
    });
  }

  late final _$onRegisterUserAsyncAction =
      AsyncAction('SignupControllerBase.onRegisterUser', context: context);

  @override
  Future<String> onRegisterUser() {
    return _$onRegisterUserAsyncAction.run(() => super.onRegisterUser());
  }

  late final _$SignupControllerBaseActionController =
      ActionController(name: 'SignupControllerBase', context: context);

  @override
  dynamic onNameChanged(String name) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onNameChanged');
    try {
      return super.onNameChanged(name);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onEmailChanged(String email) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onEmailChanged');
    try {
      return super.onEmailChanged(email);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onAgeChanged(String age) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onAgeChanged');
    try {
      return super.onAgeChanged(age);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPasswordChanged(String password) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onPasswordChanged');
    try {
      return super.onPasswordChanged(password);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onRepeatPasswordChanged(String repeatPass) {
    final _$actionInfo = _$SignupControllerBaseActionController.startAction(
        name: 'SignupControllerBase.onRepeatPasswordChanged');
    try {
      return super.onRepeatPasswordChanged(repeatPass);
    } finally {
      _$SignupControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
signupStatus: ${signupStatus},
showLoading: ${showLoading},
showConfettiEffect: ${showConfettiEffect},
name: ${name},
email: ${email},
age: ${age},
password: ${password},
repeatPassword: ${repeatPassword}
    ''';
  }
}
