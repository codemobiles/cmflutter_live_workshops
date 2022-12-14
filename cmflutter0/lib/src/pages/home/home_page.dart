import 'package:cmflutter0/src/services/webapi_service.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    WebApiService().feed();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("HomePage"),
      ),
      body: Container(
          child: FutureBuilder(
        future: WebApiService().feed(),
        builder: ((context, snapshot) {
          if (snapshot.hasData == false) {
            return Text("Loading...");
          }

          final youtubes = snapshot.data;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [...youtubes!.map((e) => Text(e.title))],
          );
        }),
      )),
    );
  }
}
