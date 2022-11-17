import 'package:flutter/material.dart';

void main() {
  runApp(const CMApp());
}

class CMApp extends StatelessWidget {
  const CMApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "CMApp",
      home: Text("CodeMobiles"),
    );
  }
}
