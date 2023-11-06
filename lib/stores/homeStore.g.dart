// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'homeStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeStore on _HomeStore, Store {
  late final _$listAtom = Atom(name: '_HomeStore.list', context: context);

  @override
  List<Item> get list {
    _$listAtom.reportRead();
    return super.list;
  }

  @override
  set list(List<Item> value) {
    _$listAtom.reportWrite(value, super.list, () {
      super.list = value;
    });
  }

  late final _$addAsyncAction = AsyncAction('_HomeStore.add', context: context);

  @override
  Future add({required Item item}) {
    return _$addAsyncAction.run(() => super.add(item: item));
  }

  late final _$getListItemsAsyncAction =
      AsyncAction('_HomeStore.getListItems', context: context);

  @override
  Future getListItems() {
    return _$getListItemsAsyncAction.run(() => super.getListItems());
  }

  late final _$_removeCachedListItemsAsyncAction =
      AsyncAction('_HomeStore._removeCachedListItems', context: context);

  @override
  Future _removeCachedListItems() {
    return _$_removeCachedListItemsAsyncAction
        .run(() => super._removeCachedListItems());
  }

  late final _$_HomeStoreActionController =
      ActionController(name: '_HomeStore', context: context);

  @override
  dynamic updateFromList(Item item) {
    final _$actionInfo = _$_HomeStoreActionController.startAction(
        name: '_HomeStore.updateFromList');
    try {
      return super.updateFromList(item);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic removeItem(int index) {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore.removeItem');
    try {
      return super.removeItem(index);
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic _saveList() {
    final _$actionInfo =
        _$_HomeStoreActionController.startAction(name: '_HomeStore._saveList');
    try {
      return super._saveList();
    } finally {
      _$_HomeStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
list: ${list}
    ''';
  }
}
