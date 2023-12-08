// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginController on LoginControllerBase, Store {
  late final _$showLoadingAtom =
      Atom(name: 'LoginControllerBase.showLoading', context: context);

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
      Atom(name: 'LoginControllerBase.showConfettiEffect', context: context);

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

  late final _$loginStatusAtom =
      Atom(name: 'LoginControllerBase.loginStatus', context: context);

  @override
  LoginFormStatus get loginStatus {
    _$loginStatusAtom.reportRead();
    return super.loginStatus;
  }

  @override
  set loginStatus(LoginFormStatus value) {
    _$loginStatusAtom.reportWrite(value, super.loginStatus, () {
      super.loginStatus = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'LoginControllerBase.email', context: context);

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

  late final _$passwordAtom =
      Atom(name: 'LoginControllerBase.password', context: context);

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

  late final _$onSubmittedFormAsyncAction =
      AsyncAction('LoginControllerBase.onSubmittedForm', context: context);

  @override
  Future<dynamic> onSubmittedForm() {
    return _$onSubmittedFormAsyncAction.run(() => super.onSubmittedForm());
  }

  late final _$LoginControllerBaseActionController =
      ActionController(name: 'LoginControllerBase', context: context);

  @override
  dynamic onEmailChanged(String email) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.onEmailChanged');
    try {
      return super.onEmailChanged(email);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onPasswordChanged(String password) {
    final _$actionInfo = _$LoginControllerBaseActionController.startAction(
        name: 'LoginControllerBase.onPasswordChanged');
    try {
      return super.onPasswordChanged(password);
    } finally {
      _$LoginControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
showLoading: ${showLoading},
showConfettiEffect: ${showConfettiEffect},
loginStatus: ${loginStatus},
email: ${email},
password: ${password}
    ''';
  }
}
