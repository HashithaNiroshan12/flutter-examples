import 'package:flutter/material.dart';
import 'package:version_3_22_8/features/attaches/presentation/models/attachements.dart';
import 'package:version_3_22_8/features/attaches/presentation/pages/widgets/email_reply_option.dart';
import 'package:version_3_22_8/features/attaches/presentation/pages/widgets/star_button.dart';

class EmailContent extends StatefulWidget {
  const EmailContent({
    super.key,
    required this.email,
    required this.isPreview,
    required this.isThreaded,
    required this.isSelected,
  });

  final Email email;
  final bool isPreview;
  final bool isThreaded;
  final bool isSelected;

  @override
  State<EmailContent> createState() => _EmailContentState();
}

class _EmailContentState extends State<EmailContent> {
  late final ColorScheme _colorScheme = Theme.of(context).colorScheme;
  late final TextTheme _textTheme = Theme.of(context).textTheme;

  Widget get contentSpacer => SizedBox(height: widget.isThreaded ? 20 : 2);

  String get lastActiveLabel {
    final DateTime now = DateTime.now();
    final DateTime lastActive = widget.email.sender.lastActive;

    if (lastActive.isAfter(now)) return '0s ago';

    final Duration elapsedTime = now.difference(lastActive);
    if (elapsedTime.inSeconds < 60) return '${elapsedTime.inSeconds}s';
    if (elapsedTime.inMinutes < 60) return '${elapsedTime.inMinutes}m';
    if (elapsedTime.inHours < 24) return '${elapsedTime.inHours}h';
    if (elapsedTime.inDays < 365) return '${elapsedTime.inDays}d';
    return '1y+';
  }

  TextStyle? get contentTextStyle {
    if (widget.isThreaded) {
      return _textTheme.bodyLarge;
    } else if (widget.isSelected) {
      return _textTheme.bodyMedium?.copyWith(
        color: _colorScheme.onPrimaryContainer,
      );
    } else {
      return _textTheme.bodyMedium?.copyWith(
        color: _colorScheme.onSurfaceVariant,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          LayoutBuilder(
            builder: (context, constraints) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  if (constraints.maxWidth - 200 > 0) ...[
                    CircleAvatar(
                      backgroundImage: AssetImage(
                        widget.email.sender.avatarUrl,
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 6.0),
                    ),
                  ],
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.email.sender.name.fullName,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: widget.isSelected
                              ? _textTheme.labelMedium?.copyWith(
                                  color: _colorScheme.onSecondaryContainer,
                                )
                              : _textTheme.labelMedium?.copyWith(
                                  color: _colorScheme.onSurface,
                                ),
                        ),
                        Text(
                          lastActiveLabel,
                          overflow: TextOverflow.fade,
                          maxLines: 1,
                          style: widget.isSelected
                              ? _textTheme.labelMedium?.copyWith(
                                  color: _colorScheme.onSecondaryContainer,
                                )
                              : _textTheme.labelMedium?.copyWith(
                                  color: _colorScheme.onSurfaceVariant,
                                ),
                        ),
                      ],
                    ),
                  ),
                  if (constraints.maxWidth - 200 > 0) ...[const StarButton()],
                ],
              );
            },
          ),
          const SizedBox(width: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (widget.isPreview) ...[
                Text(
                  widget.email.subject,
                  style: const TextStyle(
                    fontSize: 18,
                  ).copyWith(color: _colorScheme.onSurface),
                ),
              ],
              if (widget.isThreaded) ...[
                contentSpacer,
                Text(
                  "To ${widget.email.recipients.map((recipient) => recipient.name.first).join(", ")}",
                  style: _textTheme.bodyMedium,
                ),
              ],
              contentSpacer,
              Text(
                widget.email.content,
                maxLines: widget.isPreview ? 2 : 100,
                overflow: TextOverflow.ellipsis,
                style: contentTextStyle,
              ),
            ],
          ),
          const SizedBox(width: 12),
          widget.email.attachments.isNotEmpty
              ? Container(
                  height: 96,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(widget.email.attachments.first.url),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
          if (!widget.isPreview) ...[const EmailReplyOptions()],
        ],
      ),
    );
  }
}
