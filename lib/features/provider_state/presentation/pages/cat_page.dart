import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version_3_22_8/features/provider_state/presentation/provider/cat_provider.dart';

class CatPage extends StatelessWidget {
  const CatPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CatProvider(),
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Cat Page'),
          ),
          body: Container()),
    );
  }
}
