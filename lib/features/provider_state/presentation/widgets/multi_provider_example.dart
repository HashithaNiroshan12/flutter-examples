import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version_3_22_8/features/provider_state/presentation/provider/cat_provider.dart';
import 'package:version_3_22_8/features/provider_state/presentation/provider/user_provider.dart';
import 'package:version_3_22_8/features/provider_state/presentation/widgets/page_one.dart';

class MultiProviderExample extends StatelessWidget {
  const MultiProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => CatProvider(),
        ),
        ChangeNotifierProvider(create: ((context) => UserProvider()))
      ],
      child: PageOne(),
    );
  }
}
