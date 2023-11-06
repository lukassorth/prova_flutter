import 'package:flutter/material.dart';
import 'package:prova_flutter/views/login.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Prova Flutter',
      theme: ThemeData(
        colorSchemeSeed: Colors.black,
      ),
      home: const LoginView(),
    );
  }
}
