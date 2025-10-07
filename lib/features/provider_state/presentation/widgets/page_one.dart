import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version_3_22_8/features/provider_state/presentation/provider/cat_provider.dart';
import 'package:version_3_22_8/features/provider_state/presentation/provider/user_provider.dart';

class PageOne extends StatelessWidget {
  const PageOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final catProvider = Provider.of<CatProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page One'),
      ),
      body: Column(
        children: [

          Consumer<UserProvider>(
            builder: (context, userProvider, child) {
              return Text("Information Consumer ${userProvider.user}");
          
            }),
          Text(
            "Information Provider ${userProvider.user}",
          ),
          ElevatedButton(
              onPressed: () {
                catProvider.catName = "Jimmy";
                userProvider.user = "Niroshan";
              },
              child: const Text("update info User"))
        ],
      ),
    );
  }
}
