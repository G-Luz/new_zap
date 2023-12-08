// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrentUserController on CurrentUserControllerBase, Store {
  late final _$currentUserAtom =
      Atom(name: 'CurrentUserControllerBase.currentUser', context: context);

  @override
  User? get currentUser {
    _$currentUserAtom.reportRead();
    return super.currentUser;
  }

  @override
  set currentUser(User? value) {
    _$currentUserAtom.reportWrite(value, super.currentUser, () {
      super.currentUser = value;
    });
  }

  late final _$defineCurrentUserAsyncAction = AsyncAction(
      'CurrentUserControllerBase.defineCurrentUser',
      context: context);

  @override
  Future defineCurrentUser(auth.User authUser) {
    return _$defineCurrentUserAsyncAction
        .run(() => super.defineCurrentUser(authUser));
  }

  @override
  String toString() {
    return '''
currentUser: ${currentUser}
    ''';
  }
}
