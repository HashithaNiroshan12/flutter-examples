import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/attaches/presentation/models/attachements.dart';
import 'package:version_3_22_8/features/attaches/presentation/pages/widgets/email_content.dart';
import 'package:version_3_22_8/features/attaches/presentation/pages/widgets/email_headline.dart';

enum EmailType { preview, threaded, primaryThreaded }

class EmailWidget extends StatefulWidget {
  const EmailWidget({
    Key? key,
    required this.email,
    this.isSelected = false,
    this.isPreview = true,
    this.isThreaded = false,
    this.showHeadline = false,
    this.onSelected,
  }) : super(key: key);

  final bool isSelected;
  final bool isPreview;
  final bool showHeadline;
  final bool isThreaded;
  final void Function()? onSelected;
  final Email email;

  @override
  State<EmailWidget> createState() => _EmailWidgetState();
}

class _EmailWidgetState extends State<EmailWidget> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  late Color unselectedColor = Color.alphaBlend(
    _colorScheme.primary.withAlpha(20),
    _colorScheme.surface,
  );

  Color get _surfaceColor {
    if (!widget.isPreview) {
      return _colorScheme.surface;
    } else if (widget.isSelected) {
      return _colorScheme.primaryContainer;
    } else {
      return unselectedColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onSelected,
      child: Card(
        elevation: 0,
        color: _surfaceColor,
        clipBehavior: Clip.hardEdge,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (widget.showHeadline) ...[
              EmailHeadline(email: widget.email, isSelected: widget.isSelected),
            ],
            EmailContent(
              email: widget.email,
              isPreview: widget.isPreview,
              isThreaded: widget.isThreaded,
              isSelected: widget.isSelected,
            ),
          ],
        ),
      ),
    );
  }
}
