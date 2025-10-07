import 'dart:io';

import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/persistence/presentation/domain/usecase/counter_storage.dart';

class CounterStorage extends StatefulWidget {
  const CounterStorage({Key? key, required this.storage}) : super(key: key);

  final CounterStorageusecase storage;

  @override
  State<CounterStorage> createState() => _CounterStorageState();
}

class _CounterStorageState extends State<CounterStorage> {
  int counter = 0;

  @override
  void initState() {
    super.initState();

    widget.storage.readCounter().then((value) {
      setState(() {
        counter = value;
      });
    });
  }

  Future<File> _incrementCounter() {
    setState(() {
      counter++;
    });

    // Write the variable as a string to the file.
    return widget.storage.writeCounter(counter);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Reading and Writing Files')),
      body: Center(
        child: Text('Button tapped $counter time${counter == 1 ? '' : 's'}.'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
