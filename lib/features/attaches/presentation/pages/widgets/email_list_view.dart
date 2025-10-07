import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/attaches/presentation/models/attachements.dart';
import 'package:version_3_22_8/features/attaches/presentation/pages/widgets/email_widget.dart';
import 'package:version_3_22_8/features/attaches/presentation/models/data.dart'
    as data;
import 'package:version_3_22_8/features/attaches/presentation/pages/widgets/search_bar.dart'
    as searchbar;

class EmailListView extends StatelessWidget {
  const EmailListView(
      {Key? key,
      required this.currentUser,
      this.onSelected,
      this.selectedIndex})
      : super(key: key);

  final int? selectedIndex;
  final ValueChanged<int>? onSelected;
  final User currentUser;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListView(
        children: [
          const SizedBox(height: 8),
          searchbar.SearchBar(currentUser: currentUser),
          const SizedBox(height: 8),
          ...List.generate(data.emails.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: EmailWidget(
                email: data.emails[index],
                onSelected: onSelected != null
                    ? () {
                        onSelected!(index);
                      }
                    : null,
                isSelected: selectedIndex == index,
              ),
            );
          }),
        ],
      ),
    );
  }
}
