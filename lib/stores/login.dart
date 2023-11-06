import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:prova_flutter/routes/routes.dart';

part 'login.g.dart';

class Login = _Login with _$Login;

abstract class _Login with Store {
  @observable
  bool loading = false;

  @action
  void updateLoading() {
    loading = !loading;
  }

  @action
  navigateForward({required context}) async {
    updateLoading();

    await Future.delayed(const Duration(seconds: 3));

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => Routes.home),
    );
  }
}
