import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:version_3_22_8/features/provider_state/presentation/provider/item_provider.dart';

class ListItem extends StatelessWidget {
  const ListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(builder: (context, data, child) {
      return ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemCount: data.size,
          itemBuilder: (context, index) {
            final item = data.items[index];
            return GestureDetector(
              onLongPress: (() => data.removeItem(item)),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.blueGrey,
                    child: Text(item.item![0]),
                  ),
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item.item ?? "",
                        style: TextStyle(
                            decoration: item.completed
                                ? TextDecoration.lineThrough
                                : null,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      ),
                      Checkbox(
                          value: item.completed,
                          onChanged: (chnaged) => {data.toggleItem(item)})
                    ],
                  ),
                ),
              ),
            );
          });
    });
  }
}
