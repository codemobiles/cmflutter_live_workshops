import 'package:cmflutter0/src/pages/login/login_page.dart';
import 'package:flutter/material.dart';

class CMApp extends StatelessWidget {
  const CMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CMApp",
      home: LoginPage(),
    );
  }
}