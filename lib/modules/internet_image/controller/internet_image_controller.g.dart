// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'internet_image_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InternetImageController on InternetImageControllerBase, Store {
  late final _$statusAtom =
      Atom(name: 'InternetImageControllerBase.status', context: context);

  @override
  InternetImageStatus get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(InternetImageStatus value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$imageListAtom =
      Atom(name: 'InternetImageControllerBase.imageList', context: context);

  @override
  ObservableList<InternetImage> get imageList {
    _$imageListAtom.reportRead();
    return super.imageList;
  }

  @override
  set imageList(ObservableList<InternetImage> value) {
    _$imageListAtom.reportWrite(value, super.imageList, () {
      super.imageList = value;
    });
  }

  late final _$searchNetworkImageAsyncAction = AsyncAction(
      'InternetImageControllerBase.searchNetworkImage',
      context: context);

  @override
  Future searchNetworkImage(String filter) {
    return _$searchNetworkImageAsyncAction
        .run(() => super.searchNetworkImage(filter));
  }

  @override
  String toString() {
    return '''
status: ${status},
imageList: ${imageList}
    ''';
  }
}
