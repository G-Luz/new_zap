// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_theme_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppThemeController on AppThemeControllerBase, Store {
  late final _$isDarkThemeAtom =
      Atom(name: 'AppThemeControllerBase.isDarkTheme', context: context);

  @override
  bool get isDarkTheme {
    _$isDarkThemeAtom.reportRead();
    return super.isDarkTheme;
  }

  @override
  set isDarkTheme(bool value) {
    _$isDarkThemeAtom.reportWrite(value, super.isDarkTheme, () {
      super.isDarkTheme = value;
    });
  }

  late final _$AppThemeControllerBaseActionController =
      ActionController(name: 'AppThemeControllerBase', context: context);

  @override
  dynamic changeTheme() {
    final _$actionInfo = _$AppThemeControllerBaseActionController.startAction(
        name: 'AppThemeControllerBase.changeTheme');
    try {
      return super.changeTheme();
    } finally {
      _$AppThemeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isDarkTheme: ${isDarkTheme}
    ''';
  }
}
