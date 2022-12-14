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

          // Low Performance
          // return Column(
          //   crossAxisAlignment: CrossAxisAlignment.start,
          //   children: [...youtubes!.map((e) => Text(e.title))],
          // );

          // Better Performance
          return ListView.builder(
            itemCount: youtubes!.length,
            itemBuilder: ((context, index) {
              return TextButton(
                onPressed: () => print(youtubes![index].title),
                child: Card(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(youtubes![index].title),
                      Image.network(youtubes![index].youtubeImage)
                    ],
                  ),
                ),
              );
            }),
          );
        }),
      )),
    );
  }
}
