import 'package:flutter/material.dart';
import 'package:kaliro_chat_ui/kaliro_chat_ui.dart';

///[ThreadedMessageStyle] is a data class that has styling-related properties
///to customize the appearance of [CometChatThreadedMessages]
class ThreadedMessageStyle extends BaseStyles {
  ///[closeIconTint] sets color for close icon
  final Color? closeIconTint;

  ///[titleStyle] sets TextStyle for title
  final TextStyle? titleStyle;

  const ThreadedMessageStyle({
    super.width,
    super.height,
    super.background,
    super.border,
    super.borderRadius,
    super.gradient,
    this.titleStyle,
    this.closeIconTint,
  });
}
