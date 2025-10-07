import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version_3_22_8/features/provider_state/presentation/pages/counter_page.dart';
import 'package:version_3_22_8/features/provider_state/presentation/provider/counter_provider.dart';

class ProviderExample extends StatelessWidget {
  const ProviderExample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterProvider(),
      child: const Scaffold(
        body: CounterPage(),
      ),
    );
  }
}
