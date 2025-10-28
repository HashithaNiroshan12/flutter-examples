import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version_3_22_8/features/provider_state/presentation/domain/item.dart';
import 'package:version_3_22_8/features/provider_state/presentation/pages/item_list.dart';
import 'package:version_3_22_8/features/provider_state/presentation/provider/item_provider.dart';
import 'package:version_3_22_8/features/provider_state/presentation/widgets/show_dialog_widget.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Demo'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: ListItem(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        showDialog(
          context: context,
          builder: (context) {
            String item = ''; // Variable to store the entered item name
            return AlertDialog(
              title: const Text('Add Item'),
              content: TextField(
                onChanged: (value) {
                  item = value; // Updates the item name as the user types
                },
                decoration: const InputDecoration(
                    hintText:
                        'Enter item name'), // Hint text for the input field
              ),
              actions: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                  ),
                  onPressed: () {
                    if (item.isNotEmpty) {
                      // Adds the item to the list if the input is not empty
                      Provider.of<ItemData>(context, listen: false)
                          .addItem(Item(item: item));
                      Navigator.pop(context); // Closes the dialog
                    }
                  },
                  child: const Text('Add'),
                ),
              ],
            );
          },
        );
      }),
    );
  }
}
