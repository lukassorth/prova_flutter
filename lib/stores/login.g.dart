// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Login on _Login, Store {
  late final _$loadingAtom = Atom(name: '_Login.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$navigateForwardAsyncAction =
      AsyncAction('_Login.navigateForward', context: context);

  @override
  Future navigateForward({required dynamic context}) {
    return _$navigateForwardAsyncAction
        .run(() => super.navigateForward(context: context));
  }

  late final _$_LoginActionController =
      ActionController(name: '_Login', context: context);

  @override
  void updateLoading() {
    final _$actionInfo =
        _$_LoginActionController.startAction(name: '_Login.updateLoading');
    try {
      return super.updateLoading();
    } finally {
      _$_LoginActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
loading: ${loading}
    ''';
  }
}
