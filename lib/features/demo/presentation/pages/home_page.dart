import 'package:flutter/material.dart';
import 'package:version_3_22_8/core/datasources/remote/impl/fetch_potos.dart';
import 'package:version_3_22_8/features/demo/presentation/domain/entities/poto.dart';
import 'package:version_3_22_8/features/demo/presentation/pages/widget/poto_list.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<Photo>> futurePhotos;

  @override
  void initState() {
    super.initState();
    futurePhotos = fetchPhotos(http.Client());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("rr"),
        ),
        body: FutureBuilder<List<Photo>>(builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('An error has occurred!'));
          } else if (snapshot.hasData) {
            return PhotoList(photos: snapshot.data!);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }));
  }
}
