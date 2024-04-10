// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeController on _HomeControllerBase, Store {
  late final _$listItemsAtom =
      Atom(name: '_HomeControllerBase.listItems', context: context);

  @override
  List<HomeEntity> get listItems {
    _$listItemsAtom.reportRead();
    return super.listItems;
  }

  @override
  set listItems(List<HomeEntity> value) {
    _$listItemsAtom.reportWrite(value, super.listItems, () {
      super.listItems = value;
    });
  }

  late final _$listItemsCompletedAtom =
      Atom(name: '_HomeControllerBase.listItemsCompleted', context: context);

  @override
  List<HomeEntity> get listItemsCompleted {
    _$listItemsCompletedAtom.reportRead();
    return super.listItemsCompleted;
  }

  @override
  set listItemsCompleted(List<HomeEntity> value) {
    _$listItemsCompletedAtom.reportWrite(value, super.listItemsCompleted, () {
      super.listItemsCompleted = value;
    });
  }

  late final _$isActivityItemsCompletedAtom = Atom(
      name: '_HomeControllerBase.isActivityItemsCompleted', context: context);

  @override
  bool get isActivityItemsCompleted {
    _$isActivityItemsCompletedAtom.reportRead();
    return super.isActivityItemsCompleted;
  }

  @override
  set isActivityItemsCompleted(bool value) {
    _$isActivityItemsCompletedAtom
        .reportWrite(value, super.isActivityItemsCompleted, () {
      super.isActivityItemsCompleted = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_HomeControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$getAllListAsyncAction =
      AsyncAction('_HomeControllerBase.getAllList', context: context);

  @override
  Future<void> getAllList() {
    return _$getAllListAsyncAction.run(() => super.getAllList());
  }

  late final _$getAllCompletedAsyncAction =
      AsyncAction('_HomeControllerBase.getAllCompleted', context: context);

  @override
  Future<void> getAllCompleted() {
    return _$getAllCompletedAsyncAction.run(() => super.getAllCompleted());
  }

  late final _$getListByIdAsyncAction =
      AsyncAction('_HomeControllerBase.getListById', context: context);

  @override
  Future<void> getListById({required int id}) {
    return _$getListByIdAsyncAction.run(() => super.getListById(id: id));
  }

  late final _$completTaskAsyncAction =
      AsyncAction('_HomeControllerBase.completTask', context: context);

  @override
  Future<void> completTask({required int id}) {
    return _$completTaskAsyncAction.run(() => super.completTask(id: id));
  }

  late final _$setIsActivityItemsCompletedAsyncAction = AsyncAction(
      '_HomeControllerBase.setIsActivityItemsCompleted',
      context: context);

  @override
  Future<void> setIsActivityItemsCompleted() {
    return _$setIsActivityItemsCompletedAsyncAction
        .run(() => super.setIsActivityItemsCompleted());
  }

  @override
  String toString() {
    return '''
listItems: ${listItems},
listItemsCompleted: ${listItemsCompleted},
isActivityItemsCompleted: ${isActivityItemsCompleted},
isLoading: ${isLoading}
    ''';
  }
}
