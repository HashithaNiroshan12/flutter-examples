import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version_3_22_8/features/provider_state/presentation/domain/item.dart';
import 'package:version_3_22_8/features/provider_state/presentation/provider/item_provider.dart';

class DialogPage extends StatelessWidget {
  const DialogPage({Key? key}) : super(key: key);

  void showDialogBox(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        String item = '';
        return AlertDialog(
          title: const Text('Add Item'),
          content: TextField(
            onChanged: (value) {
              item = value;
            },
            decoration: const InputDecoration(hintText: 'Enter item name'),
          ),
          actions: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(primary: Colors.green),
              onPressed: () {
                if (item.isNotEmpty) {
                  Provider.of<ItemData>(context, listen: false)
                      .addItem(Item(item: item));
                  Navigator.pop(context);
                }
              },
              child: const Text('Add'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}
