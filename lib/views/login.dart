import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:url_launcher/url_launcher_string.dart';

import '../stores/login.dart';

final loginController = Login();

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void abrirUrl() async {
    const url = 'https://google.com.br/';
    await launchUrlString(url);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextButton(
              child: const Text(
                'Política de Privacidade',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: () {
                abrirUrl();
              },
            ),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
            stops: [0.1, 0.9],
            colors: [
              Color.fromARGB(255, 33, 77, 92),
              Color.fromARGB(255, 52, 146, 130),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 36.0),
                  child: buildUsernameAndPassword(),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      bottom: 8, top: 8, left: 96, right: 96),
                  child: InkWell(
                    onTap: () async {
                      if (_formKey.currentState!.validate()) {
                        await loginController.navigateForward(context: context);
                      }
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 68, 189, 110),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      alignment: Alignment.bottomCenter,
                      margin: const EdgeInsets.only(top: 25),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Observer(
                          builder: (context) => loginController.loading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                              : const Text(
                                  'Entrar',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildUsernameAndPassword() => AutofillGroup(
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Usuário',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: usernameController,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                    ),
                    prefixIcon: const Icon(
                      Icons.person_sharp,
                      color: Colors.black,
                    ),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Campo não preenchido';
                    }
                    if (value.endsWith(' ')) {
                      return 'Não pode conter espaço em branco no fim';
                    }
                    if (value.length > 20) {
                      return 'Usuario não pode ser maior que 20 caracteres';
                    }
                    if (value.length < 2) {
                      return 'Senha não pode ser menor que 2 caracteres';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 12),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Senha',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: Colors.transparent,
                        width: 0,
                      ),
                    ),
                    prefixIcon: const Icon(Icons.lock, color: Colors.black),
                  ),
                  onEditingComplete: () {
                    FocusScope.of(context).nextFocus();
                  },
                  keyboardType: TextInputType.visiblePassword,
                  validator: (value) {
                    var r = RegExp(r'^(?=.*[a-zA-Z])(?=.*[0-9])[a-zA-Z0-9]+$');

                    if (value == null || value.isEmpty) {
                      return 'Campo não preenchido';
                    }
                    if (!r.hasMatch(value)) {
                      return 'Senha não compatível';
                    }
                    if (value.length < 2) {
                      return 'Senha não pode ser menor que 2 caracteres';
                    }
                    if (value.endsWith(' ')) {
                      return 'Não pode conter espaço em branco no fim';
                    }
                    if (value.length > 20) {
                      return 'Senha não pode ser maior que 20 caracteres';
                    }

                    return null;
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
